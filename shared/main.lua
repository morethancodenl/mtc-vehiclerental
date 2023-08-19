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
    legionsquare = {
        label = "Car Rental",
        vehicles = {{
            model = 'sultan',
            price = 1000,
            label = 'Karin Sultan'
        }, {
            model = 'sultanrs',
            price = 1000,
            label = 'Karin Sultan RS'
        }}
    },
}

-- Creating locations for renting a vehicle including setting which menu belongs to it including the settings of the ped on which to interact.
Config.RentalLocations = {
    {
        pedCoords = vector4(-296.17, -993.09, 30.08, 341.58),
        vehCoords =  vector4(-297.78, -990.55, 30.47, 339.22),
        model = 'mp_m_waremech_01',
        scenario = 'WORLD_HUMAN_CLIPBOARD',

        menu = 'apartment',

        blip = {
            show = true,
            label = "Vehicle rental",
            coords = vector3(-296.17, -993.09, 31.08),
            sprite = 782,
            color = 0,
            scale = 0.7,
        }
    },
    {
        pedCoords = vector4(173.46, -1001.83, 28.34, 170.97),
        vehCoords =  vector4(174.48, -1011.7, 28.67, 205.16),
        model = 'mp_m_waremech_01',
        scenario = 'WORLD_HUMAN_CLIPBOARD',

        menu = 'legionsquare',

        blip = {
            show = true,
            label = "Vehicle rental",
            coords = vector3(173.46, -1001.83, 29.34),
            sprite = 782,
            color = 0,
            scale = 0.7,
        }
    },
}
