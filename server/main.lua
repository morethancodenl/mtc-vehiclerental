local QBCore = exports['qb-core']:GetCoreObject()

CreateThread(function()
    QBCore.Functions.AddItems({
        ['rental_papers'] = {
            ['name'] = 'rental_papers',
            ['label'] = 'Rental papers',
            ['weight'] = 100,
            ['type'] = 'item',
            ['image'] = 'rental.png',
            ['unique'] = false,
            ['useable'] = false,
            ['shouldClose'] = false,
            ['combinable'] = nil,
            ['description'] = 'Rental papers for your vehicle.'
        }
    })
end)

RegisterNetEvent('mtc-vehiclerental:server:rentVehicle', function(vehicle)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.RemoveMoney('cash', vehicle.price, "vehicle-rental")
    Player.Functions.AddItem('rental_papers', 1)
end)