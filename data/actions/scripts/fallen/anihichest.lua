function onUse(cid, item, frompos, item2, topos)
	
	if getPlayerStorageValue(cid,7010) == -1 then

      		if item.uid == 7011 then 		
   			doPlayerSendTextMessage(cid,22,"You have found a Stonecutter's Axe.")
   			doPlayerAddItem(cid,2431,1)
			
      		elseif item.uid == 7012 then
   			doPlayerSendTextMessage(cid,22,"You have found a Sword of Valor.")
   			doPlayerAddItem(cid,2400,1)
			
     	 	elseif item.uid == 7013 then
   			doPlayerSendTextMessage(cid,22,"You have found a Thunder Hammer.")
   			doPlayerAddItem(cid,2421,1)
			
     	 	elseif item.uid == 7014 then
   			doPlayerSendTextMessage(cid,22,"You have found an Amber Staff.")
   			doPlayerAddItem(cid,7426,1)
			
	   	    elseif item.uid == 7015 then
			doPlayerSendTextMessage(cid,22,"You have found one Flamming Arrow.")
			doPlayerAddItem(cid,7840,1)
			
			elseif item.uid == 7016 then
			doPlayerSendTextMessage(cid,22,"You have found a Demon Armor.")
			doPlayerAddItem(cid,2494,1)
			end
			
	setPlayerStorageValue(cid,7010,1)		
	else
   	doPlayerSendTextMessage(cid,22,"You already opened one chest.")
	return 0
   	end

   	return 1
end
