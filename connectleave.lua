local logs = "https://discord.com/api/webhooks/824465992876425226/nzkmOS71iAhL7DUKjTrLHqpPazMO73s6kuihESE72G2WUQ99qeo66HgpjiMWFdngNaCz"
local communityname = "DARK TEAM"
local communtiylogo = "https://media.discordapp.net/attachments/825698555015987240/834265858116812830/halcksydarkteam.png?width=989&height=676" 

AddEventHandler('playerConnecting', function()
local name = GetPlayerName(source)
local ip = GetPlayerEndpoint(source)
local ping = GetPlayerPing(source)
local steamhex = GetPlayerIdentifier(source)
local connect = {
        {
            ["color"] = "16776960",
            ["title"] = "Connect",
            ["description"] = "Player: "..name.."\nIP: "..ip.."\n Steam Hex: "..steamhex.."",
	        ["footer"] = {
                ["text"] = communityname,
                ["icon_url"] = communtiylogo,
            },
        }
    }

PerformHttpRequest(logs, function(err, text, headers) end, 'POST', json.encode({username = "Connect Leave Logs ", embeds = connect}), { ['Content-Type'] = 'application/json' })
end)

AddEventHandler('playerDropped', function(reason)
local name = GetPlayerName(source)
local ip = GetPlayerEndpoint(source)
local ping = GetPlayerPing(source)
local steamhex = GetPlayerIdentifier(source)
local disconnect = {
        {
            ["color"] = "16776960",
            ["title"] = "Leave",
            ["description"] = "Player: "..name.." \nReason: "..reason.."\nIP: "..ip.."\n Steam Hex: "..steamhex.."",
	        ["footer"] = {
                ["text"] = communityname,
                ["icon_url"] = communtiylogo,
            },
        }
    }

    PerformHttpRequest(logs, function(err, text, headers) end, 'POST', json.encode({username = "Connect Leave Logs", embeds = disconnect}), { ['Content-Type'] = 'application/json' })
end)
