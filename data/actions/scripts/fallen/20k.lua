function onUse(cid, item, frompos, item2, topos)

	if item.uid == 14456 then
 	queststatus = getPlayerStorageValue(cid,62466)
 	if queststatus == -1 then
 	doPlayerSendTextMessage(cid,22,"Você achou 20k.")
 	doPlayerAddItem(cid,2160,2)
 	setPlayerStorageValue(cid,62466,1)
 	else
 	doPlayerSendTextMessage(cid,22,"Você ja pegou este item.")
	end
	else
	return 0
	end
	
	return 1
	end 