fx_version 'adamant'

game 'gta5'
lua54 'yes'
author 'poorcuz'

shared_script '@es_extended/imports.lua'
shared_script 'config/**.lua'

server_scripts {
	'server/**/**.lua'
}

client_scripts {
	'client/**/**.lua'
}