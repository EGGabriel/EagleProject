function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)

    local pos = {x = 725, y = 794, z = 7}

		
	if getPlayerStorageValue(cid, 7091) == 2 then
            doSendMagicEffect(getPlayerPosition(cid), CONST_ME_TELEPORT)
			doTeleportThing(cid, pos, true)
			doSendMagicEffect(pos, CONST_ME_TELEPORT)
	else
    doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Sorry not possible.")
	doTeleportThing(cid, fromPosition, true)
	end		
 
return true
end