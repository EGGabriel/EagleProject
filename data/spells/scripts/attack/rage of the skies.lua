local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 47)

function onGetFormulaValues(cid, level, maglevel)
	min = -((level * 7) + (maglevel * 7))
	max = -((level * 7) + (maglevel * 7))
	return min, max
end

setCombatCallback(combat1, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, CONST_ME_ENERGYHIT)

function onGetFormulaValues(cid, level, maglevel)
	min = -((level * 5) + (maglevel * 7))
	max = -((level * 5) + (maglevel * 7))
	return min, max
end

setCombatCallback(combat2, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local area1 = createCombatArea(AREA_CROSS5X5)
local area2 = createCombatArea(AREA_CROSS4X4)
setCombatArea(combat1, area1)
setCombatArea(combat2, area2)

function onCastSpell(cid, var)
	if getPlayerStorageValue(cid,10033) >= 1 then
		doCombat(cid, combat1, var)
	else
		doCombat(cid, combat2, var)
	end
	return true
end

