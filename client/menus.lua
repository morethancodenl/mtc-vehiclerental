CreateThread(function()
    for k, v in pairs(Config.RentalMenus) do
        local options =  {}
    
        for _, vehicle in pairs(v.vehicles) do
            options[#options + 1] = {
                title = vehicle.label,
                description = "$ " .. vehicle.price,

                onSelect = function()
                    TriggerEvent('mtc-vehiclerental:client:rentVehicle', vehicle)
                end
            }
        end
    
        lib.registerContext({
            id = 'mtc-vehiclerental.' .. k,
            title = v.label,
            options = options
        })
    end
end)