-- if Config.framework == 'esx' then 

--     ESX = nil

--     Citizen.CreateThread(function()
--         while ESX == nil do
--             ESX = exports["es_extended"]:getSharedObject()
--             Citizen.Wait(0)
--         end
--     end)

-- elseif Config.framework == 'qbcore' then 
--     QBCore = exports['qb-core']:GetCoreObject()
-- end



-- StartAnim = function(lib, anim)
-- RequestAnimDict(lib)
-- while not HasAnimDictLoaded(lib) do
--     Wait(1)
-- end
-- TaskPlayAnim(PlayerPedId(), lib, anim ,8.0, -8.0, -1, 50, 0, false, false, false)
-- end

-- local Objects = {
--     {
--         ["x"] = 399.06744384766,
--         ["y"] = -769.93621826172,
--         ["z"] = 29.286233901978,
--         ["h"] = 69.0,
--         ["model"] = "dt1_15_ladder_003"
--     }

-- }

-- local trabalhando = false
-- local escadaNaMao = false
-- local escadaNoCarro = true
-- local escadaNoPoste = false
-- local foraCarro = true

-- local executandoServico = false
-- local servicoConcluido = false

-- local posteConsertado = {}
-- tempoConserto = Config.TiempoParaArreglar

-- local respawn = 0
-- local segundos = 0

-- Citizen.CreateThread(function()

--     while true do
--         local objects = {}
--         local sleep = 500

--         for i = 1, #Config.RemoveVehicle, 1 do
--             local zone = Config.RemoveVehicle[i]
--             local pedCoords = GetEntityCoords(PlayerPedId())
--             -- local distance = GetDistanceBetweenCoords(pedCoords, zone.pos, 1)
--             local distance = #(pedCoords - zone.pos)
            
            
--             if distance <= 3.0  then
--                 sleep = 1
--                 local playerPed = PlayerPedId()
--                 local coords = GetEntityCoords(playerPed)
--                 --if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == 'mechanic' then   ESX.RegisterServerCallback('esx_repairkit:canimpound'
--                 --ESX.TriggerServerCallback('esx_repairkit:canimpound', function(isMechanic)
--                     if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then
--                         DrawText3D(pedCoords.x, pedCoords.y, pedCoords.z, zone.text)
--                         if IsControlJustReleased(0, 38) then
--                             impoundvehicle()
--                     end
--                 --end)
--             end
--             end
--         end

--         for k, v in pairs(Config.postes) do table.insert(objects, v.prop) end
--         if escadaNaMao or escadaNoPoste then
--             sleep = 0
--             local ped = GetPlayerPed(-1)
--             local list = {}
--             for k, v in pairs(objects) do
--                 local obj = GetClosestObjectOfType(GetEntityCoords(ped).x,
--                                                    GetEntityCoords(ped).y,
--                                                    GetEntityCoords(ped).z, 3.0,
--                                                    GetHashKey(v), false, true,
--                                                    true)
--                 local dist = GetDistanceBetweenCoords(GetEntityCoords(ped),
--                                                       GetEntityCoords(obj), true)
--                 table.insert(list, {object = obj, distance = dist})
--             end
--             local closest = list[1]
--             for k, v in pairs(list) do
--                 if v.distance < closest.distance then closest = v end
--             end
--             local distance = closest.distance
--             local object = closest.object
--             if escadaNoPoste and not executandoServico then
--                 local ob = GetEntityCoords(object).z
--                 local p = GetEntityCoords(ped).z
--                 local distancia = p - ob
--                 if distancia > 5 then
--                     sleep = 0
--                     DrawText3D(GetEntityCoords(ped).x, GetEntityCoords(ped).y,GetEntityCoords(ped).z + 2, Config.Locales["iniciarrepa"])
--                     if IsControlJustPressed(0, 246) then
--                         executandoServico = true
--                         segundos = tempoConserto
--                     end
--                         sleep = 5
--                 end
--             end

--             if distance < Config.distance and DoesEntityExist(object) and  not posteConsertado[object] then
--                 sleep = 5
               
--                 local ped = PlayerPedId()
--                 if escadaNaMao then
--                     sleep = 0
--                     DrawText3D(GetEntityCoords(object).x, GetEntityCoords(object).y, GetEntityCoords(object).z + 2.5, Config.Locales["ponerescalera"])
--                 elseif escadaNoPoste and servicoConcluido then
--                     DrawText3D(GetEntityCoords(object).x,GetEntityCoords(object).y,GetEntityCoords(object).z + 2.5,Config.Locales["sacarescalera"])
--                 end
--                 sleep = 5
--                 if IsControlJustPressed(0, 246) then
--                     if not escadaNoPoste and escadaNaMao then
--                         escadaNoPoste = true
--                         escadaNaMao = false
--                         executandoServico = false
--                         StartAnim('mini@repair', 'fixing_a_ped')
--                         FreezeEntityPosition(GetPlayerPed(-1), true)
--                         --exports['progressBars']:startUI(1000, "Putting Ladder...")
--                         exports['an_progBar']:run(10,'Applying Electrician Job','#E14127')
--                         Citizen.Wait(10000)
--                         FreezeEntityPosition(GetPlayerPed(-1), false)
--                         ClearPedTasks(PlayerPedId())
--                         DeleteObject(entity)
--                         local HashKey = GetHashKey("hw1_06_ldr_")
--                         SpawnObject = CreateObject(HashKey, GetEntityCoords(
--                                                        object).x - 0.25,
--                                                    GetEntityCoords(object).y,
--                                                    GetEntityCoords(object).z)
--                         PlaceObjectOnGroundProperly(SpawnObject)
--                         SetEntityHeading(SpawnObject, 69.0)
--                         FreezeEntityPosition(SpawnObject, true)
--                         SetEntityAsMissionEntity(SpawnObject, true, true)
--                     elseif escadaNoPoste and not escadaNaMao and
--                         servicoConcluido then
--                         servicoConcluido = false
--                         executandoServico = false
--                         escadaNoPoste = false
--                         escadaNaMao = true
--                         posteConsertado[object] = true

--                         StartAnim('mini@repair', 'fixing_a_ped')
--                         FreezeEntityPosition(GetPlayerPed(-1), true)
--                         exports['an_progBar']:run(10,'Applying Electrician Job','#E14127')
--                         Citizen.Wait(10000)
--                         	FreezeEntityPosition(GetPlayerPed(-1), false)
--                         DeleteObject(SpawnObject)
--                         entity = CreateObject(GetHashKey("prop_byard_ladder01"),
--                                               0, 0, 0, true, true, true)
--                         StartAnim(
--                             'amb@world_human_muscle_free_weights@male@barbell@idle_a',
--                             'idle_a')
--                         AttachEntityToEntity(entity, PlayerPedId(),
--                                              GetPedBoneIndex(PlayerPedId(),
--                                                              28422), 0.05, 0.1,
--                                              -0.3, 300.0, 100.0, 20.0, true,
--                                              true, false, true, 1, true)
--                     end
--                 end
--             end
--             if segundos > 0 then
--                 sleep = 0
--                 drawTxt(Config.Locales["espera"]..segundos.. Config.Locales["tofinish"], 4, 0.5, 19, 0.50, 255, 255, 255, 180)
--             end
--             sleep = 5
--         end
--         Citizen.Wait(sleep)
--     end
-- end)



-- Citizen.CreateThread(function()
--     while true do
--         local objects = {}
--         local sleep = 500
--         for k, v in pairs(Config.postes) do table.insert(objects, v.prop) end
       
--         if IsControlJustPressed(0, 38) then
--             sleep = 5
--             local obj = GetClosestObjectOfType(GetEntityCoords(ped).x, GetEntityCoords(ped).y, GetEntityCoords(ped).z, 3.0,GetHashKey(objects[1]), false, true, true)
--         end
--         local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), -825.55084228516, -731.86492919922, 27.074931640625, true)
--         if distance <= 5 then
--             sleep = 0
--             DrawMarker(23, -825.55084228516, -731.86492919922, 27.074931640625,
--                        0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.5, 240, 200, 80, 80, 0, 0,
--                        0, 0)

