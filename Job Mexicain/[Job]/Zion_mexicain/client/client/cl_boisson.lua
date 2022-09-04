

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



-- MENU FUNCTION --

local open = false 
local mexicainMain5 = RageUI.CreateMenu('Mexicain Boisson', 'Interaction')
local mexicainMain6 = RageUI.CreateMenu('Gobelet', 'Interaction')
mexicainMain5.Display.Header = true 
mexicainMain5.Closed = function()
  open = false
end


function OpenCuisine2()
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

        RageUI.Button("Prendre le gobelet vide", "Sert à mettre de la boisson de dans ", {RightLabel = ""}, true , {
          onSelected = function()
            TriggerServerEvent('zionnes:Buygobeletvide')
          end
        })

        RageUI.Button("Boisson", nil, {RightLabel = "→→"}, true , {
          onSelected = function()
          end
        }, mexicainMain6)


    end)	

      RageUI.IsVisible(mexicainMain6,function() 

        RageUI.Separator("↓ Boission ↓")

			RageUI.Button("Préparer un gobelet de IceTea", "~r~Requis : ~w~Gobelet Vide", {RightLabel = "→→"}, true , {
				onSelected = function()
                    local playerPed = PlayerPedId()
                    TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_BUM_SHOPPING_CART', 0, true)
                    Citizen.Wait(2000)
                    TriggerServerEvent('craftdunegobeletdeicetea')
                    ClearPedTasksImmediately(playerPed)
                end
			})

			RageUI.Button("Préparer un gobelet de biére", "~r~Requis : ~w~Gobelet Vide", {RightLabel = "→→"}, true , {
				onSelected = function()
                    local playerPed = PlayerPedId()
                    TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_BUM_SHOPPING_CART', 0, true)
                    Citizen.Wait(2000)
                    TriggerServerEvent('craftdunegobeletdebiere')
                    ClearPedTasksImmediately(playerPed)
                end
			})
			RageUI.Button("Préparer un gobelet de Coca", "~r~Requis : ~w~Gobelet Vide", {RightLabel = "→→"}, true , {
				onSelected = function()
                    local playerPed = PlayerPedId()
                    TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_BUM_SHOPPING_CART', 0, true)
                    Citizen.Wait(2000)
                    TriggerServerEvent('craftdunegobeletdecoca')
                    ClearPedTasksImmediately(playerPed)
                end
			})
			RageUI.Button("Préparer un gobelet de Bupu", "~r~Requis : ~w~Gobelet Vide", {RightLabel = "→→"}, true , {
				onSelected = function()
                    local playerPed = PlayerPedId()
                    TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_BUM_SHOPPING_CART', 0, true)
                    Citizen.Wait(2000)
                    TriggerServerEvent('craftdunegobeletdebupu')
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
     {x = 375.4, y = -314.9, z = 46.9}
    }

    Citizen.CreateThread(function()
      while true do
  
        local wait = 1000
  
          for k in pairs(position) do
  
              local plyCoords = GetEntityCoords(PlayerPedId(), false)
              local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)
  
              if dist <= 7.0 then
              wait = 0
              DrawMarker(22, 375.4, -314.9, 46.9, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 0.3, 0.3, 0.3, 255, 235, 59, 255, true, true, p19, true)  
  
          
              if dist <= 1.0 then
                 wait = 0
                     Visual.Subtitle("Appuyer sur ~f~[E] pour intéragir", 1)
                  if IsControlJustPressed(1,51) then
            OpenCuisine2()
              end
          end
      end
      Citizen.Wait(wait)
      end
  end
  end)