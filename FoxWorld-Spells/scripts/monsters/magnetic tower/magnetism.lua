function onCastSpell(cid, var)
	local alvo = getCreatureTarget(cid)

	local alvoPos = getCreaturePosition(alvo)
	local towerPos = getCreaturePosition(cid)

	local magnetismOFF	= { fromPos={x=956,y=524,z=3} , toPos={x=959,y=527,z=3} } -- se o jogador estiver entre esta área, o magnetismo não funciona propositalmente
	if isInRange(alvoPos, magnetismOFF.fromPos, magnetismOFF.toPos) == TRUE then
		return FALSE
	end
	
	doSendMagicEffect(towerPos, CONST_ME_ENERGYAREA)

	doSendMagicEffect(alvoPos, CONST_ME_ENERGYAREA)
	doSendDistanceShoot(towerPos, alvoPos, CONST_ANI_ENERGY)

	local magnetismPlace = {x=957,y=525,z=3}
	local randomPlace = { x=magnetismPlace.x+math.random(0,1) , y=magnetismPlace.y+math.random(0,1) , z=magnetismPlace.z }
	doTeleportThing(alvo, randomPlace, 1)
	
	doSendMagicEffect(randomPlace, CONST_ME_ENERGYAREA)
	doSendDistanceShoot(towerPos, randomPlace, CONST_ANI_ENERGY)
	
	return TRUE
end