--             if distance <= 1.2 then
--                 sleep = 6
--                 if not trabalhando then
--                     DrawText3D(-825.55084228516, -731.86492919922, 28.054931640625 + 1.5, Config.Locales["startjob"])
--                     if IsControlJustPressed(0, 38) then
--                         sleep = 5
--                         ExecuteCommand('e clipboard')
--                         --exports['progressBars']:startUI(3000, "Applying for Meralco Job...")
--                         FreezeEntityPosition(GetPlayerPed(-1), true)
--                         exports['an_progBar']:run(10,'Applying Electrician Job','#E14127')
--                         Citizen.Wait(10000)
--                         FreezeEntityPosition(GetPlayerPed(-1), false)
--                         ExecuteCommand('e c')
--                             trabalhando = true
--                             Notificacion(Config.Locales["jobiniciado"])
--                             ChangeClothes()
--                             spawnCarJob(Config.Car)
--                     end
--                 else
--                     DrawText3D(-825.55084228516, -731.86492919922, 28.054931640625 + 1.5, Config.Locales["endjob"])
--                     if IsControlJustPressed(0, 38) then
--                         sleep = 5
--                         ExecuteCommand('e clipboard')
--                         --exports['progressBars']:startUI(3000, "Removing Meralco Job...")
--                         FreezeEntityPosition(GetPlayerPed(-1), true)
--                         exports['an_progBar']:run(10,'Resign Electrician Job','#E14127')
--                         Citizen.Wait(10000)
--                         FreezeEntityPosition(GetPlayerPed(-1), false)
--                         ExecuteCommand('e c')
--                             trabalhando = false
--                             Notificacion(Config.Locales["jobterminado"])
--                             GetClothes()
--                     end
--                 end
--             end
--         end
--         if trabalhando and foraCarro() and Perto() then
--             sleep = 0
--             if IsControlJustPressed(0, 38) then
--                 sleep = 0
--                 if not escadaNaMao and escadaNoCarro then
--                     sleep = 10
--                     escadaNoCarro = false
--                     escadaNaMao = true
--                     StartAnim('mini@repair', 'fixing_a_ped')
--                     FreezeEntityPosition(GetPlayerPed(-1), true)
--                     exports['an_progBar']:run(10,'Applying Electrician Job','#E14127')
--                     Citizen.Wait(10000)
--                     FreezeEntityPosition(GetPlayerPed(-1), false)
--                     ClearPedTasks(PlayerPedId())
--                     entity = CreateObject(GetHashKey("prop_byard_ladder01"), 0,
--                                           0, 0, true, true, true)
--                     StartAnim(
--                         'amb@world_human_muscle_free_weights@male@barbell@idle_a',
--                         'idle_a')
--                         FreezeEntityPosition(GetPlayerPed(-1), true)
--                     AttachEntityToEntity(entity, PlayerPedId(),
--                                          GetPedBoneIndex(PlayerPedId(), 28422),
--                                          0.05, 0.1, -0.3, 300.0, 100.0, 20.0,
--                                          true, true, false, true, 1, true)
--                                          FreezeEntityPosition(GetPlayerPed(-1), false)
        
