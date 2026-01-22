Config = require('config.config')
SpawnCoords = nil

AddEventHandler('mtc-vehiclerental:client:rentVehicle', function(rentalLoc, model)
    local cash = QBX.PlayerData.money['cash']
    if not rentalLoc or not model then return end
    local vehicleOptions = Config.RentalMenus[rentalLoc].vehicles
    for _, v in pairs(vehicleOptions) do
        if v.model == model then
            vehicleOptions = v
            break
        end
    end

    if cash < vehicleOptions.price then
        exports.qbx_core:Notify(locale('not_enough_money'), "error")
        return
    end

    local isNotClear = IsAnyVehicleNearPoint(SpawnCoords.x, SpawnCoords.y, SpawnCoords.z, 2.5)
    if isNotClear then
        exports.qbx_core:Notify(locale('occupied_space'), "error")
        return
    end

    -- TriggerServerEvent("mtc-vehiclerental:server:rentVehicle", vehicle, SpawnCoords)
    local spawnedVehicle = lib.callback.await('mtc-vehiclerental:server:rentVehicle', false, rentalLoc, model, SpawnCoords)
    if not spawnedVehicle then 
        exports.qbx_core:Notify(locale('failed_to_rent'), "error")
        return
    end

    local entity = NetworkGetEntityFromNetworkId(spawnedVehicle)
    SetVehicleNumberPlateText(entity, "RENT" .. math.random(1000, 9999))
    TriggerEvent("vehiclekeys:client:SetOwner", qbx.getVehiclePlate(entity))
    SetVehicleEngineOn(entity, true, true, true)
    SetVehicleDirtLevel(entity, 0.0)

    SetVehicleFuelLevel(entity, 100.0)
end)