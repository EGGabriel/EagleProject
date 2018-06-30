local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, 51)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_CAKE)

function onGetFormulaValues(cid, level, maglevel)
	min = -(200) 
	max = -(320) 
	return min, max
end
setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local area = createCombatArea({{3}})
setCombatArea(combat, area)

function onUseWeapon(cid, var)
return doCombat(cid, combat, var)
end