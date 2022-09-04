TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

TriggerEvent('esx_phone:registerNumber', 'mexicain', 'alerte mexicain', true, true)

TriggerEvent('esx_society:registerSociety', 'mexicain', 'mexicain', 'society_mexicain', 'society_mexicain', 'society_mexicain', {type = 'public'})

RegisterServerEvent('Ouvre:mexicain')
AddEventHandler('Ouvre:mexicain', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Mexicano', '~p~Annonce', 'Le Mexicano est ~g~Ouvert~s~!', 'char_taco', 8)
	end
end)

RegisterServerEvent('Ferme:mexicain')
AddEventHandler('Ferme:mexicain', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Mexicano', '~p~Annonce', 'Le Mexicano est désormais ~r~Fermer~s~!', 'char_taco', 8)
	end
end)

RegisterServerEvent('Recru:mexicain')
AddEventHandler('Recru:mexicain', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Mexicano', '~p~Annonce', 'Recrutement en cours, rendez-vous chez le Mexicano!', 'char_taco', 8)
	end
end)

RegisterServerEvent('esx_mexicainjob:prendreitems')
AddEventHandler('esx_mexicainjob:prendreitems', function(itemName, count)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local sourceItem = xPlayer.getInventoryItem(itemName)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_mexicain', function(inventory)
		local inventoryItem = inventory.getItem(itemName)

		-- is there enough in the society?
		if count > 0 and inventoryItem.count >= count then

			-- can the player carry the said amount of x item?
			if sourceItem.weight ~= -1 and (sourceItem.count + count) > sourceItem.weight then
				TriggerClientEvent('esx:showNotification', _source, "quantité invalide")
			else
				inventory.removeItem(itemName, count)
				xPlayer.addInventoryItem(itemName, count)
				TriggerClientEvent('esx:showNotification', _source, 'Objet retiré', count, inventoryItem.label)
			end
		else
			TriggerClientEvent('esx:showNotification', _source, "quantité invalide")
		end
	end)
end)



RegisterNetEvent('esx_mexicainjob:stockitem')
AddEventHandler('esx_mexicainjob:stockitem', function(itemName, count)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local sourceItem = xPlayer.getInventoryItem(itemName)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_mexicain', function(inventory)
		local inventoryItem = inventory.getItem(itemName)

		-- does the player have enough of the item?
		if sourceItem.count >= count and count > 0 then
			xPlayer.removeInventoryItem(itemName, count)
			inventory.addItem(itemName, count)
			TriggerClientEvent('esx:showNotification', _source, "Objet déposé "..count..""..inventoryItem.label.."")
		else
			TriggerClientEvent('esx:showNotification', _source, "quantité invalide")
		end
	end)
end)

RegisterNetEvent('zionnes:Buymexicainfroid2')
AddEventHandler('zionnes:Buymexicainfroid2', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 750
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

        TriggerEvent('esx_addonaccount:getSharedAccount', 'society_mexicain', function(account)
        societyAccount = account
        end)
        xPlayer.removeMoney(price)
        societyAccount.addMoney (price)
        xPlayer.addInventoryItem('mexicainfroid2', 1)
        TriggerClientEvent('esx:showNotification', source, "~g~Achats~w~ effectué !")
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)

RegisterNetEvent('zionnes:Buymexicainfroid3')
AddEventHandler('zionnes:Buymexicainfroid3', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 620
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

        TriggerEvent('esx_addonaccount:getSharedAccount', 'society_mexicain', function(account)
        societyAccount = account
        end)
        xPlayer.removeMoney(price)
        societyAccount.addMoney (price)
        xPlayer.addInventoryItem('vingtmexicainfroid3', 1)
        TriggerClientEvent('esx:showNotification', source, "~g~Achats~w~ effectué !")
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)


ESX.RegisterServerCallback('esx_mexicainjob:inventairejoueur', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local items   = xPlayer.inventory

	cb({items = items})
end)

ESX.RegisterServerCallback('esx_mexicainjob:prendreitem', function(source, cb)
	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_mexicain', function(inventory)
		cb(inventory.items)
	end)
end)

RegisterNetEvent('craftdufajitas')
AddEventHandler('craftdufajitas', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    local viande = xPlayer.getInventoryItem('viande').count
    local fajitas = xPlayer.getInventoryItem('fajitas').count

    if fajitas > 50 then
        TriggerClientEvent('esx:showNotification', source, '~r~Tu à ateint la limite')
    elseif viande < 1 then
        TriggerClientEvent('esx:showNotification', source, '~r~tu n\'as plus de viande pour faire un fajitas')
    else
        xPlayer.removeInventoryItem('viande', 1)
        xPlayer.addInventoryItem('fajitas', 1)    
    end
end)

