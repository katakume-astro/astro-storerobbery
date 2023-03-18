
print('Astro-Store-Robbery | katakume#5873')


lib.callback.register('astro-storerobbery:server:succes', function()
	local money = math.random(400, 1000)
	exports.ox_inventory:AddItem(source, 'money', money)
        exports['astro_lib']:log(source, 'Gracz wykonal napad na kasetke')
end)

lib.callback.register('astro-storerobbery:server:removeItem', function()
	exports.ox_inventory:RemoveItem(source, 'lockpick', 1)
end)


ESX.RegisterServerCallback('getPoliceCount', function(src, cb) -- esx discord
	local policeTable = ESX.GetExtendedPlayers("job", "police")
	local policeCount = 0
  
	for v in pairs(policeTable) do
	  policeCount = policeCount + 1
	end
  
	cb(policeCount)
  end)
