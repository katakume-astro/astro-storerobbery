GlobalState.obrabowany = false

function TimerThread()
	GlobalState.obrabowany = true
	local matematyka = math.random(900000, 1500000)
    print(matematyka)
	Citizen.Wait(matematyka)
	GlobalState.obrabowany = false
end
-----------------------------------------------
--              KONIEC                       --
-----------------------------------------------
RegisterNetEvent('napadnaskleprozpocznijclient')
AddEventHandler('napadnaskleprozpocznijclient', function()
    local state = GlobalState.obrabowany
    ESX.TriggerServerCallback('getPoliceCount', function(policeCount)
        print(policeCount)
        if policeCount > 0 then
      
        
    if state == false then
            local skillcheck = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy', 'easy', 'easy', 'easy'})
            
            if skillcheck then
                FreezeEntityPosition(PlayerPedId(), true)
                ExecuteCommand('me kitra pieniadze po kieszeniach')
                -- TRIGGER NA DISPATCH
                if lib.progressBar({
                    duration = 56666, 
                    label = 'Zbierasz gotowke...', 
                    useWhileDead = false, 
                    canCancel = true,
                    disable = {car = true,}, 
                    anim = {dict = 'anim@heists@ornate_bank@grab_cash', clip = 'grab'},  flag = 3})
                
                then 
                    FreezeEntityPosition(PlayerPedId(), false)
                    TriggerServerEvent("PowodzenieNapad")
                    TimerThread()
                else 
                    FreezeEntityPosition(PlayerPedId(), false)
                    TriggerServerEvent("napadzlewszytskozle")
                end 
            else
                FreezeEntityPosition(PlayerPedId(), false)
                TriggerServerEvent("napadzlewszytskozle")
            end
        else
            lib.defaultNotify({
                status = "error",
                title = "Napad na kasetke",
                position = "top",
                description = "Nie mozesz obrabowac tej kasetki, odczekaj cooldown!",
            })
        end -- CALLBACK
    else
        lib.defaultNotify({
            status = "error",
            title = "Napad na kasetke",
            position = "top",
            description = "Brak minimalnej ilosci policji na serwerze!",
        })
        end 
    end) -- CALLBACK
end)