
print('Astro-Store-Robbery | katakume#5873')


RegisterNetEvent('PowodzenieNapad')
AddEventHandler('PowodzenieNapad', function()
	local pieniazki = math.random(400, 1000)
	local los = math.random(1, 10)
	exports.ox_inventory:AddItem(source, 'money', pieniazki)
	if los >= 4 then
		--exports.ox_inventory:AddItem(source, 'safecracker', 1) BEDE ROZWIJAL TEN SKRYPT PO NAPADY NA SEJFY ale to potem!
		print('true')
	end
end)

RegisterNetEvent('napadzlewszytskozle')
AddEventHandler('napadzlewszytskozle', function()
	exports.ox_inventory:RemoveItem(source, 'lockpick', 1)
end)

ESX.RegisterServerCallback('getPoliceCount', function(src, cb) -- FROM ESX DISCORD 
	local policeTable = ESX.GetExtendedPlayers("job", "police")
	local policeCount = 0
  
	for v in pairs(policeTable) do
	  policeCount = policeCount + 1
	end
  
	cb(policeCount)
  end)