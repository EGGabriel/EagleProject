function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)

    local positions = {
    {x = 700, y = 700, z = 7},
    {x = 359, y = 834, z = 7},
    {x = 305, y = 526, z = 7},
	}
		
	if getPlayerStorageValue(cid, 10120) > 0 then
	i = 0
	
		repeat	
		i = i + 1
			if getPlayerStorageValue(cid, 10120) == i then
            doSendMagicEffect(getPlayerPosition(cid), CONST_ME_TELEPORT)
			doTeleportThing(cid, positions[i], true)
			doSendMagicEffect(positions[i], CONST_ME_TELEPORT)
			end
		until i == 3	
		
	end
 
return true
end