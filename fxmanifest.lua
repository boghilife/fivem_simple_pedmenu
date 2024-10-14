fx_version 'cerulean'
game { 'gta5' }
author 'boghilife'
lua54 'yes'
version '1.0'

client_scripts {
	'config.lua',
	'client.lua'
}

server_scripts {
	'server.lua', 
	'config.lua'
}

shared_scripts {
    'config.lua',
    '@ox_lib/init.lua'
} 