--                 elseif escadaNaMao and not escadaNoCarro then
--                     escadaNoCarro = true
--                     escadaNaMao = false
--                     StartAnim('mini@repair', 'fixing_a_ped')
--                     --exports['progressBars']:startUI(1000, "Putting back Ladder...")
--                     FreezeEntityPosition(GetPlayerPed(-1), true)
--                     exports['an_progBar']:run(10,'Applying Electrician Job','#E14127')
--                     Citizen.Wait(10000)
--                     FreezeEntityPosition(GetPlayerPed(-1), false)
--                     ClearPedTasks(PlayerPedId())
--                     DeleteObject(entity)
--                 end
--             end
           
--         end
--         Citizen.Wait(sleep)
--     end
-- end)


-- function foraCarro()
--     local ped = GetPlayerPed(-1)
--     local veh = GetVehiclePedIsIn(ped, false)
--     if (GetPedInVehicleSeat(veh, -1) == ped) then
--         return false
--     else
--         return true
--     end
-- end

-- -- RegisterCommand('sb', function ()
-- --     trabalhando = true
-- -- end)


-- function Perto()
--     if Config.framework == 'esx' then 

--         local ped = GetPlayerPed(-1)
--         local veh = GetVehiclePedIsIn(ped, false)
--         local px, py, pz = table.unpack(GetEntityCoords(PlayerPedId()))


--         local vehicle = ESX.Game.GetClosestVehicle(vec3(px, py, pz))

        
--         local model = GetEntityModel(vehicle)
--         local displaytext = GetDisplayNameFromVehicleModel(model)
--         local name = GetLabelText(displaytext)
--         local vehicleCoords = GetEntityCoords(vehicle)
--         local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),
--                                                 vehicleCoords.x, vehicleCoords.y,
--                                                 vehicleCoords.z, true)

--         if (name == "Burrito") and distance < 2.5 then
--             if not escadaNaMao then
--                 DrawText3D(GetEntityCoords(vehicle).x, GetEntityCoords(vehicle).y, GetEntityCoords(vehicle).z + 1.5, Config.Locales["cogerescala"])
--             else
--                 DrawText3D(GetEntityCoords(vehicle).x, GetEntityCoords(vehicle).y,GetEntityCoords(vehicle).z + 1.5, Config.Locales["saveescalera"])
--             end

--             return true
--         else
--             return false
--         end

--     elseif Config.framework == 'qbcore' then 
--         local ped = GetPlayerPed(-1)
--         local veh = GetVehiclePedIsIn(ped, false)
--         local px, py, pz = table.unpack(GetEntityCoords(PlayerPedId()))


--         local vehicle =  QBCore.Functions.GetClosestVehicle(vec3(px, py, pz))

        
--         local model = GetEntityModel(vehicle)
--         local displaytext = GetDisplayNameFromVehicleModel(model)
--         local name = GetLabelText(displaytext)
--         local vehicleCoords = GetEntityCoords(vehicle)
--         local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),
--                                                 vehicleCoords.x, vehicleCoords.y,
--                                                 vehicleCoords.z, true)

--         if (name == "Burrito") and distance < 2.5 then
--             if not escadaNaMao then
--                 DrawText3D(GetEntityCoords(vehicle).x, GetEntityCoords(vehicle).y, GetEntityCoords(vehicle).z + 1.5, Config.Locales["cogerescala"])
--             else
--                 DrawText3D(GetEntityCoords(vehicle).x, GetEntityCoords(vehicle).y,GetEntityCoords(vehicle).z + 1.5, Config.Locales["saveescalera"])
--             end

--             return true
--         else
--             return false
--         end

--     end
-- end



-- function ChangeClothes()
--     if Config.framework == 'esx' then 
--         ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
--             if skin.sex == 0 then
--                 TriggerEvent('skinchanger:loadClothes', skin, Config.Clothes.male)
--             elseif skin.sex == 1 then
--                 TriggerEvent('skinchanger:loadClothes', skin, Config.Clothes.female)
--             end
--         end)
--     elseif Config.framework == 'qbcore' then
--         local gender = QBCore.Functions.GetPlayerData().charinfo.gender
--         if gender == 0 then
--             TriggerEvent('qb-clothing:client:loadOutfit', Config.Uniforms.male)
--         else
--             TriggerEvent('qb-clothing:client:loadOutfit', Config.Uniforms.female)
--         end
--     end
-- end

