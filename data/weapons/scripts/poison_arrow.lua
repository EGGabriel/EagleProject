local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, 1)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_POISONDAMAGE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_POISONARROW)

function onGetFormulaValues(cid, level, skill, attack, factor)
    local min = -(getPlayerSkill(cid, 4) + (level/3))
	local max = -(getPlayerSkill(cid, 4) + (level/2))
	return min, max
end
setCombatCallback(combat, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local condition = createConditionObject(CONDITION_POISON)
setConditionParam(condition, CONDITION_PARAM_DELAYED, 1)
addDamageCondition(condition, 10, 800, -10)
setCombatCondition(combat, condition)

function onUseWeapon(cid, var)
	return doCombat(cid, combat, var)
end
