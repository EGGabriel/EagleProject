function onUse(cid, item, frompos, item2, topos)

	if item.uid == 20161 then
 	queststatus = getPlayerStorageValue(cid,65476)
 	if queststatus == -1 then
 	doPlayerSendTextMessage(cid,22,"Você achou uma Boots Of Haste.")
 	doPlayerAddItem(cid,2195,1)
 	setPlayerStorageValue(cid,65476,1)
 	else
 	doPlayerSendTextMessage(cid,22,"Você ja pegou este item.")
	end
	else
	return 0
	end
	
	return 1
	end 