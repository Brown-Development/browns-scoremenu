fx_version 'bodacious'
author 'Brown Development'
description 'Score Menu - Online Players List/Player ID'
game 'gta5'
lua54 'yes'
client_scripts {
    'code/client.lua'
}
server_scripts {
    'code/server.lua'
}
shared_scripts {
    '@ox_lib/init.lua',
    'config.lua'
}
escrow_ignore {
    'config.lua'
}
dependencies {
    'ox_lib'
}