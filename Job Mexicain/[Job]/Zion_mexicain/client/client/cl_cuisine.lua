

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(10)
    end
    while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
    end
    if ESX.IsPlayerLoaded() then

		ESX.PlayerData = ESX.GetPlayerData()

    end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)


RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)


-- MENU FUNCTION --

local open = false 
local mexicainMain5 = RageUI.CreateMenu('Cuisine', '~g~Interaction')
mexicainMain5.Display.Header = true 
mexicainMain5.Closed = function()
  open = false
end


function OpenCuisine()
	if open then 
		open = false
		RageUI.Visible(mexicainMain5, false)
		return
	else
		open = true 
		RageUI.Visible(mexicainMain5, true)
		CreateThread(function()
		while open do 
		   RageUI.IsVisible(mexicainMain5,function() 

        RageUI.Separator(" Cusine ")

			RageUI.Button("Préparer un fajitas", "~r~Requis : ~w~ 1 viandes", {RightLabel = "→→"}, true , {
				onSelected = function()
                    local playerPed = PlayerPedId()
                    TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_BBQ', 0, true)
                    Citizen.Wait(20000)
                    TriggerServerEvent('craftdufajitas')
                    ClearPedTasksImmediately(playerPed)
                end
			})
			RageUI.Button("Préparer un guacamole pimenté", "~r~Requis : ~w~2 avocat", {RightLabel = "→→"}, true , {
				onSelected = function()
                    local playerPed = PlayerPedId()
                    TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_BBQ', 0, true)
                    Citizen.Wait(20000)
                    TriggerServerEvent('craftduguacamole')
                    ClearPedTasksImmediately(playerPed)
                end
			})
    
        end)			
		Wait(0)
	   end
	end)
 end
end

        ----OUVRIR LE MENU------------
  local position = {
     {x = 377.9, y = -311.8, z = 46.9}
    }

        Citizen.CreateThread(function()
          while true do
      
            local wait = 1000
      
              for k in pairs(position) do
              if ESX.PlayerData.job and ESX.PlayerData.job.name == 'mexicain' then 
                  local plyCoords = GetEntityCoords(PlayerPedId(), false)
                  local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)
      
                  if dist <= 10.0 then
                  wait = 0
                  DrawMarker(22, 377.9, -311.8, 46.9, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 0.3, 0.3, 0.3, 255, 235, 59, 255, true, true, p19, true)  
      
              
                  if dist <= 1.0 then
                     wait = 0
                      Visual.Subtitle("Appuyer sur ~f~[E] pour intéragir", 1) 
                      if IsControlJustPressed(1,51) then
                OpenCuisine()
                  end
              end
          end
          end
          Citizen.Wait(wait)
          end
      end
      end)