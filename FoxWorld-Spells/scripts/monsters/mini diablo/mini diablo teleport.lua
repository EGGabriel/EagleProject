function onCastSpell(cid, var)
	alvo = 	getCreatureTarget(cid)
	alvoPos = getCreaturePosition(alvo)
	cidPos = getCreaturePosition(cid)

	doSendMagicEffect(alvoPos, CONST_ME_HOLYDAMAGE)
	doSendDistanceShoot(cidPos, alvoPos, CONST_ANI_HOLY)
	doTeleportThing(cid, alvoPos, 0)
end
