-- status de energy
local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, CONST_ME_ENERGYHIT)
setCombatParam(combat1, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_FLASHARROW)
local condition1 = createConditionObject(CONDITION_ENERGY)
setConditionParam(condition1, CONDITION_PARAM_DELAYED, 1)
addDamageCondition(condition1, 5, 1000, -200)
setCombatCondition(combat1, condition1)

-- status de poison
local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, CONST_ME_GREEN_RINGS)
setCombatParam(combat2, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_POISONARROW)
local condition2 = createConditionObject(CONDITION_POISON)
setConditionParam(condition2, CONDITION_PARAM_DELAYED, 1)
addDamageCondition(condition2, 5, 1200, -300)
setCombatCondition(combat2, condition2)

-- status de fire
local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat3, COMBAT_PARAM_EFFECT, CONST_ME_EXPLOSIONHIT)
setCombatParam(combat3, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_BURSTARROW)
local condition3 = createConditionObject(CONDITION_FIRE)
setConditionParam(condition3, CONDITION_PARAM_DELAYED, 1)
addDamageCondition(condition3, 5, 1400, -250)
setCombatCondition(combat3, condition3)

-- status de drunk
local combat4 = createCombatObject()
setCombatParam(combat4, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat4, COMBAT_PARAM_EFFECT, CONST_ME_STUN)
setCombatParam(combat4, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SNIPERARROW)
local condition4 = createConditionObject(CONDITION_DRUNK)
setConditionParam(condition4, CONDITION_PARAM_TICKS, 10000)
setCombatCondition(combat4, condition4)

-- status de paralyze
local combat5 = createCombatObject()
setCombatParam(combat5, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat5, COMBAT_PARAM_EFFECT, CONST_ME_WATERSPLASH)
setCombatParam(combat5, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ONYXARROW)
local condition5 = createConditionObject(CONDITION_PARALYZE2)
setConditionParam(condition5, CONDITION_PARAM_TICKS, 3000)
setConditionFormula(condition5, -0.85, 0, -0.85, 0)
setCombatCondition(combat5, condition5)

function onCastSpell(cid, var)
	local random_attack = math.random(1,5)
	if random_attack == 1 then
		doCombat(cid, combat1, var)
	elseif random_attack == 2 then
		doCombat(cid, combat2, var)
	elseif random_attack == 3 then
		doCombat(cid, combat3, var)
	elseif random_attack == 4 then
		doCombat(cid, combat4, var)
	else
		doCombat(cid, combat5, var)
	end
	
	return TRUE
end
