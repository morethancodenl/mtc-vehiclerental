Config = {}

-- Creating menus for renting vehicles, specifying which vehicles are available for rent there and for what amount.
Config.RentalMenus = {
    apartment = {
        label = "Car Rental",
        vehicles = {{
            model = 'panto',
            price = 1000,
            label = 'Panto'
        }, {
            model = 'blista',
            price = 1000,
            label = 'Blista'
        }}
    },
}

-- Creating locations for renting a vehicle including setting which menu belongs to it including the settings of the ped on which to interact.
Config.RentalLocations = {
    {
        pedCoords = vector4(-777.95404052734, -1316.9152832031, 4.0009365081787, 50.731616973877),
        vehCoords =  vector4(-734.43762207031, -1379.4068603516, 1.742390871048, 56.641998291016),
        model = 'mp_m_waremech_01',
        scenario = 'WORLD_HUMAN_CLIPBOARD',

        menu = 'apartment'

        -- blip = {
        --     show = true,
        --     coords = coords = vector3(-777.95404052734, -1316.9152832031, 4.0009365081787),
        --     sprite = 782,
        --     color = 0,
        --     scale = 0.7,
        -- }
    },
}