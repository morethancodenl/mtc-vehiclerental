local Config = require("config.Config")
local spawnedPed = nil

--- Adds the target to the specific ped
---@param list string ~ Name of the list
local function addTargetToPed(list)
    if Config.Target == 'ox' then
        exports.ox_target:addLocalEntity(spawnedPed, {
            options = {
                { 
                    icon = 'fas fa-car', 
                    label = 'Rent a Car', 
                    action = function(entity) 
                        openMenu('mtc-vehiclerental.' .. list)
                    end,
                    distance = 2.5
                }
            }
        })
    else
        exports['qb-target']:AddTargetEntity(spawnedPed, {
            options = {
                { 
                    icon = 'fas fa-car', 
                    label = 'Rent a Car', 
                    action = function(entity) 
                        openMenu('mtc-vehiclerental.' .. list)
                    end,
                }
            }
        })
    end
end

--- Spawns the ped at the location given in the config
---@param data table ~ The data of the location
local function registerPed(data)
    lib.points.new({
        coords = data.Coords,
        distance = 25,

        onEnter = function()
            lib.requestModel(data.Model)
            spawnedPed = CreatePed(4, joaat(data.Model), data.Coords.x, data.Coords.y, data.Coords.z, data.Coords.w, false, true)
            SetEntityHeading(spawnedPed, data.Coords.w)
            FreezeEntityPosition(spawnedPed, true)
            SetEntityInvincible(spawnedPed, true)
            SetBlockingOfNonTemporaryEvents(spawnedPed, true)
            SetModelAsNoLongerNeeded(spawnedPed)

            TaskStartScenarioInPlace(spawnedPed, 'WORLD_HUMAN_CLIPBOARD', 0, true)

            SpawnCoords = data.vehCoords

            addTargetToPed(data.List)
        end,

        onExit = function ()
            if spawnedPed ~= nil then
                DeleteEntity(spawnedPed)
                spawnedPed = nil
            end
        end
    })
end

--- Creates a thread to spawn the peds
CreateThread(function()
    for _ , v in pairs(Config.Locations) do
        registerPed(v)
    end
end)