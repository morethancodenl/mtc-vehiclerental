local SpawnedPed = nil

local function AddTargetPed(menu)
    exports.ox_target:addLocalEntity(SpawnedPed, {
        {
            icon = 'fas fa-car',
            label = 'Rent a Car',
            onSelect = function(entity)
                lib.showContext('mtc-vehiclerental.' .. menu)
            end
        }
    })
end

local function RegisterPedSpawner(data)
    lib.points.new({
        coords = data.pedCoords,
        distance = 25,

        onEnter = function()
            lib.requestModel(data.model)
            SpawnedPed = CreatePed(4, joaat(data.model), data.pedCoords.x,
                                   data.pedCoords.y, data.pedCoords.z,
                                   data.pedCoords.w, false, true)
            SetEntityHeading(SpawnedPed, data.pedCoords.w)
            FreezeEntityPosition(SpawnedPed, true)
            SetEntityInvincible(SpawnedPed, true)
            SetBlockingOfNonTemporaryEvents(SpawnedPed, true)
            SetModelAsNoLongerNeeded(SpawnedPed)

            TaskStartScenarioInPlace(SpawnedPed, data.scenario, 0, true)

            SpawnCoords = data.vehCoords

            AddTargetPed(data.menu)
        end,

        onExit = function()
            if SpawnedPed ~= nil then
                DeleteEntity(SpawnedPed)
                SpawnedPed = nil
            end
        end
    })
end

CreateThread(function()
    for _, v in ipairs(Config.RentalLocations) do RegisterPedSpawner(v) end
end)
