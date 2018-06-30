function onUse(cid, item, frompos, item2, topos)

	if item.uid == 14455 then
 	queststatus = getPlayerStorageValue(cid,62465)
 	if queststatus == -1 then
 	doPlayerSendTextMessage(cid,22,"Você achou a Giant Sword.")
 	doPlayerAddItem(cid,2393,1)
 	setPlayerStorageValue(cid,62465,1)
 	else
 	doPlayerSendTextMessage(cid,22,"Você ja pegou este item.")
	end
	else
	return 0
	end
	
	return 1
	end 