-- function GetClothes()

--     if Config.framework == 'esx' then 
--         ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
--             TriggerEvent('skinchanger:loadSkin', skin)
--         end)
--     elseif Config.framework == 'qbcore' then
--         TriggerServerEvent('qb-clothes:loadPlayerSkin')
--     end
-- end


-- function Notificacion(text)
--     SetTextComponentFormat('STRING')
--     AddTextComponentString(text)
--     DisplayHelpTextFromStringLabel(0, 0, 1, -1)
-- end

-- DrawText3D = function(x, y, z, text)
--     local onScreen, _x, _y = World3dToScreen2d(x, y, z)
--     local px, py, pz = table.unpack(GetGameplayCamCoords())
--     local scale = 0.45
--     if onScreen then
--         SetTextScale(scale, scale)
--         SetTextFont(4)
--         SetTextProportional(1)
--         SetTextColour(255, 255, 255, 215)
--         SetTextOutline()
--         SetTextEntry("STRING")
--         SetTextCentre(1)
--         AddTextComponentString(text)
--         DrawText(_x, _y)
--         local factor = (string.len(text)) / 370
--         DrawRect(_x, _y + 0.0150, 0.030 + factor, 0.030, 66, 66, 66, 150)
--     end
-- end

-- -- DrawText3D = function(x, y, z, text)
-- --     local onScreen, _x, _y = World3dToScreen2d(x, y, z)
-- --     local px, py, pz = table.unpack(GetGameplayCamCoords())
-- --     local scale = 0.45
-- --     if onScreen then
-- --         SetTextScale(scale, scale)
-- --         SetTextFont(4)
-- --         SetTextProportional(1)
-- --         SetTextColour(255, 255, 255, 215)
-- --         SetTextOutline()
-- --         SetTextEntry("STRING")
-- --         SetTextCentre(1)
-- --         AddTextComponentString(text)
-- --         DrawText(_x, _y)
-- --         local factor = (string.len(text)) / 370
-- --         DrawRect(_x, _y + 0.0150, 0.030 + factor, 0.030, 66, 66, 66, 150)
-- --     end
-- -- end

-- Citizen.CreateThread(function()
--     while true do
--         Citizen.Wait(1000)
--         if segundos > 0 then
--             segundos = segundos - 1
--             StartAnim('amb@world_human_hammering@male@base', 'base')
--             FreezeEntityPosition(GetPlayerPed(-1), true)
--             if segundos == 0 then
--                 FreezeEntityPosition(GetPlayerPed(-1), false)
--                 ClearPedTasks(PlayerPedId())
--                 servicoConcluido = true
--                 PayForJob(Config.Pay)
--             end
--         else
--             Citizen.Wait(1000)
--         end
--     end
-- end)

-- function PayForJob(money)
--     local can = 'sdafghjrehrw2345dfe' -- Just for cheaters xd
--     TriggerServerEvent('Roda-Electricista:PayJob', money, can)
-- end


-- function drawTxt(text, font, x, y, scale, r, g, b, a)
--     SetTextFont(font)
--     SetTextScale(scale, scale)
--     SetTextColour(r, g, b, a)
--     SetTextOutline()
--     SetTextCentre(1)
--     SetTextEntry("STRING")
--     AddTextComponentString(text)
--     DrawText(x, y)
-- end

-- function Notificacion(text)
--     SetTextComponentFormat('STRING')
--     AddTextComponentString(text)
--     DisplayHelpTextFromStringLabel(0, 0, 1, -1)
-- end

-- function impoundvehicle(vehicle)
--     local playerPed = PlayerPedId()
--     -- local IsAuthorizedJob = IsAuthorizedJob()
--     -- if IsAuthorizedJob then
--         if IsPedInAnyVehicle(playerPed, false) then
--             local vehicle = GetVehiclePedIsIn(playerPed, false)
--             ESX.Game.DeleteVehicle(vehicle)
--         -- end
--     else
--         --ESX.ShowNotification('must be inside a vehicle', 'error')
--         lib.notify({
--             title = 'Side Job',
--             description = 'Player must be inside a vehicle',
--             type = 'error'
--         })
--     end
-- end

-- function spawnCarJob(car)
--     local SpawnPoint = vector3(-820.5, -748.1, 23.2)
--     local SpawnHeading = 79.89
    
--     local SpawnClear = ESX.Game.IsSpawnPointClear(SpawnPoint, 5.0)
--     if SpawnClear then
--         ESX.Game.SpawnVehicle(Config.Car,SpawnPoint, SpawnHeading, function(veh)
--             vehicle = veh
--             SetVehicleNumberPlateText(veh, Config.Plate)
--             TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
--         end)
--     else
--         --ESX.ShowNotification('Spawn Point is not clear', 'error')
--         lib.notify({
--             title = 'Side Job',
--             description = 'May Nakaharang sa Spawn Point',
--             type = 'error'
--         })
--     end
-- end

-- -- function spawnCarJob(car)

