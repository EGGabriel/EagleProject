function onUse(cid, item, frompos, item2, topos)

	if item.uid == 2123 then
 	queststatus = getPlayerStorageValue(cid,1126)
 	if queststatus == -1 then
 	doPlayerSendTextMessage(cid,22,"Você encontrou a Dragon Scale Mail.")
 	doPlayerAddItem(cid,2492,1)
 	setPlayerStorageValue(cid,1126,1)
 	else
 	doPlayerSendTextMessage(cid,22,"Você ja pegou este item.")
	end
	else
	return 0
	end
	
	return 1
	end 