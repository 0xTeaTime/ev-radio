local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRPclient = Tunnel.getInterface("vRP", "EV-Radio")
vRP = Proxy.getInterface("vRP")


local IsStarted = true



function RadioLogs(Title,Msg,Url)
    local embed = {}
    embed = {
        {
            ["color"] = 3538944,
            ["title"] = "**"..Title.."**",
            ["description"] = Msg,
            ["footer"] = {
            ["text"] = "Done By Ev-store || At " .. os.date("%Y-%m-%d - %H:%M:%S %p") .."",
            ["icon_url"] = "https://cdn.discordapp.com/icons/1051977376428478514/45d09e7fd02da6f95784622dade2e180.png?size=1024"
            },
        }
    }
    PerformHttpRequest(Url,
    function(err, text, headers) end, 'POST', json.encode({username = "EV-Radio", embeds = embed,avatar_url = "https://cdn.discordapp.com/attachments/803263916670058518/914253410990174258/b8a207b8ebe44387d0b58581572d437b_1.png"}), { ['Content-Type'] = 'application/json' })
end
vRP.defInventoryItem({Config.Main.ItemName,Config.Main.ItemName,Config.Main.ItemName, function(args)
    if IsStarted == true then
    local choices = {}
	choices["استخدام"] = {function(player,choice,mod)
		local user_id = vRP.getUserId({player})
        if user_id ~= nil then
            if Config.Main.TakeItem == true then
            vRP.tryGetInventoryItem({user_id,Config.Main.ItemName,1,true})
            end
            TriggerClientEvent('EV:OpenRadio', player)
            Notify(player,Config.Notify[1])
            RadioLogs("Open Radio","**Player iD :**\n||"..vRP.getUserId({player}).."||\n**Player Name :**\n||"..GetPlayerName(player).."||\n**Oppend Radio By Inventory**",Config.Main.OpenRadioLog)
            vRP.closeMenu({player})
            SetTimeout(300,function ()
                vRP.closeMenu({player})
            end)
        end
    end}
return choices
end
end, 0.05})

RegisterCommand(Config.Main.OpenCommand,function(player, args, rawCommand)
    local user_id = vRP.getUserId({player})
    if IsStarted == true then
    if Config.Main.CommandEnable then
    if user_id ~= nil then
        if Config.Main.TakeItem == true then
            if vRP.tryGetInventoryItem({user_id,Config.Main.ItemName,1, true}) then
                TriggerClientEvent('EV:OpenRadio', player)
                Notify(player,Config.Notify[1])
                RadioLogs("Open Radio","**Player iD :**\n||"..vRP.getUserId({player}).."||\n**Player Name :**\n||"..GetPlayerName(player).."||\n**Oppend Radio By Command**",Config.Main.OpenRadioLog)
            else
          Notify(player,Config.Notify[3])
        end
    else
        TriggerClientEvent('EV:OpenRadio', player)
        Notify(player,Config.Notify[1])
        RadioLogs("Open Radio","**Player iD :**\n||"..vRP.getUserId({player}).."||\n**Player Name :**\n||"..GetPlayerName(player).."||\n**Oppend Radio By Command**",Config.Main.OpenRadioLog)
        end
end
end
end
end)
RegisterCommand(Config.Main.GetPlayersCommand,function(player, args, rawCommand)
    local user_id = vRP.getUserId({player})
    if IsStarted == true then
    if user_id ~= nil then
        if vRP.hasPermission({user_id,Config.Main.GetPlayersPermission}) then
        if Config.Main.VoiceMod == "pma-voice" then
        radiolist = ""
        vRP.prompt({player , 'الموجة', '', function(player, value)
            if value ~= "" then
                value = tonumber(value)
channel = exports['pma-voice']:getPlayersInRadioChannel(value)
for source in pairs(channel) do
    if source == #channel then
        radiolist = radiolist .. "[" ..vRP.getUserId({source}).. " | " .. GetPlayerName(source) .. "]"
    else
        radiolist = radiolist .. "[" ..vRP.getUserId({source}).. " | " .. GetPlayerName(source) .. "]\n"
    end
end
if radiolist ~= "" then
Notify(player,Config.Notify[7] .. "<br>"..radiolist.."</br>")
RadioLogs("Ask About Players In Channel","**Player iD :**\n||"..vRP.getUserId({player}).."||\n**Player Name :**\n||"..GetPlayerName(player).."||\n**Asked About Players In Channel :**\n||"..value.."||\n**Players In Channel :**\n```"..radiolist.."```",Config.Main.PlayersLog)
else
    Notify(player,Config.Notify[6])
end
else
    Notify(player,Config.Notify[2])
            end
        end})
    end
else
    Notify(player,Config.Notify[5])
end
end
end
end)
RegisterServerEvent('EV:HotKeyPressed')
AddEventHandler('EV:HotKeyPressed',function ()
    local user_id = vRP.getUserId({source})
	local player = vRP.getUserSource({user_id})
    if IsStarted == true then
    if user_id ~= nil then
            vRPclient.isHandcuffed(player,{}, function(handcuffed)
                if not handcuffed then
                    if Config.Main.TakeItem ==true then
                        if vRP.tryGetInventoryItem({user_id,Config.Main.ItemName,1, true}) then
                    TriggerClientEvent('EV:RadioHotKeyOpen',player)
                    Notify(player,Config.Notify[1])
                     RadioLogs("Open Radio","**Player iD :**\n||"..vRP.getUserId({player}).."||\n**Player Name :**\n||"..GetPlayerName(player).."||\n**Oppend Radio By HotKey**",Config.Main.OpenRadioLog)
                        else
                            Notify(player,Config.Notify[3])
                end
                    else
                        Notify(player,Config.Notify[1])
                        TriggerClientEvent('EV:RadioHotKeyOpen',player)
                        RadioLogs("Open Radio","**Player iD :**\n||"..vRP.getUserId({player}).."||\n**Player Name :**\n||"..GetPlayerName(player).."||\n**Oppend Radio By HotKey**",Config.Main.OpenRadioLog)
                    end
                else
                    Notify(player,Config.Notify[8])
                end
            end)
        end
    end
end)


