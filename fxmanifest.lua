fx_version 'adamant'

game 'gta5'
lua54 'yes'

shared_script '@es_extended/imports.lua'
shared_script 'config/**.lua'

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'server/**/**.lua'
}

client_scripts {
	'client/**/**.lua'
}