-- --     if Config.framework == 'esx' then 
-- --         ESX.Game.SpawnVehicle(Config.Car,vector3(-820.5, -748.1, 23.2), 79.89, function(veh)
-- --             vehicle = veh
-- --             SetVehicleNumberPlateText(veh, Config.Plate)
-- --         end)
-- --     elseif Config.framework == 'qbcore' then 
-- --         QBCore.Functions.SpawnVehicle(Config.Car, function(veh)
-- --             vehicle = veh
-- --             SetVehicleNumberPlateText(veh, Config.Plate)
-- --             TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
-- --             SetEntityHeading(veh, 79.89)
-- --         end, vector3(-820.5, -748.1, 23.2), true)   
-- --     end
-- -- end





if Config.framework == 'esx' then
    ESX = nil

    Citizen.CreateThread(function()
        while ESX == nil do
            ESX = exports["es_extended"]:getSharedObject()
            Citizen.Wait(0)
        end
    end)
elseif Config.framework == 'qbcore' then
    QBCore = exports['qb-core']:GetCoreObject()
end

StartAnim = function(lib, anim)
    RequestAnimDict(lib)
    while not HasAnimDictLoaded(lib) do
        Wait(1)
    end
    TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, -8.0, -1, 50, 0, false, false, false)
end

local Objects = {
    {
        x = 399.06744384766,
        y = -769.93621826172,
        z = 29.286233901978,
        h = 69.0,
        model = "dt1_15_ladder_003"
    }
}

local trabalhando = false
local escadaNaMao = false
local escadaNoCarro = true
local escadaNoPoste = false
local foraCarro = true

local executandoServico = false
local servicoConcluido = false

local posteConsertado = {}
tempoConserto = Config.TiempoParaArreglar

local respawn = 0
local segundos = 0

Citizen.CreateThread(function()
    while true do
        local objects = {}
        local sleep = 500

        for i = 1, #Config.RemoveVehicle, 1 do
            local zone = Config.RemoveVehicle[i]
            local pedCoords = GetEntityCoords(PlayerPedId())
            local distance = #(pedCoords - zone.pos)

            if distance <= 3.0 then
                sleep = 1
                local playerPed = PlayerPedId()
                local coords = GetEntityCoords(playerPed)
                if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then
                    DrawText3D(pedCoords.x, pedCoords.y, pedCoords.z, zone.text)
                    if IsControlJustReleased(0, 38) then
                        lib.notify({
                            title = 'Side Job',
                            description = 'Thank you for your service',
                            type = 'success',
                            position = 'center-right',
                            icon = 'briefcase',
                        })
                        impoundvehicle()
                    end
                end
            end
        end

        for k, v in pairs(Config.postes) do
            table.insert(objects, v.prop)
        end

        if escadaNaMao or escadaNoPoste then
            sleep = 0
            local ped = GetPlayerPed(-1)
            local list = {}

            for k, v in pairs(objects) do
                local obj = GetClosestObjectOfType(GetEntityCoords(ped).x,
                    GetEntityCoords(ped).y,
                    GetEntityCoords(ped).z, 3.0,
                    GetHashKey(v), false, true,
                    true)
                local dist = GetDistanceBetweenCoords(GetEntityCoords(ped),
                    GetEntityCoords(obj), true)
                table.insert(list, { object = obj, distance = dist })
            end

            local closest = list[1]

            for k, v in pairs(list) do
                if v.distance < closest.distance then
                    closest = v
                end
            end

            local distance = closest.distance
            local object = closest.object

            if escadaNoPoste and not executandoServico then
                local ob = GetEntityCoords(object).z
                local p = GetEntityCoords(ped).z
                local distancia = p - ob
                if distancia > 5 then
                    sleep = 0
                    DrawText3D(GetEntityCoords(ped).x, GetEntityCoords(ped).y, GetEntityCoords(ped).z + 2, Config.Locales["iniciarrepa"])

                    if IsControlJustPressed(0, 38) then
                        executandoServico = true
                        segundos = tempoConserto
                    end
                    sleep = 5
                end
            end

            if distance < Config.distance and DoesEntityExist(object) and not posteConsertado[object] then
                sleep = 5

                local ped = PlayerPedId()

                if escadaNaMao then
                    sleep = 0
                    DrawText3D(GetEntityCoords(object).x, GetEntityCoords(object).y, GetEntityCoords(object).z + 2.5, Config.Locales["ponerescalera"])
                elseif escadaNoPoste and servicoConcluido then
                    DrawText3D(GetEntityCoords(object).x, GetEntityCoords(object).y, GetEntityCoords(object).z + 2.5, Config.Locales["sacarescalera"])
                end

                sleep = 5

                if IsControlJustPressed(0, 38) then
                    if not escadaNoPoste and escadaNaMao then
                        escadaNoPoste = true
                        escadaNaMao = false
                        executandoServico = false
                        StartAnim('mini@repair', 'fixing_a_ped')
                        FreezeEntityPosition(GetPlayerPed(-1), true)
                        if lib.progressBar({
                            duration = 3000,
                            label = 'Placing Ladder',
                            useWhileDead = false,
                            canCancel = false,
                            disable = {
                                move = false,
                            },
                        }) then end
                       -- exports['an_progBar']:run(10, 'Placing The Ladder', '#E14127')
                       -- Citizen.Wait(10000)
                        FreezeEntityPosition(GetPlayerPed(-1), false)
                        ClearPedTasks(PlayerPedId())
                        DeleteObject(entity)
                        local HashKey = GetHashKey("hw1_06_ldr_")
                        SpawnObject = CreateObject(HashKey, GetEntityCoords(object).x - 0.25, GetEntityCoords(object).y, GetEntityCoords(object).z)
                        PlaceObjectOnGroundProperly(SpawnObject)
                        SetEntityHeading(SpawnObject, 69.0)
                        FreezeEntityPosition(SpawnObject, true)
                        SetEntityAsMissionEntity(SpawnObject, true, true)
                    elseif escadaNoPoste and not escadaNaMao and servicoConcluido then
                        servicoConcluido = false
                        executandoServico = false
                        escadaNoPoste = false
                        escadaNaMao = true
                        posteConsertado[object] = true

                        StartAnim('mini@repair', 'fixing_a_ped')
                        FreezeEntityPosition(GetPlayerPed(-1), true)
                        if lib.progressBar({
                            duration = 3000,
                            label = 'Removing Ladder',
                            useWhileDead = false,
                            canCancel = false,
                            disable = {
                                move = false,
                            },
                        }) then end
                        --exports['an_progBar']:run(10, 'Removing The Ladder', '#E14127')
                        --Citizen.Wait(10000)
                        FreezeEntityPosition(GetPlayerPed(-1), false)
                        DeleteObject(SpawnObject)
                        entity = CreateObject(GetHashKey("prop_byard_ladder01"), 0, 0, 0, true, true, true)
                        StartAnim(
                            'amb@world_human_muscle_free_weights@male@barbell@idle_a',
                            'idle_a')
                        AttachEntityToEntity(entity, PlayerPedId(),
                            GetPedBoneIndex(PlayerPedId(), 28422), 0.05, 0.1,
                            -0.3, 300.0, 100.0, 20.0, true, true, false, true, 1, true)
                    end
                end
            end

            if segundos > 0 then
                sleep = 0
                if lib.progressBar({
                    duration = 11000,
                    label = 'Repairing',
                    useWhileDead = false,
                    canCancel = false,
                    disable = {
                        move = false,
                    },
                }) then end
                --drawTxt(Config.Locales["espera"] .. segundos .. Config.Locales["tofinish"], 4, 0.5, 19, 0.50, 255, 255, 255, 180)
            end

            sleep = 5
        end

        Citizen.Wait(sleep)
    end
end)

