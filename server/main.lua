local Config = require('config.config')

lib.callback.register('mtc-vehiclerental:server:rentVehicle', function(source, rentalLoc, vehicle, coords)
    local xPlayer = exports.qbx_core:GetPlayer(source)
    if not xPlayer then return end
    if not rentalLoc or not vehicle then return end
    local vehicleData = Config.RentalMenus[rentalLoc].vehicles
    if not vehicleData then return end
    for _, v in pairs(vehicleData) do
        if v.model == vehicle then
            vehicleData = v
            break
        end
    end

    if not xPlayer.Functions.RemoveMoney('cash', vehicleData.price, "vehicle-rental") then 
        return nil
    end

    exports.ox_inventory:AddItem(source, 'rental_papers', 1, {
        description = "Rental papers for a " .. vehicleData.label,
    })

    exports.qbx_core:Notify(source, locale('rented_vehicle', vehicleData.label, vehicleData.price), "success")

    return qbx.spawnVehicle({
        model = joaat(vehicleData.model),
        spawnSource = coords,
    })
end)