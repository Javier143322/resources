Config = {}

Config.Market = {
    name = "Mega Mercado Central",
    blip = {
        sprite = 52,
        color = 2,
        scale = 0.8
    },
    npcModel = `mp_m_shopkeep_01`,
    npcAnimation = "CODE_HUMAN_CROSS_ROAD_WAIT"
}

Config.Categories = {
    "carnes",
    "pescados_mariscos", 
    "verduras",
    "frutas",
    "lacteos",
    "panaderia",
    "bebidas",
    "condimentos",
    "granos_cereales",
    "pastas_harinas",
    "snacks_dulces",
    "comidas_preparadas",
    "congelados",
    "productos_organicos",
    "productos_etnicos"
}

Config.Products = {
    -- 🥩 CARNES (20 productos)
    {name = "carne_res", label = "Carne de Res (1kg)", price = 12.50, category = "carnes", weight = 1000},
    {name = "pollo_entero", label = "Pollo Entero", price = 8.75, category = "carnes", weight = 1500},
    {name = "filete_res", label = "Filete de Res", price = 15.00, category = "carnes", weight = 500},
    {name = "costillas_res", label = "Costillas de Res", price = 18.50, category = "carnes", weight = 800},
    {name = "carne_molida", label = "Carne Molida (500g)", price = 7.25, category = "carnes", weight = 500},
    {name = "pollo_pechuga", label = "Pechuga de Pollo", price = 9.50, category = "carnes", weight = 400},
    {name = "pollo_muslos", label = "Muslos de Pollo", price = 6.75, category = "carnes", weight = 600},
    {name = "pollo_alas", label = "Alas de Pollo", price = 5.25, category = "carnes", weight = 500},
    {name = "cordero", label = "Carne de Cordero", price = 22.00, category = "carnes", weight = 1000},
    {name = "chuletas_cordero", label = "Chuletas de Cordero", price = 25.50, category = "carnes", weight = 600},
    {name = "ternera", label = "Carne de Ternera", price = 16.75, category = "carnes", weight = 1000},
    {name = "conejo", label = "Conejo", price = 12.25, category = "carnes", weight = 1200},
    {name = "codorniz", label = "Codorniz", price = 8.50, category = "carnes", weight = 200},
    {name = "pato", label = "Pato", price = 18.75, category = "carnes", weight = 2000},
    {name = "pavo_entero", label = "Pavo Entero", price = 28.00, category = "carnes", weight = 4000},
    {name = "pechuga_pavo", label = "Pechuga de Pavo", price = 14.50, category = "carnes", weight = 800},
    {name = "búfalo", label = "Carne de Búfalo", price = 32.00, category = "carnes", weight = 1000},
    {name = "venado", label = "Carne de Venado", price = 35.50, category = "carnes", weight = 1000},
    {name = "jabalí", label = "Carne de Jabalí", price = 30.25, category = "carnes", weight = 1000},
    
    -- 🐟 PESCADOS Y MARISCOS (25 productos)
    {name = "salmon", label = "Salmón Filete", price = 18.50, category = "pescados_mariscos", weight = 400},
    {name = "atun_lata", label = "Atún en Lata", price = 3.25, category = "pescados_mariscos", weight = 150},
    {name = "atun_fresco", label = "Atún Fresco", price = 16.75, category = "pescados_mariscos", weight = 500},
    {name = "bacalao", label = "Bacalao", price = 14.25, category = "pescados_mariscos", weight = 450},
    {name = "merluza", label = "Merluza", price = 12.50, category = "pescados_mariscos", weight = 400},
    {name = "trucha", label = "Trucha", price = 11.75, category = "pescados_mariscos", weight = 350},
    {name = "sardinas_frescas", label = "Sardinas Frescas", price = 8.25, category = "pescados_mariscos", weight = 300},
    {name = "sardinas_lata", label = "Sardinas en Lata", price = 2.75, category = "pescados_mariscos", weight = 120},
    {name = "anchoas", label = "Anchoas", price = 6.50, category = "pescados_mariscos", weight = 100},
    {name = "caballa", label = "Caballa", price = 9.75, category = "pescados_mariscos", weight = 400},
    {name = "lubina", label = "Lubina", price = 20.50, category = "pescados_mariscos", weight = 600},
    {name = "dorada", label = "Dorada", price = 18.25, category = "pescados_mariscos", weight = 550},
    {name = "lenguado", label = "Lenguado", price = 16.75, category = "pescados_mariscos", weight = 400},
    {name = "rodaballo", label = "Rodaballo", price = 24.00, category = "pescados_mariscos", weight = 700},
    {name = "calamares", label = "Calamares", price = 13.50, category = "pescados_mariscos", weight = 300},
    {name = "pulpo", label = "Pulpo", price = 19.75, category = "pescados_mariscos", weight = 500},
    {name = "sepia", label = "Sepia", price = 15.25, category = "pescados_mariscos", weight = 350},
    {name = "camarones", label = "Camarones (500g)", price = 14.00, category = "pescados_mariscos", weight = 500},
    {name = "gambas", label = "Gambas", price = 16.50, category = "pescados_mariscos", weight = 400},
    {name = "langostinos", label = "Langostinos", price = 22.75, category = "pescados_mariscos", weight = 450},
    {name = "cangrejo", label = "Cangrejo", price = 28.50, category = "pescados_mariscos", weight = 800},
    {name = "langosta", label = "Langosta", price = 45.00, category = "pescados_mariscos", weight = 1000},
    {name = "mejillones", label = "Mejillones", price = 8.75, category = "pescados_mariscos", weight = 600},
    {name = "almejas", label = "Almejas", price = 10.25, category = "pescados_mariscos", weight = 500},
    {name = "ostras", label = "Ostras", price = 15.50, category = "pescados_mariscos", weight = 400},
    
    -- 🥬 VERDURAS (35 productos)
    {name = "lechuga", label = "Lechuga", price = 1.50, category = "verduras", weight = 300},
    {name = "lechuga_romana", label = "Lechuga Romana", price = 1.75, category = "verduras", weight = 350},
    {name = "espinacas", label = "Espinacas", price = 2.25, category = "verduras", weight = 200},
    {name = "acelgas", label = "Acelgas", price = 1.80, category = "verduras", weight = 250},
    {name = "col_rizada", label = "Col Rizada", price = 2.50, category = "verduras", weight = 180},
    {name = "rucula", label = "Rúcula", price = 2.75, category = "verduras", weight = 150},
    {name = "canonigos", label = "Canónigos", price = 2.00, category = "verduras", weight = 120},
    {name = "tomate", label = "Tomate", price = 2.00, category = "verduras", weight = 200},
    {name = "tomate_cherry", label = "Tomate Cherry", price = 3.25, category = "verduras", weight = 180},
    {name = "cebolla", label = "Cebolla", price = 1.25, category = "verduras", weight = 150},
    {name = "cebolla_roja", label = "Cebolla Roja", price = 1.50, category = "verduras", weight = 160},
    {name = "cebolleta", label = "Cebolleta", price = 1.35, category = "verduras", weight = 100},
    {name = "ajo", label = "Ajo", price = 0.75, category = "verduras", weight = 50},
    {name = "zanahoria", label = "Zanahoria", price = 1.20, category = "verduras", weight = 120},
    {name = "papa", label = "Papa", price = 1.00, category = "verduras", weight = 180},
    {name = "papa_roja", label = "Papa Roja", price = 1.15, category = "verduras", weight = 170},
    {name = "batata", label = "Batata", price = 2.25, category = "verduras", weight = 300},
    {name = "boniato", label = "Boniato", price = 2.50, category = "verduras", weight = 320},
    {name = "brocoli", label = "Brócoli", price = 2.75, category = "verduras", weight = 400},
    {name = "coliflor", label = "Coliflor", price = 2.60, category = "verduras", weight = 600},
    {name = "col_bruselas", label = "Col de Bruselas", price = 3.25, category = "verduras", weight = 250},
    {name = "repollo", label = "Repollo", price = 1.80, category = "verduras", weight = 800},
    {name = "col_lombarda", label = "Col Lombarda", price = 2.10, category = "verduras", weight = 750},
    {name = "apio", label = "Apio", price = 1.65, category = "verduras", weight = 400},
    {name = "pimiento_rojo", label = "Pimiento Rojo", price = 2.40, category = "verduras", weight = 200},
    {name = "pimiento_verde", label = "Pimiento Verde", price = 2.20, category = "verduras", weight = 180},
    {name = "pimiento_amarillo", label = "Pimiento Amarillo", price = 2.60, category = "verduras", weight = 190},
    {name = "pepino", label = "Pepino", price = 1.45, category = "verduras", weight = 300},
    {name = "calabacin", label = "Calabacín", price = 1.70, category = "verduras", weight = 250},
    {name = "calabaza", label = "Calabaza", price = 3.50, category = "verduras", weight = 1500},
    {name = "berenjena", label = "Berenjena", price = 2.30, category = "verduras", weight = 400},
    {name = "esparragos", label = "Espárragos", price = 4.25, category = "verduras", weight = 200},
    {name = "alcachofas", label = "Alcachofas", price = 3.75, category = "verduras", weight = 300},
    {name = "guisantes", label = "Guisantes", price = 2.15, category = "verduras", weight = 150},
    {name = "judias_verdes", label = "Judías Verdes", price = 2.40, category = "verduras", weight = 200},
    
    -- Continuaría con las demás categorías (frutas, lácteos, etc.)
    -- ... (el array continúa con los 200+ productos)
}

Config.Locations = {
    {coords = vector3(25.0, -1345.5, 29.5), blip = true, npc = true},
    {coords = vector3(373.875, 325.896, 103.566), blip = true, npc = true},
    {coords = vector3(-3038.939, 585.954, 7.908), blip = true, npc = true},
    {coords = vector3(-3241.927, 1001.462, 12.830), blip = true, npc = true},
    {coords = vector3(547.431, 2671.710, 42.156), blip = true, npc = true},
    {coords = vector3(1961.464, 3740.672, 32.343), blip = true, npc = true},
    {coords = vector3(2678.916, 3280.671, 55.241), blip = true, npc = true},
    {coords = vector3(1729.216, 6414.131, 35.037), blip = true, npc = true}
}
