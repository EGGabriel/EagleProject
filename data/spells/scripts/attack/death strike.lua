local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MORTAREA)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SUDDENDEATH)
setAttackFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 0.70, 0.80, 2, 2)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end
