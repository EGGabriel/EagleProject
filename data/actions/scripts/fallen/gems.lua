function onUse(cid, item, fromPosition, itemEx, toPosition)

  if (getPlayerGroupId(cid) == 3) or (getPlayerGroupId(cid) == 4) then 
  doPlayerSendTextMessage(cid,22,"[GM] and [CM] cannot absorb soul gems.")
  return true
  else
  
      gems = {2156, 2155, 2158, 2154, 2156, 2155, 2158, 2154, 2153, 2153}
      local voc = getPlayerVocation(cid)
      gem = gems[voc]
	  
      if item.itemid == gem then

               if getPlayerStorageValue(cid,5001) == -1 then
               setPlayerStorageValue(cid,5001,1)
               doUseGem(cid, item)
               doPlayerSendTextMessage(cid,22,"You absorbed the soul gem.")
               doSendMagicEffect(getPlayerPosition(cid),65)
               else
               doPlayerSendTextMessage(cid,22,"You can't absorb more than one gem.")
               end
			   return true
 
      else
      return false
      end
  end 	  
  return true
  end 