RegisterNetEvent('craftduguacamole')
AddEventHandler('craftduguacamole', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    local avocat = xPlayer.getInventoryItem('avocat').count
    local guacamole = xPlayer.getInventoryItem('guacamole').count

    if guacamole > 60 then
        TriggerClientEvent('esx:showNotification', source, '~r~Tu à ateint la limite')
    elseif avocat < 2 then
        TriggerClientEvent('esx:showNotification', source, '~r~tu n\'as plus de de avocat pour faire ceci')
    else
        xPlayer.removeInventoryItem('avocat', 2)
        xPlayer.addInventoryItem('guacamole', 1)    
    end
end)

RegisterNetEvent('coupepatate')
AddEventHandler('coupepatate', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    local patate = xPlayer.getInventoryItem('patate').count
    local patatecoupee = xPlayer.getInventoryItem('patatecoupee').count

    if patatecoupee > 60 then
        TriggerClientEvent('esx:showNotification', source, '~r~Tu à ateint la limite')
    elseif patate < 1 then
        TriggerClientEvent('esx:showNotification', source, '~r~tu n\'as plus de patate a coupée')
    else
        xPlayer.removeInventoryItem('patate', 1)
        xPlayer.addInventoryItem('patatecoupee', 1)    
    end
end)


RegisterNetEvent('craftdunepetitefrite')
AddEventHandler('craftdunepetitefrite', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    local patatecoupee = xPlayer.getInventoryItem('patatecoupee').count
    local petitefrite = xPlayer.getInventoryItem('petitefrite').count

    if petitefrite > 60 then
        TriggerClientEvent('esx:showNotification', source, '~r~Tu à ateint la limite')
    elseif patatecoupee < 1 then
        TriggerClientEvent('esx:showNotification', source, '~r~tu n\'as plus de patate coupée pour faire une petite frites')
    else
        xPlayer.removeInventoryItem('patatecoupee', 1)
        xPlayer.addInventoryItem('petitefrite', 1)    
    end
end)

RegisterNetEvent('craftdunemoyennefrite')
AddEventHandler('craftdunemoyennefrite', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    local patatecoupee = xPlayer.getInventoryItem('patatecoupee').count
    local moyennefrite = xPlayer.getInventoryItem('moyennefrite').count

    if moyennefrite > 60 then
        TriggerClientEvent('esx:showNotification', source, '~r~Tu à ateint la limite')
    elseif patatecoupee < 2 then
        TriggerClientEvent('esx:showNotification', source, '~r~tu n\'as plus de patate coup�e pour faire une moyenne frites')
    else
        xPlayer.removeInventoryItem('patatecoupee', 2)
        xPlayer.addInventoryItem('moyennefrite', 1)    
    end
end)

RegisterNetEvent('craftdunegrandefrite')
AddEventHandler('craftdunegrandefrite', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    local patatecoupee = xPlayer.getInventoryItem('patatecoupee').count
    local grandefrite = xPlayer.getInventoryItem('grandefrite').count

    if grandefrite > 60 then
        TriggerClientEvent('esx:showNotification', source, '~r~Tu à ateint la limite')
    elseif patatecoupee < 3 then
        TriggerClientEvent('esx:showNotification', source, '~r~tu n\'as plus de patate coup�e pour faire une grande frites')
    else
        xPlayer.removeInventoryItem('patatecoupee', 3)
        xPlayer.addInventoryItem('grandefrite', 1)    
    end
end)

RegisterNetEvent('recoltviande')
AddEventHandler('recoltviande', function()
    local item = "viande"
    local weightitem = 50
    local xPlayer = ESX.GetPlayerFromId(source)
    local nbitemdansinventaire = xPlayer.getInventoryItem(item).count
    

    if nbitemdansinventaire >= weightitem then
        TriggerClientEvent('esx:showNotification', source, "Ta pas assez de place dans ton inventaire!")
        recoltepossible = false
    else
        xPlayer.addInventoryItem(item, 1)
        TriggerClientEvent('esx:showNotification', source, "Récolte en cours...")
		return
    end
end)

RegisterNetEvent('recoltavocat')
AddEventHandler('recoltavocat', function()
    local item = "avocat"
    local weightitem = 50
    local xPlayer = ESX.GetPlayerFromId(source)
    local nbitemdansinventaire = xPlayer.getInventoryItem(item).count
    

    if nbitemdansinventaire >= weightitem then
        TriggerClientEvent('esx:showNotification', source, "Ta pas assez de place dans ton inventaire!")
        recoltepossible = false
    else
        xPlayer.addInventoryItem(item, 1)
        TriggerClientEvent('esx:showNotification', source, "Récolte en cours...")
		return
    end
end)

