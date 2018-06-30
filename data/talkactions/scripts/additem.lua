function onSay(cid, words, param, channel) -- Script por Avazquez e modificado por SmoOkeR
local t = string.explode(param, ",")
  if t[1] ~= nil and t[2] ~= nil then
  local list = {}
  for i, tid in ipairs(getPlayersOnline()) do -- Script por Avazquez e modificado por SmoOkeR
  list[i] = tid
  end
  for i = 1, #list do
        doPlayerAddItem(list[i],t[1],t[2])
  end -- Script por Avazquez e modificado por SmoOkeR - xtibia.com/forum
  doBroadcastMessage(getPlayerName(cid) .. " enviou um presente: " .. t[2] .." ".. getItemNameById(t[1]) .. " para todos os players online!")
  else
  doPlayerPopupFYI(cid, "No parm...\nSend:\n /itemadd itemid,how_much_items\nexample:\n /itemadd 2160,10")
  end
return true
end -- Script por Avazquez e modificado por SmoOkeR - xtibia.com/forum