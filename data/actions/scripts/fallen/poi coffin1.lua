function onUse(cid, item, frompos, item2, topos)
    local place = {x=688, y=808, z=8}
	doTeleportThing(cid,place)
	doSendMagicEffect(getPlayerPosition(cid),CONST_ME_TELEPORT)
   	return true
end
