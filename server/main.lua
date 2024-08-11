lib.callback.register('mtc-vehiclerental:server:rentVehicle', function(source, vehicle, coords)
    local xPlayer = exports.qbx_core:GetPlayer(source)
    if not xPlayer then return end
    if not xPlayer.Functions.RemoveMoney('cash', vehicle.price, "vehicle-rental") then 
        return nil
    end

    exports.ox_inventory:AddItem(source, 'rental_papers', 1, {
        description = "Rental papers for a " .. vehicle.label,
    })

    return qbx.spawnVehicle({
        model = joaat(vehicle.model),
        spawnSource = coords,
    })
end)