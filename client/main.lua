SpawnCoords = nil

AddEventHandler('mtc-vehiclerental:client:rentVehicle', function(vehicle)
    local cash = QBX.PlayerData.money['cash']

    if cash < vehicle.price then
        exports.qbx_core:Notify("You don't have enough money in your pocket..", "error")
        return
    end

    -- TriggerServerEvent("mtc-vehiclerental:server:rentVehicle", vehicle, SpawnCoords)
    local spawnedVehicle = lib.callback.await('mtc-vehiclerental:server:rentVehicle', false, vehicle, SpawnCoords)
    if not spawnedVehicle then 
        exports.qbx_core:Notify("Failed to rent vehicle.", "error")
        return
    end

    local entity = NetworkGetEntityFromNetworkId(spawnedVehicle)
    SetVehicleNumberPlateText(entity, "RENT" .. math.random(1000, 9999))
    TriggerEvent("vehiclekeys:client:SetOwner", qbx.getVehiclePlate(entity))
    SetVehicleEngineOn(entity, true, true, true)
    SetVehicleDirtLevel(entity, 0.0)

    SetVehicleFuelLevel(entity, 100.0)
end)