local combat = createCombatObject(COMBAT_POISONDAMAGE)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_POISONDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_CARNIPHILA)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 0, -90, -350, 0)

local condition = createConditionObject(CONDITION_POISON)
setConditionParam(condition, CONDITION_PARAM_DELAYED, 1)
addDamageCondition(condition, 10, 2000, -10)
setCombatCondition(combat, condition)

	local arr = {
	{1, 1, 1, 1, 1, 1 ,1},
	{1, 1, 1, 1, 1, 1 ,1},
	{1, 1, 1, 1, 1, 1 ,1},
	{0, 1, 1, 1, 1, 1, 0},
	{0, 1, 1, 1, 1, 1, 0},
	{0, 0, 1, 1, 1, 0, 0},
	{0, 0, 0, 1, 0, 0, 0},
	{0, 0, 0, 3, 0, 0, 0},
	}

local area = createCombatArea(arr)

setCombatArea(combat, area)

function onCastSpell(cid, var)
doCombat(cid, combat, var)
end