Citizen.CreateThread(function()
    while true do
        local objects = {}
        local sleep = 500
        for k, v in pairs(Config.postes) do
            table.insert(objects, v.prop)
        end

        if IsControlJustPressed(0, 38) then
            sleep = 5
            local obj = GetClosestObjectOfType(GetEntityCoords(ped).x, GetEntityCoords(ped).y, GetEntityCoords(ped).z, 3.0, GetHashKey(objects[1]), false, true, true)
        end

        local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), -825.55084228516, -731.86492919922, 27.074931640625, true)

        if distance <= 5 then
            sleep = 0
            DrawMarker(23, -825.55084228516, -731.86492919922, 27.074931640625,
                0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.5, 240, 200, 80, 80, 0, 0,
                0, 0)

            if distance <= 1.5 then
                sleep = 6
                if not trabalhando then
                    DrawText3D(-825.55084228516, -731.86492919922, 27.054931640625 + 1.5, Config.Locales["startjob"])
                    if IsControlJustPressed(0, 38) then
                        sleep = 5
                        ExecuteCommand('e clipboard')
                        FreezeEntityPosition(GetPlayerPed(-1), true)
                        if lib.progressBar({
                            duration = 3000,
                            label = 'Applying Electrician Job',
                            useWhileDead = false,
                            canCancel = false,
                            disable = {
                                move = false,
                            },
                        }) then end
                        --exports['an_progBar']:run(10, 'Applying Electrician Job', '#E14127')
                        --Citizen.Wait(2000)
                        FreezeEntityPosition(GetPlayerPed(-1), false)
                        ExecuteCommand('e c')
                        trabalhando = true
                        --Notificacion(Config.Locales["jobiniciado"])
                        lib.notify({
                            title = 'Side Job',
                            description = 'Successfully Become Electrician',
                            type = 'success',
                            position = 'center-right',
                            icon = 'briefcase',
                        })
                        lib.notify({
                            title = 'Side Job',
                            description = 'The Vehicle is on the Parking Lot',
                            type = 'success',
                            position = 'center-right',
                            icon = 'briefcase',
                        })                       
                        --exports['t-notify']:Custom({style = 'success', duration = 5000, title = 'Side Job', message = "Successfully Become Electrician", sound = false})
                        --exports['t-notify']:Custom({style = 'success', duration = 5000, title = 'Side Job', message = "The Vehicle is on the Parking Lot", sound = false})
                        
                        ChangeClothes()
                        spawnCarJob(Config.Car)
                    end
                else
                    DrawText3D(-825.55084228516, -731.86492919922, 27.054931640625 + 1.5, Config.Locales["endjob"])
                    if IsControlJustPressed(0, 38) then
                        sleep = 5
                        ExecuteCommand('e clipboard')
                        FreezeEntityPosition(GetPlayerPed(-1), true)
                        if lib.progressBar({
                            duration = 3000,
                            label = 'Resign Electrician Job',
                            useWhileDead = false,
                            canCancel = false,
                            disable = {
                                move = false,
                            },
                        }) then end
                        --exports['an_progBar']:run(10, 'Resign Electrician Job', '#E14127')
                        --Citizen.Wait(10000)
                        FreezeEntityPosition(GetPlayerPed(-1), false)
                        ExecuteCommand('e c')
                        trabalhando = false
                        --Notificacion(Config.Locales["jobterminado"])
                        lib.notify({
                            title = 'Side Job',
                            description = 'Must Be Tired Ok Take Rest!',
                            type = 'success',
                            position = 'center-right',
                            icon = 'briefcase',
                        })     
                        --exports['t-notify']:Custom({style = 'success', duration = 5000, title = 'Side Job', message = "Must Be Tired You Just Resign", sound = false})
                        GetClothes()
                    end
                end
            end
        end

        if trabalhando and foraCarro() and Perto() then
            sleep = 0
            if IsControlJustPressed(0, 38) then
                sleep = 0
                if not escadaNaMao and escadaNoCarro then
                    sleep = 10
                    escadaNoCarro = false
                    escadaNaMao = true
                    StartAnim('mini@repair', 'fixing_a_ped')
                    FreezeEntityPosition(GetPlayerPed(-1), true)
                    if lib.progressBar({
                        duration = 3000,
                        label = 'Getting the Ladder',
                        useWhileDead = false,
                        canCancel = false,
                        disable = {
                            move = false,
                        },
                    }) then end
                    --exports['an_progBar']:run(10, 'Getting the Ladder', '#E14127')
                    --Citizen.Wait(10000)
                    FreezeEntityPosition(GetPlayerPed(-1), false)
                    ClearPedTasks(PlayerPedId())
                    entity = CreateObject(GetHashKey("prop_byard_ladder01"), 0,
                        0, 0, true, true, true)
                    StartAnim(
                        'amb@world_human_muscle_free_weights@male@barbell@idle_a',
                        'idle_a')
                    FreezeEntityPosition(GetPlayerPed(-1), true)
                    AttachEntityToEntity(entity, PlayerPedId(),
                        GetPedBoneIndex(PlayerPedId(), 28422), 0.05, 0.1,
                        -0.3, 300.0, 100.0, 20.0,
                        true, true, false, true, 1, true)
                    FreezeEntityPosition(GetPlayerPed(-1), false)
                elseif escadaNaMao and not escadaNoCarro then
                    escadaNoCarro = true
                    escadaNaMao = false
                    StartAnim('mini@repair', 'fixing_a_ped')
                    FreezeEntityPosition(GetPlayerPed(-1), true)
                    if lib.progressBar({
                        duration = 3000,
                        label = 'Putting Back the Ladder',
                        useWhileDead = false,
                        canCancel = false,
                        disable = {
                            move = false,
                        },
                    }) then end
                    --exports['an_progBar']:run(10, 'Putting Back the Ladder', '#E14127')
                    --Citizen.Wait(10000)
                    FreezeEntityPosition(GetPlayerPed(-1), false)
                    ClearPedTasks(PlayerPedId())
                    DeleteObject(entity)
                end
            end
        end

        Citizen.Wait(sleep)
    end
