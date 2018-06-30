local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 17)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -1.3, -30, -1.7, 0)

local arr = {
{0, 0, 0 ,0 ,0},
{1, 1, 1 ,1 ,1},
{0, 1, 1 ,1 ,0},
{0, 1, 1 ,1 ,0},
{0, 0, 3 ,0 ,0},
}

local arrDiag = {
{1, 1, 1, 0, 0},
{1, 1, 0, 0, 0},
{1, 0, 1, 0, 0},
{0, 0, 0, 1, 0},
{0, 0, 0, 0, 3},
}

local area = createCombatArea(arr, arrDiag)

setCombatArea(combat, area)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end
