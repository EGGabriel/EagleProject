function onUse(cid, item, frompos, item2, topos)
    local id = {2145, 2148, 2152, 2160}
	local pedra = {"small diamond", "gold coin", "platinum coin", "crystal coin"}
	chance = math.random(1,4)
  	doRemoveItem(item.uid,1)
  	doPlayerSendTextMessage(cid,22,"You have used a shiny stone, which had a "..pedra[chance].." whitin.")
	doPlayerAddItem(cid,id[chance],1)
return true
end
