-- Variáveis da Special Skill
local storageSkill = 30027
-- Variáveis da Special Skill

local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, CONST_ME_CRAPS)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -3.4, 0, -3.9, 0)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, CONST_ME_STONES)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -3.0, 0, -3.5, 0)

local arr1 = {
{0, 0, 0, 1, 0, 0, 0},
{0, 1, 0, 1, 0, 1, 0},
{0, 0, 1, 1, 1, 0, 0},
{1, 1, 1, 3, 1, 1, 1},
{0, 0, 1, 1, 1, 0, 0},
{0, 1, 0, 1, 0, 1, 0},
{0, 0, 0, 1, 0, 0, 0}
}

local arr2 = {
{0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 1, 0, 0, 0},
{0, 0, 1, 1, 1, 0, 0},
{0, 1, 1, 3, 1, 1, 0},
{0, 0, 1, 1, 1, 0, 0},
{0, 0, 0, 1, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0}
}

local area1 = createCombatArea(arr1)
local area2 = createCombatArea(arr2)

setCombatArea(combat1, area1)
setCombatArea(combat2, area2)

function onCastSpell(cid, var)
	-- if (getPlayerStorageValue(cid,storageSkill) == TRUE and isPremium(cid) == TRUE) or getPlayerVocation(cid) == GOD then -- testa se tem a skill de aprimoramento e é Premium, ou se é GOD
		doCombat(cid, combat1, var)
	-- else
		-- doCombat(cid, combat2, var)
	-- end
	return TRUE
end