end)

function foraCarro()
    local ped = GetPlayerPed(-1)
    local veh = GetVehiclePedIsIn(ped, false)

    if (GetPedInVehicleSeat(veh, -1) == ped) then
        return false
    else
        return true
    end
end

function Perto()
    if Config.framework == 'esx' then
        local ped = GetPlayerPed(-1)
        local veh = GetVehiclePedIsIn(ped, false)
        local px, py, pz = table.unpack(GetEntityCoords(PlayerPedId()))

        local vehicle = ESX.Game.GetClosestVehicle(vec3(px, py, pz))

        local model = GetEntityModel(vehicle)
        local displaytext = GetDisplayNameFromVehicleModel(model)
        local name = GetLabelText(displaytext)
        local vehicleCoords = GetEntityCoords(vehicle)
        local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),
            vehicleCoords.x, vehicleCoords.y,
            vehicleCoords.z, true)

        if (name == "Burrito") and distance < 2.5 then
            if not escadaNaMao then
                DrawText3D(GetEntityCoords(vehicle).x, GetEntityCoords(vehicle).y, GetEntityCoords(vehicle).z + 1.5, Config.Locales["cogerescala"])
            else
                DrawText3D(GetEntityCoords(vehicle).x, GetEntityCoords(vehicle).y, GetEntityCoords(vehicle).z + 1.5, Config.Locales["saveescalera"])
            end

            return true
        else
            return false
        end

    elseif Config.framework == 'qbcore' then
        local ped = GetPlayerPed(-1)
        local veh = GetVehiclePedIsIn(ped, false)
        local px, py, pz = table.unpack(GetEntityCoords(PlayerPedId()))

        local vehicle = QBCore.Functions.GetClosestVehicle(vec3(px, py, pz))

        local model = GetEntityModel(vehicle)
        local displaytext = GetDisplayNameFromVehicleModel(model)
        local name = GetLabelText(displaytext)
        local vehicleCoords = GetEntityCoords(vehicle)
        local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),
            vehicleCoords.x, vehicleCoords.y,
            vehicleCoords.z, true)

        if (name == "Burrito") and distance < 2.5 then
            if not escadaNaMao then
                DrawText3D(GetEntityCoords(vehicle).x, GetEntityCoords(vehicle).y, GetEntityCoords(vehicle).z + 1.5, Config.Locales["cogerescala"])
            else
                DrawText3D(GetEntityCoords(vehicle).x, GetEntityCoords(vehicle).y, GetEntityCoords(vehicle).z + 1.5, Config.Locales["saveescalera"])
            end

            return true
        else
            return false
        end
    end
