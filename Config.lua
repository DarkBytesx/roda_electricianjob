Config = {}
Config.distance = 1.5
Config.Car = "burrito"
Config.Plate = "SideJob"
Config.framework = "esx" -- Esx or qbcore, easy to adapt to your framework.

Config.Pay = math.random(100,250)
Config.Account = 'money' --This is where the money is go.

Config.RemoveVehicle = {
    [1] = {text = '[E] Electrician Park Vehicle', pos = vector3(-819.6289, -748.0640, 23.2109)},
}
Config.postes = {
	{prop = 'prop_streetlight_01', scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0, angularOffset = 180.0},
	{prop = 'prop_streetlight_03', scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0, angularOffset = 180.0},
	{prop = 'prop_streetlight_01b', scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0, angularOffset = 180.0},
	{prop = 'prop_streetlight_03b', scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0, angularOffset = 180.0},
	{prop = 'prop_telegraph_01b', scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0, angularOffset = 180.0},
}

Config.TiempoParaArreglar = 10  -- Segundos

Config.Locales = {
	iniciarrepa = "PRESS ~b~E~w~ TO START THE REPAIR",
	ponerescalera = "PRESS ~b~E~w~ TO PLACE THE LADDER",
	sacarescalera = "PRESS ~b~E~w~ TO GET THE LADDER",
	espera = "Wait ~b~", -- ..seconds 
	tofinish = "~w~ seconds to finish repairing.",
	startjob = "Press ~b~[E]~w~ to Start Electrician Job",
	jobiniciado = "Job started, go to a parking lot.",
	endjob = "Press ~b~[E]~w~ to Resign Electrician Job",
	jobterminado = "You finished your work, I'll wait for you another day!",
	saveescalera = "PRESS ~b~E~w~ TO SAVE THE LADDER",
	cogerescala = "PRESS ~b~E~w~ TO GET THE LADDER"
}

--ESX CLOTHES--
--Clothes
Config.Clothes = {
    male = {
        ['tshirt_1'] = 0,  ['tshirt_2'] = 0,
        ['torso_1'] = 122,   ['torso_2'] = 0,
        ['arms'] = 1,  ['pants_1'] = 5,
    },
    female = {
      --  ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
      --  ['torso_1'] = 127,   ['torso_2'] = 0,
      --  ['arms'] = 14,
      --  ['pants_1'] = 5,   ['pants_2'] = 0,
      --  ['shoes_1'] = 28,   ['shoes_2'] = 0,
    }
}

---qbcore clothes--

Config.Uniforms = {
	['male'] = {
		outfitData = {
			['t-shirt'] = {item = 15, texture = 0},
			['torso2']  = {item = 56, texture = 0},
			['arms']    = {item = 85, texture = 0},
			['pants']   = {item = 45, texture = 4},
			['shoes']   = {item = 42, texture = 2},
		}
	},
	['female'] = {
	 	outfitData = {
			['t-shirt'] = {item = 15, texture = 0},
			['torso2']  = {item = 127, texture = 0},
			['arms']    = {item = 14, texture = 0},
			['pants']   = {item = 47, texture = 4},
			['shoes']   = {item = 98, texture = 1},
	 	}
	},
}
