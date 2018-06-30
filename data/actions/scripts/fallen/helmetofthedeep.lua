function onUse(cid, item, frompos, item2, topos)

   	if item.uid == 7001 then
   		queststatus = getPlayerStorageValue(cid,7001)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have a Helmet of the Deep.")
   			doPlayerAddItem(cid,5461,1)
   			setPlayerStorageValue(cid,7001,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
		return 0
   	    end
	end	
   	return 1
end
