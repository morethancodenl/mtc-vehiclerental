CreateThread(function()
    for rentalLoc, v in pairs(Config.RentalMenus) do
        local options =  {}
    
        for _, vehicle in pairs(v.vehicles) do
            options[#options + 1] = {
                title = vehicle.label,
                description = "$ " .. vehicle.price,

                onSelect = function()
                    TriggerEvent('mtc-vehiclerental:client:rentVehicle',  rentalLoc, vehicle.model)
                end
            }
        end
    
        lib.registerContext({
            id = 'mtc-vehiclerental.' .. rentalLoc,
            title = v.label,
            options = options
        })
    end
end)