RegisterServerEvent('EV:CheckRadioFreq')
AddEventHandler('EV:CheckRadioFreq',function (data)
    local user_id = vRP.getUserId({source})
	local player = vRP.getUserSource({user_id})
    if IsStarted == true then
    if user_id ~= nil then
        if tonumber(data.channel) ~= nil then
    local restricted = {}
    for i,v in pairs(Config.Channels) do
        if tonumber(data.channel) ~= nil or tonumber(data.channel) ~= "" then
        if tonumber(data.channel) >= v.Min and tonumber(data.channel) <= v.Max then
            table.insert(restricted, v)
        end
    end
    end
    for i,v in pairs(restricted) do

        if vRP.hasPermission({user_id, v.Permission or {}}) and tonumber(data.channel) >= v.Min and tonumber(data.channel) <= v.Max then
             Notify(player,Config.Notify[10] .. v.Name)
            TriggerClientEvent('EV:AddPlayerToFreq',player,data)
            RadioLogs("Join Channel","**Player iD :**\n||"..vRP.getUserId({player}).."||\n**Player Name :**\n||"..GetPlayerName(player).."||\n**Join Channel Name :**\n||"..v.Name.."||\n**Channel :**\n||"..tonumber(data.channel).."||",Config.Main.JoinLog)
            break
        else
      Notify(player,Config.Notify[4] .. v.Name)
        end

    end
else
Notify(player,Config.Notify[2])
end
end
end
end)

AddEventHandler("vRP:playerLeave",function(user_id,source)
    if IsStarted == true then
  TriggerClientEvent('EV:RadioDrop',source)
    end
end)

RegisterServerEvent('EV:RadioLeaveFreq')
AddEventHandler('EV:RadioLeaveFreq',function ()
  local user_id = vRP.getUserId({source})
	local player = vRP.getUserSource({user_id})
    if IsStarted == true then
  if user_id ~= nil then
      TriggerClientEvent('EV:PlayerDropedjnijy893bfg',player)
      TriggerClientEvent('EV:RadioPlayerOut',player)
      Notify(player,Config.Notify[9])
      RadioLogs("Leave Channel","**Player iD :**\n||"..vRP.getUserId({player}).."||\n**Player Name :**\n||"..GetPlayerName(player).."||\n**Leave Channel**",Config.Main.LeaveLog)
end
end
end)



