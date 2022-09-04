

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
local fritesMain = RageUI.CreateMenu('Mexicain', 'Interaction')
fritesMain.Display.Header = true 
fritesMain.Closed = function()
  open = false
end


function OpenFrites()
	if open then 
		open = false
		RageUI.Visible(fritesMain, false)
		return
	else
		open = true 
		RageUI.Visible(fritesMain, true)
		CreateThread(function()
		while open do 
		   RageUI.IsVisible(fritesMain,function() 

        RageUI.Separator("↓ Mexicain ↓")

			RageUI.Button("Préparer une petite Frites", "~r~Requis : ~w~ 1 Patate Coupée", {RightLabel = "→→"}, true , {
				onSelected = function()
                    local playerPed = PlayerPedId()
                    TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_BBQ', 0, true)
                    Citizen.Wait(20000)
                    TriggerServerEvent('craftdunepetitefrite')
                    ClearPedTasksImmediately(playerPed)
                end
			})
			RageUI.Button("Préparer une moyenne frites", "~r~Requis : ~w~ 2 Patate Coupée", {RightLabel = "→→"}, true , {
				onSelected = function()
                    local playerPed = PlayerPedId()
                    TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_BBQ', 0, true)
                    Citizen.Wait(20000)
                    TriggerServerEvent('craftdunemoyennefrite')
                    ClearPedTasksImmediately(playerPed)
                end
			})

			RageUI.Button("Préparer une grande frites", "~r~Requis : ~w~ 3 Patate Coupée", {RightLabel = "→→"}, true , {
				onSelected = function()
                    local playerPed = PlayerPedId()
                    TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_BBQ', 0, true)
                    Citizen.Wait(20000)
                    TriggerServerEvent('craftdunegrandefrite')
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
     {x = 374.7, y =  -317.6, z = 46.9}
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
                  DrawMarker(22, 374.7, -317.6, 46.9, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 0.3, 0.3, 0.3, 255, 235, 59, 255, true, true, p19, true)  
      
              
                  if dist <= 1.0 then
                     wait = 0
                      Visual.Subtitle("Appuyer sur ~f~[E] pour intéragir", 1) 
                      if IsControlJustPressed(1,51) then
                OpenFrites()
                  end
              end
          end
          end
          Citizen.Wait(wait)
          end
      end
      end)