local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_FIREATTACK)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_FIRE)
setAttackFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 0.70, 0.80, 2, 2)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end
