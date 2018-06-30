local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 44)

function onGetFormulaValues(cid, level, maglevel)
	min = -(((level * 5) + (maglevel * 30) + 50) * 1.1)
	max = -(((level * 5) + (maglevel * 30) + 60) * 1.2)
	return min, max
end

setCombatCallback(combat2, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local area2 = createCombatArea(AREA_CROSS2X2)
setCombatArea(combat2, area2)

function onCastSpell(cid, var)
		doCombat(cid, combat2, var)
	return true
end