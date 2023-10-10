Config = {}
Config.Framework = 'esx' -- 'qb-core' or 'esx', or 'ox_core'
Config.Keyboard = 'U' -- the keybind to open the score menu [REQUIRED]
Config.Command = 'score' -- the command to open the score menu [REQUIRED]
Config.Distance = 20.0 -- Distance between players that they must be within to see other players ID  
--**ID TYPES**--
-- 'citizenid' (qb-core)
-- 'identifier' (esx)
-- 'stateid' -- (ox_core)
-- 'license' -- (standalone)
-- 'steam' -- (standalone)
-- 'discord' -- (standalone)
-- 'xbl' -- (standalone)
-- 'liveid' -- (standalone)
-- 'ip' -- (standalone)
Config.IDType = 'license'