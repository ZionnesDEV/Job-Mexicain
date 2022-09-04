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
local mexicain = RageUI.CreateMenu('Véhicule', 'Interaction')
mexicain.Display.Header = true 
mexicain.Closed = function()
  open = false
end

function Openmexicain()
     if open then 
         open = false
         RageUI.Visible(mexicain, false)
         return
     else
         open = true 
         RageUI.Visible(mexicain, true)
         CreateThread(function()
         while open do 
            RageUI.IsVisible(mexicain,function() 

                RageUI.Button("Camion de mexicain", nil, {RightLabel = "→→"}, true , {
                    onSelected = function()
                      local model = GetHashKey("mule3")
                      RequestModel(model)
                      while not HasModelLoaded(model) do Citizen.Wait(10) end
                      local pos = GetEntityCoords(PlayerPedId())
                      local vehicle = CreateVehicle(model, 417.9, -374.1, 46.9, 137.8782, true, true)
                    end
                })

                RageUI.Button("Voiture de livraison", nil, {RightLabel = "→→"}, true , {
                    onSelected = function()
                      local model = GetHashKey("rocoto")
                      RequestModel(model)
                      while not HasModelLoaded(model) do Citizen.Wait(10) end
                      local pos = GetEntityCoords(PlayerPedId())
                      local vehicle = CreateVehicle(model, 406.5, -379.9, 46.8, 137.8782, true, true)
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
	{x = 382.9, y = -327.4, z = 46.9}
}

Citizen.CreateThread(function()
    while true do

      local wait = 1000

        for k in pairs(position) do
        if ESX.PlayerData.job and ESX.PlayerData.job.name == 'mexicain' then 
            local plyCoords = GetEntityCoords(PlayerPedId(), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)

            if dist <= 15.0 then
            wait = 0
            DrawMarker(22, 382.9, -327.4, 46.9, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 0.3, 0.3, 0.3, 255, 235, 59, 255, true, true, p19, true)  

        
            if dist <= 1.0 then
               wait = 0
                      Visual.Subtitle("Appuyer sur ~f~[E] pour intéragir", 1) 
                if IsControlJustPressed(1,51) then
                  Openmexicain()
            end
        end
    end
    end
    Citizen.Wait(wait)
    end
end
end)

--- BLIPS ---

Citizen.CreateThread(function()

  local blip = AddBlipForCoord(382.9, -327.4, 46.9) 

  SetBlipSprite (blip, 354) -- Model du blip
  SetBlipDisplay(blip, 4)
  SetBlipScale  (blip, 1.5) -- Taille du blip
  SetBlipColour (blip, 2) -- Couleur du blip
  SetBlipAsShortRange(blip, true)

  BeginTextCommandSetBlipName('STRING')
  AddTextComponentSubstringPlayerName('Mexicain') -- Nom du blip
  EndTextCommandSetBlipName(blip)
end)

--- RANGER LE VEHICULE ---

local open = false 
local mexicainranger = RageUI.CreateMenu('Ranger le vehicule', 'Interaction')
mexicainranger.Display.Header = true 
mexicainranger.Closed = function()
  open = false
end

function Openmexicainranger()
     if open then 
         open = false
         RageUI.Visible(mexicainranger, false)
         return
     else
         open = true 
         RageUI.Visible(mexicainranger, true)
         CreateThread(function()
         while open do 
            RageUI.IsVisible(mexicainranger,function() 

              RageUI.Button("Ranger le véhicule", nil, {RightLabel = "→→"}, true , {
                onSelected = function()
                  local veh,dist4 = ESX.Game.GetClosestVehicle(playerCoords)
                  if dist4 < 4 then
                      DeleteEntity(veh)
                      RageUI.CloseAll()
                end
              end, })
            end)
            Wait(0)
           end
        end)
     end
  end

--- Position ---

  local position = {
    {x = 415.4, y = -375.8, z = 46.9}
  }
  
  Citizen.CreateThread(function()
      while true do
  
        local wait = 1000
  
          for k in pairs(position) do
          if ESX.PlayerData.job and ESX.PlayerData.job.name == 'mexicain' then 
              local plyCoords = GetEntityCoords(PlayerPedId(), false)
              local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)
  
              if dist <= 15.0 then
              wait = 0
              DrawMarker(22, 415.4, -375.8, 46.9, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 0.3, 0.3, 0.3, 255, 235, 59, 255, true, true, p19, true)  
  
          
              if dist <= 1.0 then
                 wait = 0
                        Visual.Subtitle("Appuyer sur ~f~[E] pour intéragir", 1) 
                  if IsControlJustPressed(1,51) then
                    Openmexicainranger()
              end
          end
      end
      end
      Citizen.Wait(wait)
      end
  end
  end)