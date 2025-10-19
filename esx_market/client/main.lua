local ESX = nil
local isMarketOpen = false
local currentMarket = nil
local marketBlips = {}
local marketNPCs = {}

-- Inicializar ESX
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(100)
    end
    CreateMarketBlips()
    SpawnMarketNPCs()
end)

-- Crear blips del mercado
function CreateMarketBlips()
    for i, location in ipairs(Config.Locations) do
        if location.blip then
            local blip = AddBlipForCoord(location.coords.x, location.coords.y, location.coords.z)
            SetBlipSprite(blip, Config.Market.blip.sprite)
            SetBlipColour(blip, Config.Market.blip.color)
            SetBlipScale(blip, Config.Market.blip.scale)
            SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(Config.Market.name)
            EndTextCommandSetBlipName(blip)
            marketBlips[i] = blip
        end
    end
end

-- Spawnear NPCs
function SpawnMarketNPCs()
    for i, location in ipairs(Config.Locations) do
        if location.npc then
            RequestModel(Config.Market.npcModel)
            while not HasModelLoaded(Config.Market.npcModel) do
                Citizen.Wait(10)
            end
            
            local npc = CreatePed(4, Config.Market.npcModel, location.coords.x, location.coords.y, location.coords.z - 1.0, location.coords.w or 0.0, false, true)
            SetEntityInvincible(npc, true)
            SetBlockingOfNonTemporaryEvents(npc, true)
            FreezeEntityPosition(npc, true)
            
            if Config.Market.npcAnimation then
                TaskStartScenarioInPlace(npc, Config.Market.npcAnimation, -1, true)
            end
            
            marketNPCs[i] = npc
        end
    end
end

-- Verificar proximidad a los mercados
Citizen.CreateThread(function()
    while true do
        local playerCoords = GetEntityCoords(PlayerPedId())
        local sleep = 1000
        
        for i, location in ipairs(Config.Locations) do
            local distance = #(playerCoords - location.coords)
            
            if distance < 10.0 then
                sleep = 100
                
                if distance < 2.0 and not isMarketOpen then
                    ESX.ShowHelpNotification("Presiona ~INPUT_CONTEXT~ para abrir el mercado")
                    
                    if IsControlJustReleased(0, 38) then
                        OpenMarketMenu(location)
                    end
                end
            end
        end
        
        Citizen.Wait(sleep)
    end
end)

-- Abrir menú del mercado
function OpenMarketMenu(location)
    currentMarket = location
    isMarketOpen = true
    
    ESX.TriggerServerCallback('esx_market:getPlayerInventory', function(inventory)
        SetNuiFocus(true, true)
        SendNUIMessage({
            action = 'openMarket',
            marketName = Config.Market.name,
            categories = Config.Categories,
            products = Config.Products,
            playerMoney = inventory.money,
            playerInventory = inventory.items
        })
    end)
end

-- Cerrar menú del mercado
function CloseMarketMenu()
    isMarketOpen = false
    currentMarket = nil
    SetNuiFocus(false, false)
    SendNUIMessage({action = 'closeMarket'})
end

-- Comprar productos
function BuyProducts(products)
    ESX.TriggerServerCallback('esx_market:buyProducts', function(success, message)
        if success then
            ESX.ShowNotification(message)
            CloseMarketMenu()
        else
            ESX.ShowNotification(message)
        end
    end, products, currentMarket)
end

-- Callbacks NUI
RegisterNUICallback('buyProducts', function(data, cb)
    BuyProducts(data.products)
    cb('ok')
end)

RegisterNUICallback('closeMarket', function(data, cb)
    CloseMarketMenu()
    cb('ok')
end)

-- Comando para abrir mercado
RegisterCommand('mercado', function()
    if not isMarketOpen then
        OpenMarketMenu(Config.Locations[1])
    end
end, false)

-- Limpieza al salir
AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        CloseMarketMenu()
        
        for _, npc in pairs(marketNPCs) do
            if DoesEntityExist(npc) then
                DeleteEntity(npc)
            end
        end
        
        for _, blip in pairs(marketBlips) do
            if DoesBlipExist(blip) then
                RemoveBlip(blip)
            end
        end
    end
end)
