local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_AIRDAMAGE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 40)
setAttackFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 0.5, 0.5, 3, 3)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end
