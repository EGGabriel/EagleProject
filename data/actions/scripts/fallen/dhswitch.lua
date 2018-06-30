function onUse(cid, item, fromPosition, itemEx, toPosition)

stonepos = {x=345, y=1096, z=11, stackpos=1}
playerpos = {x=345, y=1096, z=11, stackpos=225}
stone = getThingfromPos(stonepos)
player = getThingfromPos(playerpos)

  if item.uid == 7020 and item.itemid == 1945 then
  doRemoveItem(stone.uid,1)
  doSendMagicEffect(stonepos,45)
  doSendMagicEffect(getPlayerPosition(cid),45)
  doTransformItem(item.uid,item.itemid+1)
  elseif item.uid == 7020 and item.itemid == 1946 then
  
       if isCreature(player.uid) == FALSE then
       doCreateItem(1355,1,stonepos)
       doTransformItem(item.uid,item.itemid-1)
       else
       return FALSE
       end
	   
  else
  end

return TRUE
end