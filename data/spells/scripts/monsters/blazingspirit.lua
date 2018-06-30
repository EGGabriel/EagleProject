local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, CONST_ME_EXPLOSIONAREA)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 36)

local arr1 = {
{0, 0, 0, 1, 0, 0, 0},
{0, 0, 1, 1, 1, 0, 0},
{0, 1, 1, 1, 1, 1, 0},
{1, 1, 1, 3, 1, 1, 1},
{0, 1, 1, 1, 1, 1, 0},
{0, 0, 1, 1, 1, 0, 0},
{0, 0, 0, 1, 0, 0, 0},
}

local arr2 = {
{0, 0, 0, 0, 0, 0, 0},
{0, 0, 1, 0, 0, 0, 0},
{0, 1, 1, 1, 0, 0, 0},
{1, 1, 3, 1, 1, 0, 0},
{0, 1, 1, 1, 0, 0, 0},
{0, 0, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0},
}

local area1 = createCombatArea(arr1)
setCombatArea(combat1, area1)

local area2 = createCombatArea(arr2)
setCombatArea(combat2, area2)

function onCastSpell(cid, var)
if (isCreature(cid) == FALSE) then
return false
end
doCombat(cid, combat1, var)
doCombat(cid, combat2, var)
end