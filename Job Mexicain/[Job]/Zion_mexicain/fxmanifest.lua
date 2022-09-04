fx_version 'cerulean'
games { 'gta5' };

client_scripts {
    "src/RMenu.lua",
    "src/menu/RageUI.lua",
    "src/menu/Menu.lua",
    "src/menu/MenuController.lua",
    "src/components/*.lua",
    "src/menu/elements/*.lua",
    "src/menu/items/*.lua",
    "src/menu/panels/*.lua",
    "src/menu/windows/*.lua",
}

client_scripts {
    '@es_extended/locale.lua',
    'client/client/cl_boss.lua',
    'client/client/cl_coffre.lua',
    'client/client/cl_cuisine.lua',
    'client/client/cl_garage.lua',
    'client/client/cl_menu.lua',
    'client/client/cl_frites.lua',
    'client/client/cl_boisson.lua',
   'client/client/cl_coupe.lua',
    'client/farms/cl_farms.lua',
}

server_script {
    'server/server.lua',
}

dependencies {
	'es_extended'
}