end

function ChangeClothes()
    if Config.framework == 'esx' then
        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
            if skin.sex == 0 then
                TriggerEvent('skinchanger:loadClothes', skin, Config.Clothes.male)
            elseif skin.sex == 1 then
                TriggerEvent('skinchanger:loadClothes', skin, Config.Clothes.female)
            end
        end)
    elseif Config.framework == 'qbcore' then
        local gender = QBCore.Functions.GetPlayerData().charinfo.gender
        if gender == 0 then
            TriggerEvent('qb-clothing:client:loadOutfit', Config.Uniforms.male)
        else
            TriggerEvent('qb-clothing:client:loadOutfit', Config.Uniforms.female)
        end
    end
end

function GetClothes()
    if Config.framework == 'esx' then
        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
            TriggerEvent('skinchanger:loadSkin', skin)
        end)
    elseif Config.framework == 'qbcore' then
        TriggerServerEvent('qb-clothes:loadPlayerSkin')
    end
end

function Notificacion(text)
    SetTextComponentFormat('STRING')
    AddTextComponentString(text)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

DrawText3D = function(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local px, py, pz = table.unpack(GetGameplayCamCoords())
    local scale = 0.45

    if onScreen then
        SetTextScale(scale, scale)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 215)
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x, _y)
        local factor = (string.len(text)) / 370
        DrawRect(_x, _y + 0.0150, 0.030 + factor, 0.030, 66, 66, 66, 150)
    end
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)

        if segundos > 0 then
            segundos = segundos - 1
            StartAnim('amb@world_human_hammering@male@base', 'base')
            FreezeEntityPosition(GetPlayerPed(-1), true)

            if segundos == 0 then
                FreezeEntityPosition(GetPlayerPed(-1), false)
                ClearPedTasks(PlayerPedId())
                servicoConcluido = true
                PayForJob(Config.Pay)
                lib.notify({
                    title = 'Side Job',
                    description = 'Sucessfully Repaired',
                    type = 'success',
                    position = 'center-right',
                    icon = 'briefcase',
                })     
                --exports['t-notify']:Custom({style = 'success', duration = 5000, title = 'Side Job', message = "Successfully Finish the Job", sound = false})
                --exports['t-notify']:Custom({style = 'info', duration = 5000, title = 'Side Job', message = "Check Your Pocket For The Payment", sound = false})
            end
        else
            Citizen.Wait(1000)
        end
    end
end)

function PayForJob(money)
    local can = 'sdafghjrehrw2345dfe'
    TriggerServerEvent('Roda-Electricista:PayJob', money, can)
end

function drawTxt(text, font, x, y, scale, r, g, b, a)
    SetTextFont(font)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextOutline()
    SetTextCentre(1)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x, y)
end

function Notificacion(text)
    SetTextComponentFormat('STRING')
    AddTextComponentString(text)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function impoundvehicle(vehicle)
    local playerPed = PlayerPedId()

    if IsPedInAnyVehicle(playerPed, false) then
        local vehicle = GetVehiclePedIsIn(playerPed, false)
        ESX.Game.DeleteVehicle(vehicle)
    else
        lib.notify({
            title = 'Side Job',
            description = 'Player must be inside a vehicle',
            type = 'error',
            position = 'center-right',
            icon = 'briefcase',
        })
       -- exports['t-notify']:Custom({style = 'info', duration = 5000, title = 'Side Job', message = "Player must be inside a vehicle", sound = false})
    end
end

function spawnCarJob(car)
    local SpawnPoint = vector3(-820.5, -748.1, 23.2)
    local SpawnHeading = 79.89

    local SpawnClear = ESX.Game.IsSpawnPointClear(SpawnPoint, 5.0)

    if SpawnClear then
        ESX.Game.SpawnVehicle(Config.Car, SpawnPoint, SpawnHeading, function(veh)
            vehicle = veh
            SetVehicleNumberPlateText(veh, Config.Plate)
            TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
        end)
    else
        lib.notify({
            title = 'Side Job',
            description = 'There\'s Some Vehicle on the Spawn Point',
            type = 'error',
            position = 'center-right',
            icon = 'briefcase',
        })
        --exports['t-notify']:Custom({style = 'error', duration = 5000, title = 'Side Job', message = "There's Some Vehicle on the Spawn Point", sound = false})
    end
end

Citizen.CreateThread(function()

    local blip = AddBlipForCoord(-826.2,-739.9, 28.1)
    SetBlipSprite(blip, 268)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, 0.9)
    SetBlipColour(blip, 59)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("[Sidejob] Electrician Job")
    EndTextCommandSetBlipName(blip)

end)