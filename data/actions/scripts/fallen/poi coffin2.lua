function onUse(cid, item, frompos, item2, topos)
    local pos = {x = 1017, y = 739, z = 6}
	
    if getPlayerStorageValue(cid, 7091) == -1 then
	   setPlayerStorageValue(cid, 7091, 2)
	   doSendMagicEffect(pos, CONST_ME_PLANTATTACK)
	else
	end
	
   	return true
end
