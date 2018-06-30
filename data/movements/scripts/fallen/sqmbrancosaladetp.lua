function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
		
	if getPlayerLevel(cid) < 150 then
    doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Sorry not possible, level 150+.")
	doTeleportThing(cid, fromPosition, true)
	end		
 
return true
end