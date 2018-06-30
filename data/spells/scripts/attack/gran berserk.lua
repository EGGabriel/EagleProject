local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, CONST_ME_CRAPS)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 44)

local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_EFFECT, 3)

function onGetFormulaValues(cid, level, maglevel)
	min = -((level * 6.8) + (maglevel * 40) + 170)
	max = -((level * 7.2) + (maglevel * 40) + 220)
	return min, max
end

setCombatCallback(combat1, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onGetFormulaValues(cid, level, maglevel)
	min = -((level * 5.5) + (maglevel * 30) + 100)
	max = -((level * 6) + (maglevel * 30) + 150)
	return min, max
end

setCombatCallback(combat2, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local area1 = createCombatArea(AREA_SPIKE)
setCombatArea(combat1, area1)

local area2 = createCombatArea(AREA_CROSS2X2)
setCombatArea(combat2, area2)

function onCastSpell(cid, var)
        if getPlayerStorageValue(cid, 10033) == 1 then
		doCombat(cid, combat1, var)
	else
		doCombat(cid, combat2, var)
	end
	return true
end