esx_basicneeds --> server --> main.lua: 

ESX.RegisterUsableItem('petitefrite', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('petitefrite', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	xPlayer.showNotification(_U('used_petitefrite'))
end)

ESX.RegisterUsableItem('moyennefrite', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('moyennefrite', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	xPlayer.showNotification(_U('used_moyennefrite'))
end)


ESX.RegisterUsableItem('grandefrite', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('grandefrites', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	xPlayer.showNotification(_U('grandefrite'))
end)


ESX.RegisterUsableItem('fajitas', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('fajitas', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	xPlayer.showNotification(_U('used_fajitas'))
end)

ESX.RegisterUsableItem('gobeletdecoca', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('gobeletdecoca', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 200000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	xPlayer.showNotification(_U('used_gobeletdecoca'))
end)

ESX.RegisterUsableItem('gobeletdebupu', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('gobeletdebupu', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 200000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	xPlayer.showNotification(_U('used_gobeletdeBupu'))
end)

ESX.RegisterUsableItem('gobeletdeicetea', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('gobeletdeicetea', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 200000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	xPlayer.showNotification(_U('used_gobeletdeicetea'))
end)

ESX.RegisterUsableItem('gobeletdebiere', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('gobeletdebiere', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 200000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	xPlayer.showNotification(_U('used_gobeletdebiere'))
end)