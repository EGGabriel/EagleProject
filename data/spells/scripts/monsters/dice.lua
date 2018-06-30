local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHISYCALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 26)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -1.3, -30, -1.7, 0)


local arr = {
{1, 0, 0},
{0, 3, 0},
{0, 0, 1}
}

local area = createCombatArea(arr)
setCombatArea(combat, area)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end