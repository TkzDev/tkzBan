print("^5Script ["..GetCurrentResourceName().."] ^2 Successfully Loaded")

RegisterCommand("banir", function()
  src.openNui(true)
end)

RegisterNUICallback("close",function()
  src.openNui(false)
end)

RegisterNUICallback("bannedUser",function(data, cb)
  cb((vSERVER.bannedUser(data["identifier"], data["motiveBan"])))
  src.openNui(false)
end)


src.openNui = function(nui)
  if nui then
    SetNuiFocus(true, true)
    SendNUIMessage({ action = 'openSystem', value = Config.ConfigBans })
  else
    SendNUIMessage({ action = 'closeSytem' })
    SetNuiFocus(false, false)
  end
end