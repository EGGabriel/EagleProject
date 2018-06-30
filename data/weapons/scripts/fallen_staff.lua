local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, 11)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 35)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 30)
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_DISTANCEEFFECT, 35)

local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_EFFECT, 6)
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combat3, COMBAT_PARAM_DISTANCEEFFECT, 35)

function onGetFormulaValues(cid, level, maglevel)
    if getPlayerLevel(cid) > 299 then 
	min = -(600) 
	max = -(620) 
	else
	min = -((level) + (maglevel * 1) + 80)	
	max = -((level) + (maglevel * 1) + 100)
	end
	return min, max
end
setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onGetFormulaValues(cid, level, maglevel)
    if getPlayerLevel(cid) > 299 then 
	min = -(680) 
	max = -(700) 
	else
	min = -((level) + (maglevel * 1) + 130)	
	max = -((level) + (maglevel * 1) + 150)
	end
	return min, max
end
setCombatCallback(combat2, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onGetFormulaValues(cid, level, maglevel)
    if getPlayerLevel(cid) > 299 then 
	min = -(680) 
	max = -(700) 
	else
	min = -((level) + (maglevel * 1) + 130)	
	max = -((level) + (maglevel * 1) + 150)
	end
	return min, max
end
setCombatCallback(combat3, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local area = createCombatArea({
{0, 1, 0},
{1, 3, 1},
{0, 1, 0}})
setCombatArea(combat, area)

local areasingle = createCombatArea({{3}})
setCombatArea(combat2, areasingle)
setCombatArea(combat3, areasingle)

function onUseWeapon(cid, var)
   if getPlayerStorageValue(cid,10009) == 2 then
   doCreatureAddMana(cid, -20)
   return doCombat(cid, combat2, var)
   elseif getPlayerStorageValue(cid,10009) == 3 then
   doCreatureAddMana(cid, -20)
   return doCombat(cid, combat3, var) 
   else
   return doCombat(cid, combat, var)
   end
end