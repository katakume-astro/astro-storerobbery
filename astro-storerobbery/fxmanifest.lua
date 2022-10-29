-- FX Information
fx_version 'cerulean'
lua54 'yes'
game 'gta5'

-- Resource Information
name 'astro-store-robbery'
author 'katakume#5873'
version '1.0.0'

client_scripts {
	'client/*.lua'
}

server_scripts {
	'server/*.lua'
}

shared_scripts {
    '@ox_lib/init.lua',
    '@es_extended/imports.lua'
}

dependencies {
    'oxmysql',
    'Astro-NotifySystem',
    'ox_lib',
    'ox_target',
    'es_extended'
}
