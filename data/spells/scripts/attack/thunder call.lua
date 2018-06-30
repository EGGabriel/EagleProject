local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_AIRDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, CONST_ME_SOUND_WHITE)
setAttackFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, 0.16, 0.16, 7, 7)
local condition1 = createConditionObject(CONDITION_BLOWN)
setConditionParam(condition1, CONDITION_PARAM_DELAYED, 1)
addDamageCondition(condition1, 7, 500, -66)
setCombatCondition(combat1, condition1)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_EFFECT, CONST_ME_YELLOWENERGY)

area1 = {
	{0, 0, 1, 1, 1, 0, 0},
	{0, 1, 1, 1, 1, 1, 0},
	{1, 1, 1, 1, 1, 1, 1},
	{1, 1, 1, 3, 1, 1, 1},
	{1, 1, 1, 1, 1, 1, 1},
	{0, 1, 1, 1, 1, 1, 0},
	{0, 0, 1, 1, 1, 0, 0}}
	
area2 = {
	{0, 1, 1, 1, 1, 1, 0},
	{0, 1, 1, 0, 1, 1, 0},
	{0, 1, 0, 3, 0, 1, 0},
	{0, 1, 1, 0, 1, 1, 0},
	{0, 1, 1, 1, 1, 1, 0}}

local area1 = createCombatArea(area1)
local area2 = createCombatArea(area2)

setCombatArea(combat1, area1)
setCombatArea(combat2, area2)

local function onCastSpell1(parameters)
doCombat(parameters.cid, parameters.combat1, parameters.var)
end

local function onCastSpell2(parameters)
doCombat(parameters.cid, parameters.combat2, parameters.var)
end

function onCastSpell(cid, var)
local parameters = { cid = cid, var = var, combat1 = combat1, combat2 = combat2 }
addEvent(onCastSpell1, 0, parameters)
addEvent(onCastSpell2, 100, parameters)
return true
end