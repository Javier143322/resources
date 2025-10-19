fx_version 'cerulean'
game 'gta5'

author 'TuNombre'
description 'Mega Mercado - Sistema de Venta de Alimentos'
version '1.0.0'

ui_page 'html/index.html'

client_scripts {
    'config.lua',
    'client/main.lua'
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'config.lua',
    'server/main.lua'
}

files {
    'html/index.html',
    'html/css/style.css',
    'html/js/script.js',
    'html/images/*.png'
}

dependencies {
    'es_extended',
    'mysql-async'
}
