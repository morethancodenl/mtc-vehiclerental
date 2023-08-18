CreateThread(function()
    for k, v in pairs(Config.RentalLocations) do
        if not v.blip.enabled then goto continue end
        local blip = AddBlipForCoord(v.blip.coords.x, v.blip.coords.y, v.blip.coords.z)
        SetBlipSprite(blip, v.blip.sprite)
        SetBlipDisplay(blip, 4)
        SetBlipScale(blip, v.blip.scale)
        SetBlipAsShortRange(blip, true)
        SetBlipColour(blip, v.blip.color)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName(v.blip.label)
        EndTextCommandSetBlipName(blip)
        ::continue::
    end
end)