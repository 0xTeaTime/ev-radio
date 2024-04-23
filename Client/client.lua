function enableRadio(enable)
  if enable then
    SetNuiFocus(enable, enable)
    SendNUIMessage({
      type = "open",
    })
  end
end

RegisterNUICallback('joinRadio', function(data, cb)
TriggerServerEvent('EV:CheckRadioFreq',data)
  cb('ok')
end)
Citizen.CreateThread(function ()
  while Config.Main.HotkeyActive == true do
    Citizen.Wait(3)
    if IsControlPressed(1, Config.Main.FirstKey) and IsControlJustPressed(1, Config.Main.SecondKey) then
      TriggerServerEvent('EV:HotKeyPressed')
  end
end
end)
RegisterNetEvent('EV:RadioHotKeyOpen')
AddEventHandler('EV:RadioHotKeyOpen',function ()
  enableRadio(true)
end)
   RegisterNetEvent('EV:PlayerDropedjnijy893bfg')
   AddEventHandler('EV:PlayerDropedjnijy893bfg',function ()
    if Config.Main.VoiceMod == "pma-voice" then
      exports['pma-voice']:setRadioChannel(0)
      exports['pma-voice']:setVoiceProperty('radioEnabled', false)
    else
      if Config.Main.VoiceMod == "mumble-voip" then
      exports["mumble-voip"]:SetRadioChannel(0)
      exports["mumble-voip"]:SetMumbleProperty("radioEnabled", false)
      end
    end
   end)
RegisterNUICallback('leaveRadio', function(data, cb)
TriggerServerEvent('EV:RadioLeaveFreq')
  cb('ok')
end)
RegisterNetEvent('EV:AddPlayerToFreq')
AddEventHandler('EV:AddPlayerToFreq',function (data)
  if Config.Main.VoiceMod == "pma-voice" then
    exports['pma-voice']:setRadioChannel(0)
    exports['pma-voice']:setRadioChannel(tonumber(data.channel))
    exports['pma-voice']:setVoiceProperty('radioEnabled', true)
 TriggerEvent('EV:RadioPlayerIn')
  else
    if Config.Main.VoiceMod == "mumble-voip" then
      exports["mumble-voip"]:SetRadioChannel(0)
      exports["mumble-voip"]:SetRadioChannel(tonumber(data.channel))
      exports["mumble-voip"]:SetMumbleProperty("radioEnabled", true)
      TriggerEvent('EV:RadioPlayerIn')
    end

  end
end)

RegisterNUICallback('escape', function(data, cb)
  SetNuiFocus(false, false)
  cb('ok')
end)

RegisterNetEvent('EV:OpenRadio')
AddEventHandler('EV:OpenRadio', function()
  SendNUIMessage({
    type = "open"
  })
  SetNuiFocus(true, true)
end)

RegisterNetEvent('EV:RadioDrop')
AddEventHandler('EV:RadioDrop', function()
  if Config.Main.VoiceMod == "pma-voice" then
    exports['pma-voice']:setRadioChannel(0)
  else
    if Config.Main.VoiceMod == "mumble-voip" then
  exports["mumble-voip"]:SetRadioChannel(0)

    end
  end
end)

