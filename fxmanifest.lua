fx_version 'cerulean'
game 'gta5'

name "mtc-vehiclerental"
description "A vehicle rental script for qbox & ox_lib"
author "More Than Code"
version "1.0.0"

lua54 'yes'

shared_scripts {
	'@ox_lib/init.lua',
    '@qbx_core/modules/lib.lua',
	'shared/main.lua'
}

client_scripts {
	'@qbx_core/modules/playerdata.lua',
	'client/*.lua'
}

server_scripts {
	'server/*.lua'
}
