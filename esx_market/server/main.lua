
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Obtener inventario del jugador
ESX.RegisterServerCallback('esx_market:getPlayerInventory', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer then
        cb({
            money = xPlayer.getMoney(),
            items = xPlayer.getInventory()
        })
    else
        cb(nil)
    end
end)

-- Comprar productos
ESX.RegisterServerCallback('esx_market:buyProducts', function(source, cb, products, marketLocation)
    local xPlayer = ESX.GetPlayerFromId(source)
    local totalPrice = 0
    local totalWeight = 0
    
    if not xPlayer then
        cb(false, "Error: Jugador no encontrado")
        return
    end
    
    -- Calcular precio total y peso
    for productName, quantity in pairs(products) do
        local product = GetProductByName(productName)
        if product then
            totalPrice = totalPrice + (product.price * quantity)
            totalWeight = totalWeight + (product.weight * quantity)
        end
    end
    
    -- Verificar dinero
    if xPlayer.getMoney() < totalPrice then
        cb(false, "No tienes suficiente dinero")
        return
    end
    
    -- Verificar peso
    if not CanCarryItems(xPlayer, products, totalWeight) then
        cb(false, "No tienes suficiente espacio en el inventario")
        return
    end
    
    -- Procesar compra
    for productName, quantity in pairs(products) do
        local product = GetProductByName(productName)
        if product then
            xPlayer.addInventoryItem(productName, quantity)
        end
    end
    
    -- Cobrar dinero
    xPlayer.removeMoney(totalPrice)
    
    -- Log
    print(("[MERCADO] %s compró productos por $%s"):format(GetPlayerName(source), totalPrice))
    
    cb(true, "Compra realizada - Total: $" .. totalPrice)
end)

-- Función auxiliar: Obtener producto por nombre
function GetProductByName(productName)
    for _, product in ipairs(Config.Products) do
        if product.name == productName then
            return product
        end
    end
    return nil
end

-- Función auxiliar: Verificar si puede llevar los items
function CanCarryItems(xPlayer, products, totalWeight)
    return true
end

-- Agregar items a la base de datos
AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        print("[MERCADO] Mercado de alimentos inicializado")
    end
end)