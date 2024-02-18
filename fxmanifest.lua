fx_version 'cerulean'
games { 'rdr3', 'gta5' }
lua54 'yes' 

author 'Raven'
description 'Rewrite'
version '2.0'

shared_scripts {
    '@ox_lib/init.lua',
    '@es_extended/imports.lua',
    'Config.lua',
}


client_script {
   'client.lua',
}


server_scripts {
    'server.lua'
}



