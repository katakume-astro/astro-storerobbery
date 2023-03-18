GlobalState = false

function TimerThread()
	GlobalState = true
	local math = math.random(900000, 1500000)
	Citizen.Wait(math)
	GlobalState = false
end
-----------------------------------------------
--              KONIEC                       --
-----------------------------------------------
RegisterNetEvent('astro-storerobbery:client:start')
AddEventHandler('astro-storerobbery:client:start', function()
    local state = GlobalState
    ESX.TriggerServerCallback('getPoliceCount', function(policeCount)
        if policeCount > 0 then
        if state == false then
            local skillcheck = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy', 'easy', 'easy', 'easy'})
            if skillcheck then
                FreezeEntityPosition(PlayerPedId(), true)
                ExecuteCommand('me kitra pieniadze po kieszeniach')
                -- DISPATCH
                if lib.progressBar({
                    duration = 56666, 
                    label = 'Zbierasz gotowke...', 
                    useWhileDead = false, 
                    canCancel = true,
                    disable = {car = true,}, 
                    anim = {dict = 'anim@heists@ornate_bank@grab_cash', clip = 'grab'},  flag = 3})
                
                then 
                    FreezeEntityPosition(PlayerPedId(), false)
                    lib.callback('astro-storerobbery:server:succes')
                    TimerThread()
                else 
                    FreezeEntityPosition(PlayerPedId(), false)
                    TriggerServerEvent("astro-storerobbery:server:removeItem")
                end 
            else
                FreezeEntityPosition(PlayerPedId(), false)
                TriggerServerEvent("astro-storerobbery:server:removeItem")
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
