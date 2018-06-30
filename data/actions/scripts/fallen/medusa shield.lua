function onUse(cid, item, frompos, item2, topos)

	if item.uid == 14453 then
 	queststatus = getPlayerStorageValue(cid,62463)
 	if queststatus == -1 then
 	doPlayerSendTextMessage(cid,22,"Você achou a Medusa Shield.")
 	doPlayerAddItem(cid,2536,1)
 	setPlayerStorageValue(cid,62463,1)
 	else
 	doPlayerSendTextMessage(cid,22,"Você ja pegou este item.")
	end
	else
	return 0
	end
	
	return 1
	end 