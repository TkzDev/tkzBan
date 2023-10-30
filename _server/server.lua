print("^1Script ["..GetCurrentResourceName().."] ^5 Successfully Loaded")

----------------------------------------------------------------------------------------------------------------------
-- PREPARES
----------------------------------------------------------------------------------------------------------------------

src.bannedUser = function(identifier, motiveBan)
  local source = source
  local user_id = vRP.getUserId(source)
  if identifier ~= nil and motiveBan ~= nil then
    local identity = vRP.userIdentity(identifier)
    for i=1, #Config.ConfigBans do
      local v = Config.ConfigBans[i]
      if v["name"] == motiveBan then
        local time = v["days"]
        vRP.kick(identifier,"Você foi banido por "..time.." dias.")
				vRP.execute("banneds/insertBanned",{ steam = identity["steam"], time = v["days"] })
				TriggerClientEvent("Notify",source,"amarelo","Passaporte <b>"..identifier.."</b> banido por <b>"..time.." dias.",5000)
				local identityS = vRP.userIdentity(user_id)
				TriggerEvent("discordLogs","Ban","**Staff:** "..identityS["name"].." "..identityS["name2"].." (#"..user_id..")\n**Baniu:** "..identifier.."\n**Por:** "..time.." dias.\n**Motivo:** "..motiveBan.."\n**Horário:** "..os.date("%H:%M:%S"),3092790)
      end
    end
  end
end