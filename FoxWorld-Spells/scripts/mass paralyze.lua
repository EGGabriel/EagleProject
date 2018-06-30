local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 32)
local condition1 = createConditionObject(CONDITION_PARALYZE)
setConditionParam(condition1, CONDITION_PARAM_TICKS, 20000)
setConditionFormula(condition1, -0.85, 0, -0.85, 0)
setCombatCondition(combat1, condition1)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)

local arr1 = {
	{0, 0, 0, 0, 0, 0, 0},
	{0, 0, 1, 1, 1, 0, 0},
	{0, 1, 1, 1, 1, 1, 0},
	{0, 1, 1, 3, 1, 1, 0},
	{0, 1, 1, 1, 1, 1, 0},
	{0, 0, 1, 1, 1, 0, 0},
	{0, 0, 0, 0, 0, 0, 0}
}

local area1 = createCombatArea(arr1)

setCombatArea(combat1, area1)
setCombatArea(combat2, area1)

function onCastSpell(cid, var)
	doCombat(cid, combat1, var)
	doCombat(cid, combat2, var)
end
