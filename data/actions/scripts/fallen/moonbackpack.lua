function onUse(cid, item, frompos, item2, topos)

   	if item.uid == 7002 then
   		queststatus = getPlayerStorageValue(cid,7001)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have a Moon Backpack with items inside.")
			local bag = doPlayerAddItem(cid, 10521, 1)
            doAddContainerItem(bag, 2160, 100)
            doAddContainerItem(bag, 10529, 1)
			doAddContainerItem(bag, 8866, 1)
   			setPlayerStorageValue(cid,7001,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
		return 0
   	    end
	end	
   	return 1
end
