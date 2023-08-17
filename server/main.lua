local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('mtc-vehiclerental:server:rentVehicle', function(vehicle)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.RemoveMoney('cash', vehicle.price, "vehicle-rental")
end)