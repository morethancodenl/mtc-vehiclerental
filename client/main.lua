local QBCore = exports['qb-core']:GetCoreObject()
SpawnCoords = nil

AddEventHandler('mtc-vehiclerental:client:rentVehicle', function(vehicle)
    local PlayerData = QBCore.Functions.GetPlayerData()
    local cash = PlayerData.money['cash']

    if cash < vehicle.price then
        QBCore.Functions.Notify("You don't have enough money in your pocket..", "error")
        return
    end

    TriggerServerEvent('mtc-vehiclerental:server:rentVehicle', vehicle)
    
    QBCore.Functions.SpawnVehicle(vehicle.model, function(veh)

        SetVehicleNumberPlateText(veh, "RENT" .. math.random(1000, 9999))

        SetEntityHeading(veh, GetEntityHeading(cache.ped))
        exports['LegacyFuel']:SetFuel(veh, 100.0)
        TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(veh))
        SetVehicleEngineOn(veh, true, true)
        
        QBCore.Functions.Notify("Vehicle successfully rented.", "success")
    end, SpawnCoords, true, true)
end)