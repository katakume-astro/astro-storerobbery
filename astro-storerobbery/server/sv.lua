
print('Astro-Store-Robbery | katakume#5873')


RegisterNetEvent('astro-storerobbery:server:succes')
AddEventHandler('astro-storerobbery:server:succes', function()
	local money = math.random(400, 1000)
	exports.ox_inventory:AddItem(source, 'money', money)
end)

RegisterNetEvent('astro-storerobbery:server:removeItem')
AddEventHandler('astro-storerobbery:server:removeItem', function(item)
	exports.ox_inventory:RemoveItem(source, item, 1)
end)

ESX.RegisterServerCallback('getPoliceCount', function(src, cb)
	local policeTable = ESX.GetExtendedPlayers("job", "police")
	local policeCount = 0
  
	for v in pairs(policeTable) do
	  policeCount = policeCount + 1
	end
  
	cb(policeCount)
  end)
