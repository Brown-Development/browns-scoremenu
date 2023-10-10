local playerData = {}
RegisterCommand(Config.Command, function(source)
    if Config.Framework == 'qb-core' then 
        local QBCore = exports['qb-core']:GetCoreObject()
        QBCore.Functions.TriggerCallback('browns:scoremenu', function(data)
            playerData = {}
            for _, info in ipairs(data) do 
                local id = info.playerId 
                local cid = info.playercid 
                local menuList = {
                    label = 'Server ID: ['..tostring(id)..']'..'\n'..'Identifier: ['..tostring(cid)..']',
                    icon = 'fa-solid fa-users'
                }
                table.insert(playerData, menuList)
            end
            lib.registerMenu({
                id = 'browns_scoremenu',
                title = 'Online Players',
                options = playerData,
                position = 'top-right'
            })
            lib.showMenu('browns_scoremenu')
            local showDraw = false
            local showNetDraw = false
            Citizen.CreateThread(function()
                while true do 
                    Citizen.Wait(0)
                    if lib.getOpenMenu() == 'browns_scoremenu' then
                        local nearbyPlayers = GetNearbyPlayers()
                        for _, online in pairs(nearbyPlayers) do
                            local x, y, z = table.unpack(online.coords)
                            local distance = #(online.coords - GetEntityCoords(PlayerPedId()))
                            if distance <= Config.Distance then 
                                QBCore.Functions.DrawText3D(x, y, z + 1.1, '[~r~ '..tostring(online.Id)..' ~w~]')
                                showNetDraw = true
                            else
                                QBCore.Functions.DrawText3D(GetEntityCoords(PlayerPedId()).x, GetEntityCoords(PlayerPedId()).y, GetEntityCoords(PlayerPedId()).z + 1.1, '[~r~ '..tostring(GetPlayerServerId(PlayerId()))..' ~w~]')
                                showNetDraw = false
                            end
                        end
                        showDraw = true 
                    else
                        showDraw = false 
                    end
                end
            end)
        end)
    elseif Config.Framework == 'esx' then 
        local ESX = exports['es_extended']:getSharedObject()
        ESX.TriggerServerCallback('browns:scoremenu', function(data)
            playerData = {}
            for _, info in ipairs(data) do 
                local id = info.playerId 
                local cid = info.playercid 
                local menuList = {
                    label = 'Server ID: ['..tostring(id)..']'..'\n'..'Identifier: ['..tostring(cid)..']',
                    icon = 'fa-solid fa-users'
                }
                table.insert(playerData, menuList)
            end
            lib.registerMenu({
                id = 'browns_scoremenu',
                title = 'Online Players',
                options = playerData,
                position = 'top-right'
            })
            lib.showMenu('browns_scoremenu')
            local showDraw = false
            local showNetDraw = false
            Citizen.CreateThread(function()
                while true do 
                    Citizen.Wait(0)
                    if lib.getOpenMenu() == 'browns_scoremenu' then
                        local nearbyPlayers = GetNearbyPlayers()
                        for _, online in pairs(nearbyPlayers) do
                            local x, y, z = table.unpack(online.coords)
                            local distance = #(online.coords - GetEntityCoords(PlayerPedId()))
                            if distance <= Config.Distance then 
                                DrawESXText(x, y, z + 1.1, '[~r~ '..tostring(online.Id)..' ~w~]')
                                showNetDraw = true
                            else
                                DrawESXText(GetEntityCoords(PlayerPedId()).x, GetEntityCoords(PlayerPedId()).y, GetEntityCoords(PlayerPedId()).z + 1.1, '[~r~ '..tostring(GetPlayerServerId(PlayerId()))..' ~w~]')
                                showNetDraw = false
                            end
                        end
                        showDraw = true 
                    else
                        showDraw = false 
                    end
                end
            end)
        end)
    elseif Config.Framework == 'ox_core' then 
        local file = ('imports/%s.lua'):format(IsDuplicityVersion() and 'server' or 'client')
        local import = LoadResourceFile('ox_core', file)
        local chunk = assert(load(import, ('@@ox_core/%s'):format(file)))
        chunk()
        lib.callback('browns:scoremenu', false, function(data)
            playerData = {}
            for _, info in ipairs(data) do 
                local id = info.playerId 
                local cid = info.playercid 
                local menuList = {
                    label = 'Server ID: ['..tostring(id)..']'..'\n'..'Identifier: ['..tostring(cid)..']',
                    icon = 'fa-solid fa-users'
                }
                table.insert(playerData, menuList)
            end
            lib.registerMenu({
                id = 'browns_scoremenu',
                title = 'Online Players',
                options = playerData,
                position = 'top-right'
            })
            lib.showMenu('browns_scoremenu')
            local showDraw = false
            local showNetDraw = false
            Citizen.CreateThread(function()
                while true do 
                    Citizen.Wait(0)
                    if lib.getOpenMenu() == 'browns_scoremenu' then
                        local nearbyPlayers = GetNearbyPlayers()
                        for _, online in pairs(nearbyPlayers) do
                            local x, y, z = table.unpack(online.coords)
                            local distance = #(online.coords - GetEntityCoords(PlayerPedId()))
                            if distance <= Config.Distance then 
                                DrawESXText(x, y, z + 1.1, '[~r~ '..tostring(online.Id)..' ~w~]')
                                showNetDraw = true
                            else
                                DrawESXText(GetEntityCoords(PlayerPedId()).x, GetEntityCoords(PlayerPedId()).y, GetEntityCoords(PlayerPedId()).z + 1.1, '[~r~ '..tostring(GetPlayerServerId(PlayerId()))..' ~w~]')
                                showNetDraw = false
                            end
                        end
                        showDraw = true 
                    else
                        showDraw = false 
                    end
                end
            end)
        end)
    end
end)
function GetNearbyPlayers()
	local allPlayers = GetActivePlayers()
    local players = {}
    for i = 1, #allPlayers, 1 do
        table.insert(players, { Id = GetPlayerServerId(allPlayers[i]), coords = GetEntityCoords(GetPlayerPed(allPlayers[i])) })
    end
    return players
end
function DrawESXText(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    BeginTextCommandDisplayText('STRING')
    SetTextCentre(true)
    AddTextComponentSubstringPlayerName(text)
    SetDrawOrigin(x, y, z, 0)
    EndTextCommandDisplayText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0 + 0.0125, 0.017 + factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end
RegisterKeyMapping(Config.Command, 'View a List of Online & Nearby Players', 'keyboard', Config.Keyboard)
TriggerEvent('chat:addSuggestion', '/'..Config.Command, 'View a List of Online & Nearby Players (can also be enabled by pressing "'..Config.Keyboard..'")')
