-- Variáveis da Special Skill
local storageSkill = 30020
-- Variáveis da Special Skill

local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, CONST_ME_FIREATTACK)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -3.1, -260, -2.6, -260)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, CONST_ME_EXPLOSIONHIT)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -3.0, -250, -2.5, -250)

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
