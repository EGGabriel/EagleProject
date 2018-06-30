function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)

    local pos = {x = 628, y = 771, z = 7}

		
	if getPlayerStorageValue(cid, 91002) == "Finished" then
	else
	doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Sorry not possible, you need to ask Roger's permission.")
	doTeleportThing(cid, fromPosition, true)
    doSendMagicEffect(getPlayerPosition(cid), CONST_ME_TELEPORT)
	doTeleportThing(cid, pos, true)
	doSendMagicEffect(pos, CONST_ME_TELEPORT)
	end		
 
return true
end