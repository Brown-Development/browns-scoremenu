if Config.Framework == 'qb-core' then 
    local QBCore = exports['qb-core']:GetCoreObject()
    QBCore.Functions.CreateCallback('browns:scoremenu', function(source, cb)
        local data = {}
        local src = source 
        local player = QBCore.Functions.GetPlayer(src)
        local players = QBCore.Functions.GetPlayers()
        for _, values in ipairs(players) do
            local netPlayer = QBCore.Functions.GetPlayer(values)
            local playerId = netPlayer.PlayerData.source 
            if Config.IDType == 'citizenid' then
                local playercid = netPlayer.PlayerData.citizenid
                table.insert(data, { playerId = playerId, playercid = playercid })
            elseif Config.IDType == 'license' then  
                local playercid = GetPlayerIdentifierByType(tostring(playerId), 'license')
                table.insert(data, { playerId = playerId, playercid = playercid })
            elseif Config.IDType == 'discord' then 
                local playercid = GetPlayerIdentifierByType(tostring(playerId), 'discord')
                table.insert(data, { playerId = playerId, playercid = playercid })
            elseif Config.IDType == 'steam' then 
                local playercid = GetPlayerIdentifierByType(tostring(playerId), 'steam')
                table.insert(data, { playerId = playerId, playercid = playercid })
            elseif Config.IDType == 'xbl' then 
                local playercid = GetPlayerIdentifierByType(tostring(playerId), 'xbl')
                table.insert(data, { playerId = playerId, playercid = playercid })
            elseif Config.IDType == 'liveid' then 
                local playercid = GetPlayerIdentifierByType(tostring(playerId), 'liveid')
                table.insert(data, { playerId = playerId, playercid = playercid })
            elseif Config.IDType == 'ip' then 
                local playercid = GetPlayerIdentifierByType(tostring(playerId), 'ip')
                table.insert(data, { playerId = playerId, playercid = playercid })
            end
        end
        cb(data)
    end)
elseif Config.Framework == 'esx' then
    local ESX = exports['es_extended']:getSharedObject()
    ESX.RegisterServerCallback('browns:scoremenu', function(source, cb)
        local data = {}
        local src = source 
        local player = ESX.GetPlayerFromId(src)
        local players = ESX.GetExtendedPlayers() 
        for _, values in ipairs(players) do
            local playerId = values.playerId
            if Config.IDType == 'identifier' then
                local playercid = values.identifier
                table.insert(data, { playerId = playerId, playercid = playercid })
            elseif Config.IDType == 'license' then  
                local playercid = GetPlayerIdentifierByType(tostring(playerId), 'license')
                table.insert(data, { playerId = playerId, playercid = playercid })
            elseif Config.IDType == 'discord' then 
                local playercid = GetPlayerIdentifierByType(tostring(playerId), 'discord')
                table.insert(data, { playerId = playerId, playercid = playercid })
            elseif Config.IDType == 'steam' then 
                local playercid = GetPlayerIdentifierByType(tostring(playerId), 'steam')
                table.insert(data, { playerId = playerId, playercid = playercid })
            elseif Config.IDType == 'xbl' then 
                local playercid = GetPlayerIdentifierByType(tostring(playerId), 'xbl')
                table.insert(data, { playerId = playerId, playercid = playercid })
            elseif Config.IDType == 'liveid' then 
                local playercid = GetPlayerIdentifierByType(tostring(playerId), 'liveid')
                table.insert(data, { playerId = playerId, playercid = playercid })
            elseif Config.IDType == 'ip' then 
                local playercid = GetPlayerIdentifierByType(tostring(playerId), 'ip')
                table.insert(data, { playerId = playerId, playercid = playercid })
            end
        end
        cb(data)
    end)
elseif Config.Framework == 'ox_core' then 
    local file = ('imports/%s.lua'):format(IsDuplicityVersion() and 'server' or 'client')
    local import = LoadResourceFile('ox_core', file)
    local chunk = assert(load(import, ('@@ox_core/%s'):format(file)))
    chunk()
    lib.callback.register('browns:scoremenu', function(source)
        local data = {}
        local src = source 
        local player = Ox.GetPlayer(src)
        local players = Ox.GetPlayers()
        for _, values in ipairs(players) do
            local playerId = values.source
            if Config.IDType == 'stateid' then
                local playercid = values.stateId
                table.insert(data, { playerId = playerId, playercid = playercid })
            elseif Config.IDType == 'license' then  
                local playercid = GetPlayerIdentifierByType(tostring(playerId), 'license')
                table.insert(data, { playerId = playerId, playercid = playercid })
            elseif Config.IDType == 'discord' then 
                local playercid = GetPlayerIdentifierByType(tostring(playerId), 'discord')
                table.insert(data, { playerId = playerId, playercid = playercid })
            elseif Config.IDType == 'steam' then 
                local playercid = GetPlayerIdentifierByType(tostring(playerId), 'steam')
                table.insert(data, { playerId = playerId, playercid = playercid })
            elseif Config.IDType == 'xbl' then 
                local playercid = GetPlayerIdentifierByType(tostring(playerId), 'xbl')
                table.insert(data, { playerId = playerId, playercid = playercid })
            elseif Config.IDType == 'liveid' then 
                local playercid = GetPlayerIdentifierByType(tostring(playerId), 'liveid')
                table.insert(data, { playerId = playerId, playercid = playercid })
            elseif Config.IDType == 'ip' then 
                local playercid = GetPlayerIdentifierByType(tostring(playerId), 'ip')
                table.insert(data, { playerId = playerId, playercid = playercid })
            end
        end
        return data
    end)
end
