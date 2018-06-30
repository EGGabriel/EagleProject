local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_POISONDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_POISONAREA)
setAttackFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 0.5, 0.5, 5, 5)

local condition = createConditionObject(CONDITION_PARALYZE)
setConditionParam(condition, CONDITION_PARAM_TICKS, 3000)
setConditionParam(condition, CONDITION_PARAM_SPEED, -400)
setConditionFormula(condition, 0, 0, 0, 0)
setCombatCondition(combat, condition)

local arr = {
	{1, 0, 1, 1, 1},
	{1, 1, 1, 1, 0},
	{1, 1, 3, 1, 1},
	{0, 1, 1, 1, 1},
	{1, 1, 1, 0, 1},
}

local area = createCombatArea(arr)
setCombatArea(combat, area)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end
