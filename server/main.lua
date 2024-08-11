lib.callback.register('mtc-vehiclerental:server:rentVehicle', function(source, vehicle, coords)
    local xPlayer = exports.qbx_core:GetPlayer(source)
    if not xPlayer then return end
    if not xPlayer.Functions.RemoveMoney('cash', vehicle.price, "vehicle-rental") then 
        return nil
    end
    xPlayer.Functions.AddItem('rental_papers', 1)

    return qbx.spawnVehicle({
        model = joaat(vehicle.model),
        spawnSource = coords,
    })
end)