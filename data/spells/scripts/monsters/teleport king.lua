local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 6)

function onCastSpell(cid, var)
	doTeleportThing(cid, getCreaturePosition(getCreatureTarget(cid)))
	return doCombat(cid, combat, var) 
end