RegisterNetEvent('recoltpatate')
AddEventHandler('recoltpatate', function()
    local item = "patate"
    local weightitem = 50
    local xPlayer = ESX.GetPlayerFromId(source)
    local nbitemdansinventaire = xPlayer.getInventoryItem(item).count
    

    if nbitemdansinventaire >= weightitem then
        TriggerClientEvent('esx:showNotification', source, "Ta pas assez de place dans ton inventaire!")
        recoltepossible = false
    else
        xPlayer.addInventoryItem(item, 1)
        TriggerClientEvent('esx:showNotification', source, "Récolte en cours...")
		return
    end
end)


-- Craft boisson

RegisterNetEvent('zionnes:Buygobeletvide')
AddEventHandler('zionnes:Buygobeletvide', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 750
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

        TriggerEvent('esx_addonaccount:getSharedAccount', 'society_mexicain', function(account)
        societyAccount = account
        end)
        xPlayer.removeMoney(price)
        societyAccount.addMoney (price)
        xPlayer.addInventoryItem('gobeletvide', 1)
        TriggerClientEvent('esx:showNotification', source, "~g~Goble-vide~w~ donner !")
    else
         TriggerClientEvent('esx:showNotification', source, "il y a plus de Goblet-vide")
    end
end)

-- Craft boission

RegisterNetEvent('craftdunegobeletdecoca')
AddEventHandler('craftdunegobeletdecoca', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    local gobeletvide = xPlayer.getInventoryItem('gobeletvide').count
    local gobeletdecoca = xPlayer.getInventoryItem('gobeletdecoca').count

    if gobeletdecoca > 60 then
        TriggerClientEvent('esx:showNotification', source, '~r~Tu à ateint la limite')
    elseif gobeletvide < 1 then
        TriggerClientEvent('esx:showNotification', source, '~r~tu n\'as plus de gobelet pour mettre le Coca')
    else
        xPlayer.removeInventoryItem('gobeletvide', 1)
        xPlayer.addInventoryItem('gobeletdecoca', 1)    
    end
end)

RegisterNetEvent('craftdunegobeletdeicetea')
AddEventHandler('craftdunegobeletdeicetea', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    local gobeletvide = xPlayer.getInventoryItem('gobeletvide').count
    local gobeletdeicetea = xPlayer.getInventoryItem('gobeletdeicetea').count

    if gobeletdeicetea > 60 then
        TriggerClientEvent('esx:showNotification', source, '~r~Tu à ateint la limite')
    elseif gobeletvide < 1 then
        TriggerClientEvent('esx:showNotification', source, '~r~tu n\'as plus de gobelet pour mettre de l\'ice tea !')
    else
        xPlayer.removeInventoryItem('gobeletvide', 1)
        xPlayer.addInventoryItem('gobeletdeicetea', 1)    
    end
end)

RegisterNetEvent('craftdunegobeletdebiere')
AddEventHandler('craftdunegobeletdebiere', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    local gobeletvide = xPlayer.getInventoryItem('gobeletvide').count
    local gobeletdebiere = xPlayer.getInventoryItem('gobeletdebiere').count

    if gobeletdebiere > 60 then
        TriggerClientEvent('esx:showNotification', source, '~r~Tu à ateint la limite')
    elseif gobeletvide < 1 then
        TriggerClientEvent('esx:showNotification', source, '~r~tu n\'as plus de gobelet pour mettre la biére !')
    else
        xPlayer.removeInventoryItem('gobeletvide', 1)
        xPlayer.addInventoryItem('gobeletdebiere', 1)    
    end
end)

RegisterNetEvent('craftdunegobeletdebupu')
AddEventHandler('craftdunegobeletdebupu', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    local gobeletvide = xPlayer.getInventoryItem('gobeletvide').count
    local gobeletdebupu = xPlayer.getInventoryItem('gobeletdebupu').count

    if gobeletdebupu > 60 then
        TriggerClientEvent('esx:showNotification', source, '~r~Tu à ateint la limite')
    elseif gobeletvide < 1 then
        TriggerClientEvent('esx:showNotification', source, '~r~tu n\'as plus de gobelet pour mettre du bupu !')
    else
        xPlayer.removeInventoryItem('gobeletvide', 1)
        xPlayer.addInventoryItem('gobeletdebupu', 1)    
    end
end)

