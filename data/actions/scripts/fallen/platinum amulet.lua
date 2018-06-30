function onUse(cid, item, frompos, item2, topos)

	if item.uid == 14454 then
 	queststatus = getPlayerStorageValue(cid,62464)
 	if queststatus == -1 then
 	doPlayerSendTextMessage(cid,22,"Você achou o Platinum Amuet.")
 	doPlayerAddItem(cid,2171,1)
 	setPlayerStorageValue(cid,62464,1)
 	else
 	doPlayerSendTextMessage(cid,22,"Você ja pegou este item.")
	end
	else
	return 0
	end
	
	return 1
	end 