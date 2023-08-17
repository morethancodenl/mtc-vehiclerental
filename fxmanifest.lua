fx_version 'cerulean'
game 'gta5'

name "mtc-vehiclerental"
description "A vehicle rental script for qb-core & ox_lib"
author "More Than Code"
version "1.0.0"

lua54 'yes'

shared_scripts {
	'@ox_lib/init.lua',
	'shared/main.lua'
}

client_scripts {
	'client/*.lua'
}

server_scripts {
	'server/*.lua'
}
