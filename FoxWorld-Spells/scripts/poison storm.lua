-- Variáveis da Special Skill
local storageSkill = 30023
-- Variáveis da Special Skill

local combat1 = createCombatObject(COMBAT_POISONDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_POISONDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, CONST_ME_POISONAREA)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -2.1, -180, -1.7, -180)

local condition1 = createConditionObject(CONDITION_POISON)
setConditionParam(condition1, CONDITION_PARAM_DELAYED, 1)
addDamageCondition(condition1, 10, 2000, -100)
setCombatCondition(combat1, condition1)

local combat2 = createCombatObject(COMBAT_POISONDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_POISONDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, CONST_ME_GREEN_RINGS)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -2.0, -170, -1.6, -170)

local condition2 = createConditionObject(CONDITION_POISON)
setConditionParam(condition2, CONDITION_PARAM_DELAYED, 1)
addDamageCondition(condition2, 10, 2000, -50)
setCombatCondition(combat2, condition2)

local arr = {
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{1, 1, 1, 1, 1, 3, 1, 1, 1, 1, 1},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0}
}

local area = createCombatArea(arr)

setCombatArea(combat1, area)
setCombatArea(combat2, area)

function onCastSpell(cid, var)
	-- if (getPlayerStorageValue(cid,storageSkill) == TRUE and isPremium(cid) == TRUE) or getPlayerVocation(cid) == GOD then -- testa se tem a skill de aprimoramento e é Premium, ou se é GOD
		doCombat(cid, combat1, var)
	-- else
		-- doCombat(cid, combat2, var)
	-- end
	return TRUE
end
