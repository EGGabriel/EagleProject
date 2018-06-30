local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_EXPLOSIONHIT)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_FIRE)
--setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 0, 0, 0, 0)

function onCastSpell(cid, var)
	alvo = 	getCreatureTarget(cid)
	alvoPos = getCreaturePosition(alvo)
	cidPos = getCreaturePosition(cid)

	doSendMagicEffect(alvoPos, CONST_ME_FIREAREA)
	doSendMagicEffect(alvoPos, CONST_ME_HITBYFIRE)
	doSendDistanceShoot(cidPos, alvoPos, CONST_ANI_WHIRLWINDSWORD)
	doTeleportThing(cid, alvoPos, 0)
	
	doCombat(cid, combat, var)
end
