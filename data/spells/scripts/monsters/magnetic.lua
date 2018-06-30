function onCastSpell(cid, var)
	target = getCreatureTarget(cid)
	targetpos = getCreaturePosition(target)
	frompos = {x= 956, y= 525, z= 3}
	topos = {x= 959, y= 528, z= 3}
	pos = getCreaturePosition(cid)
	pos1 = {x = pos.x - 1, y = pos.y - 1, z = pos.z}
	pos2 = {x = pos.x + 1, y = pos.y - 1, z = pos.z}
	pos3 = {x = pos.x + 1, y = pos.y + 1, z = pos.z}
	pos4 = {x = pos.x - 1, y = pos.y + 1, z = pos.z}
	x = math.random(957, 958)
	y = math.random(526, 527)

	if math.random(1, 100) <= 40 then
		if isInArea(targetpos, frompos, topos) == FALSE and isPlayer(target) == TRUE then
			doTeleportThing(target, {x = x, y = y, z = 3}, TRUE)
			doSendDistanceShoot(pos, {x = x, y = y, z = 3}, CONST_ANI_ENERGY)
			doSendMagicEffect({x = x, y = y, z = 3}, CONST_ANI_ENERGY)
		end
	else
		doSendDistanceShoot(pos1, pos2, CONST_ANI_ENERGY)
		doSendDistanceShoot(pos2, pos3, CONST_ANI_ENERGY)
		doSendDistanceShoot(pos3, pos4, CONST_ANI_ENERGY)
		doSendDistanceShoot(pos4, pos1, CONST_ANI_ENERGY)
	end
end