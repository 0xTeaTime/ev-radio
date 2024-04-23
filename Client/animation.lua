local inradio = false
RegisterNetEvent('EV:RadioPlayerIn')
AddEventHandler('EV:RadioPlayerIn',function ()
	inradio = true
end)
RegisterNetEvent('EV:RadioPlayerOut')
AddEventHandler('EV:RadioPlayerOut',function ()
	inradio = false
end)
Citizen.CreateThread(function()
	while true do
		Citizen.Wait( 2 )
		local ped = PlayerPedId()
		if DoesEntityExist( ped ) and not IsEntityDead( ped ) and not IsPedCuffed(ped) then
			if inradio then
			if not IsPauseMenuActive() then
				loadAnimDict("random@arrests")
				loadAnimDict("cellphone@")
				if IsControlJustReleased( 0, 137 ) and IsEntityPlayingAnim(ped, "random@arrests", "generic_radio_enter", 3) or IsEntityPlayingAnim(ped, "random@arrests", "radio_chatter", 3) then
					ClearPedTasks(ped)
				else
					if IsControlJustPressed( 0, 137 ) and not IsEntityPlayingAnim(ped, "cellphone@", "cellphone_text_to_call", 3) and not IsPlayerFreeAiming(PlayerId()) then
						TaskPlayAnim(ped, "random@arrests", "generic_radio_enter", 8.0, 2.0, -1, 50, 2.0, 0, 0, 0 )
					elseif IsControlJustPressed( 0, 137 ) and not IsEntityPlayingAnim(ped, "cellphone@", "cellphone_text_to_call", 3) and IsPlayerFreeAiming(PlayerId()) then
						TaskPlayAnim(ped, "random@arrests", "radio_chatter", 8.0, 2.0, -1, 50, 2.0, 0, 0, 0 )
				 end
			  end
		  end
		else
			Citizen.Wait( 500 )
		end
	end
	end
  end)
function loadAnimDict(dict)
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Citizen.Wait(1)
	end
end
