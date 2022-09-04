Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(5000)
	end
end)

local mainMenu = RageUI.CreateMenu('Récolte Viande', 'Mexicain')

function OpenMenuRecolteViande()
	if open then 
		open = false
		RageUI.Visible(mainMenu, false)
		return
	else
		open = true 
		RageUI.Visible(mainMenu, true)
		CreateThread(function()
		while open do 
			RageUI.IsVisible(mainMenu,function() 

			RageUI.Button("Commencer la Récolte", nil, {RightLabel = "→"}, true , {
				onSelected = function()
					FreezeEntityPosition(PlayerPedId(), true)
					StartRecolteViande()
				end
			})

			RageUI.Button("Stopper la Récolte", nil, {RightLabel = "→"}, true , {
				onSelected = function()
					FreezeEntityPosition(PlayerPedId(), false)
					StopRecolteViande()
				end
			})

			end)
		Wait(0)
		end
	end)
  	end
end

--- FUNCTION RECOLTE ---
function StopRecolteViande()
    if recoltepossible then
    	recoltepossible = false
    end
end

function StartRecolteViande()
    if not recoltepossible then
        recoltepossible = true
    while recoltepossible do
        Citizen.Wait(2000)
        TriggerServerEvent('recoltviande')
    end
    else
        recoltepossible = false
    end
end

----OUVRIR LE MENU------------
local position = {
	{x = -79.1, y = 6221.9, z = 31.1}
}

Citizen.CreateThread(function()
    while true do

      local wait = 1000

        for k in pairs(position) do
        if ESX.PlayerData.job and ESX.PlayerData.job.name == 'mexicain' then 
            local plyCoords = GetEntityCoords(PlayerPedId(), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)

            if dist <= 20.0 then
            wait = 0
            DrawMarker(22, -79.1, 6221.9, 31.1, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 0.3, 0.3, 0.3, 255, 235, 59, 255, true, true, p19, true)  

        
            if dist <= 1.0 then
               wait = 0
                Visual.Subtitle("Appuyer sur ~f~[E]~s~ pour récolter", 1) 
                if IsControlJustPressed(1,51) then
		OpenMenuRecolteViande()
            end
        end
    end
    end
    Citizen.Wait(wait)
    end
end
end)

--------------------------------------------------------------------- R�colte Avocat -------------------------------------------------------------------------

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(5000)
	end
end)

local mainMenu = RageUI.CreateMenu('Récolte de avocat', 'mexicain')

function OpenMenuRecolteAvocat()
	if open then 
		open = false
		RageUI.Visible(mainMenu, false)
		return
	else
		open = true 
		RageUI.Visible(mainMenu, true)
		CreateThread(function()
		while open do 
			RageUI.IsVisible(mainMenu,function() 

			RageUI.Button("Commencer la Récolte d'avocat", nil, {RightLabel = "→"}, true , {
				onSelected = function()
					FreezeEntityPosition(PlayerPedId(), true)
					StartRecolteAvocat()
				end
			})

			RageUI.Button("Stopper la Récolte", nil, {RightLabel = "→"}, true , {
				onSelected = function()
					FreezeEntityPosition(PlayerPedId(), false)
					StopRecolteAvocat()
				end
			})

			end)
		Wait(0)
		end
	end)
  	end
end

--- FUNCTION RECOLTE ---
function StopRecolteAvocat()
    if recoltepossible then
    	recoltepossible = false
    end
end

function StartRecolteAvocat()
    if not recoltepossible then
        recoltepossible = true
    while recoltepossible do
        Citizen.Wait(2000)
        TriggerServerEvent('recoltavocat')
    end
    else
        recoltepossible = false
    end
end

----OUVRIR LE MENU------------
local position = {
	{x = 2035.8, y = 4953.7, z = 40.9}
}

Citizen.CreateThread(function()
    while true do

      local wait = 1000

        for k in pairs(position) do
        if ESX.PlayerData.job and ESX.PlayerData.job.name == 'mexicain' then 
            local plyCoords = GetEntityCoords(PlayerPedId(), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)

            if dist <= 20.0 then
            wait = 0
            DrawMarker(22, 2035.8, 4953.7, 40.9, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 0.3, 0.3, 0.3, 255, 235, 59, 255, true, true, p19, true)  

        
            if dist <= 1.0 then
               wait = 0
                Visual.Subtitle("Appuyer sur ~f~[E]~s~ pour récolter", 1) 
                if IsControlJustPressed(1,51) then
	OpenMenuRecolteAvocat()
            end
        end
    end
    end
    Citizen.Wait(wait)
    end
end
end)

------------------------------------------------------------------------ Récolte Patate ----------------------------------------------------------------------

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(5000)
	end
end)

local mainMenu = RageUI.CreateMenu('Récolte de Patate', 'mexicain')

function OpenMenuRecoltePatate()
	if open then 
		open = false
		RageUI.Visible(mainMenu, false)
		return
	else
		open = true 
		RageUI.Visible(mainMenu, true)
		CreateThread(function()
		while open do 
			RageUI.IsVisible(mainMenu,function() 

			RageUI.Button("Commencer la Récolte de Patate", nil, {RightLabel = "→"}, true , {
				onSelected = function()
					FreezeEntityPosition(PlayerPedId(), true)
					StartRecoltePatate()
				end
			})

			RageUI.Button("Stopper la Récolte de Patate", nil, {RightLabel = "→"}, true , {
				onSelected = function()
					FreezeEntityPosition(PlayerPedId(), false)
					StopRecoltePatate()
				end
			})

			end)
		Wait(0)
		end
	end)
  	end
end

--- FUNCTION RECOLTE ---
function StopRecoltePatate()
    if recoltepossible then
    	recoltepossible = false
    end
end

function StartRecoltePatate()
    if not recoltepossible then
        recoltepossible = true
    while recoltepossible do
        Citizen.Wait(2000)
        TriggerServerEvent('recoltpatate')
    end
    else
        recoltepossible = false
    end
end

----OUVRIR LE MENU------------
local position = {
	{x = 311.4, y = 6610.5, z = 28.9}
}

Citizen.CreateThread(function()
    while true do

      local wait = 1000

        for k in pairs(position) do
        if ESX.PlayerData.job and ESX.PlayerData.job.name == 'mexicain' then 
            local plyCoords = GetEntityCoords(PlayerPedId(), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)

            if dist <= 20.0 then
            wait = 0
            DrawMarker(22, 311.4, 6610.5, 28.9, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 0.3, 0.3, 0.3, 255, 235, 59, 255, true, true, p19, true)

        
            if dist <= 1.0 then
               wait = 0
                Visual.Subtitle("Appuyer sur ~f~[E]~s~ pour récolter des Patates", 1) 
                if IsControlJustPressed(1,51) then
	OpenMenuRecoltePatate()
            end
        end
    end
    end
    Citizen.Wait(wait)
    end
end
end)



