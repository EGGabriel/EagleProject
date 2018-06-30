function onUse(cid, item, frompos, item2, topos)

	if item.uid == 14452 then
 	queststatus = getPlayerStorageValue(cid,62462)
 	if queststatus == -1 then
 	doPlayerSendTextMessage(cid,22,"Você achou o Crown Armor.")
 	doPlayerAddItem(cid,2487,1)
 	setPlayerStorageValue(cid,62462,1)
 	else
 	doPlayerSendTextMessage(cid,22,"Você ja pegou este item.")
	end
	else
	return 0
	end
	
	return 1
	end 