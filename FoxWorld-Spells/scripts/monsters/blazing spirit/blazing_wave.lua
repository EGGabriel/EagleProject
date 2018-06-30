local combat1 = createCombatObject() 
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 39)
setCombatParam(combat1, COMBAT_PARAM_AGGRESSIVE, true)

local combat2 = createCombatObject() 
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 6)
setCombatParam(combat2, COMBAT_PARAM_AGGRESSIVE, true)

local area1 = {
{1},
{1},
{1},
{1},
{1},
{1},
{1},
{3},
}

setCombatArea(combat1, createCombatArea(area1))
setCombatArea(combat2, createCombatArea(area1))

function onCastSpell(cid, var)
addEvent(doCombat, 0, cid, combat1, var)
addEvent(doCombat, 0, cid, combat2, var)

return true

end