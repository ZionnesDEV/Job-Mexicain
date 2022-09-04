Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(100)
    end
    while ESX.GetPlayerData().job == nil do
		Citizen.Wait(100)
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

print("Ce script a été réalisé par ZiOnnes#4250")
print("Ce script a été réalisé par ZiOnnes#4250")
print("Ce script a été réalisé par ZiOnnes#4250")
print("Ce script a été réalisé par ZiOnnes#4250")

-- MENU FUNCTION --

local open = false 
local mexicainMain2 = RageUI.CreateMenu('Mexicain', 'Interaction')
local subMenu5 = RageUI.CreateSubMenu(mexicainMain2, "Annonces", "Interaction")
local mexicainMenu6 = RageUI.CreateSubMenu(mexicainMain2, "Farm", "Interaction")
mexicainMain2.Display.Header = true 
mexicainMain2.Closed = function()
  open = false
end

function OpenMenumexicain()
	if open then 
		open = false
		RageUI.Visible(mexicainMain2, false)
		return
	else
		open = true 
		RageUI.Visible(mexicainMain2, true)
		CreateThread(function()
		while open do 
		   RageUI.IsVisible(mexicainMain2,function()

			RageUI.Separator("↓ Annonces ↓")
			RageUI.Button("Annonces", nil, {RightLabel = "→"}, true , {
				onSelected = function()
				end
			}, subMenu5)

			RageUI.Separator("↓ Factures ↓")
			RageUI.Button("Faire une Facture", nil, {RightLabel = "→→"}, true , {
				onSelected = function()
					OpenBillingMenu2()
                    RageUI.CloseAll()
				end
			})

		
		
			RageUI.Separator("↓ Farms ↓")
			RageUI.Button("Pour accéder au farms", nil, {RightLabel = "→→"}, true , {
				onSelected = function()
				end
			}, mexicainMenu6)

			end)


			RageUI.IsVisible(mexicainMenu6,function() 

				RageUI.Button("Point de récolte de viande", nil, {RightLabel = "→"}, true , {
					onSelected = function()
						SetNewWaypoint(-78.8, 6221.8, 31.1)  
					end
				})

				RageUI.Button("Point de récolte de Avocat", nil, {RightLabel = "→"}, true , {
					onSelected = function()
						SetNewWaypoint(2036.2, 4953.3, 40.9) 
					end
				})

				RageUI.Button("Point de récolte de Patate", nil, {RightLabel = "→"}, true , {
					onSelected = function()
						SetNewWaypoint(311.4, 6610.5, 28.9) 
					end
				})

			end) 

			RageUI.IsVisible(subMenu5,function() 

				RageUI.Button("Annonce Ouvertures", nil, {RightLabel = "→"}, true , {
					onSelected = function()
						TriggerServerEvent('Ouvre:mexicain')
					end
				})
	
				RageUI.Button("Annonce Fermetures", nil, {RightLabel = "→"}, true , {
					onSelected = function()
						TriggerServerEvent('Ferme:mexicain')
					end
				})

				RageUI.Button("Annonce Recrutement", nil, {RightLabel = "→"}, true , {
					onSelected = function()
						TriggerServerEvent('Recru:mexicain')
					end
				})
			end)
		 Wait(0)
		end
	 end)
  end
end
-- FUNCTION BILLING --

function OpenBillingMenu2()

	ESX.UI.Menu.Open(
	  'dialog', GetCurrentResourceName(), 'billing',
	  {
		title = "Facture"
	  },
	  function(data, menu)
	  
		local amount = tonumber(data.value)
		local player, distance = ESX.Game.GetClosestPlayer()
  
		if player ~= -1 and distance <= 3.0 then
  
		  menu.close()
		  if amount == nil then
			  ESX.ShowNotification("~r~Problèmes~s~: Montant invalide")
		  else
			local playerPed        = PlayerPedId()
			TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TIME_OF_DEATH', 0, true)
			Citizen.Wait(5000)
			  TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(player), 'society_mexicain', ('mexicain'), amount)
			  Citizen.Wait(1000)
			  ESX.ShowNotification("~r~Vous avez bien envoyer la facture")
		  end
  
		else
		  ESX.ShowNotification("~r~Problèmes~s~: Aucun joueur à proximitée")
		end
  
	  end,
	  function(data, menu)
		  menu.close()
	  end
	)
  end

-- OUVERTURE DU MENU --

Keys.Register('F6', 'Mexicain', 'Ouvrir le menu mexicain', function()
	if ESX.PlayerData.job and ESX.PlayerData.job.name == 'mexicain' then
    	OpenMenumexicain()
	end
end)