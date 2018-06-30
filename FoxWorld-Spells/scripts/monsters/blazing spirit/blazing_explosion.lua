local combat1 = createCombatObject() 
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 4)
setCombatParam(combat1, COMBAT_PARAM_AGGRESSIVE, true)

local combat2 = createCombatObject() 
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 4)
setCombatParam(combat2, COMBAT_PARAM_AGGRESSIVE, true)

local combat3 = createCombatObject() 
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combat3, COMBAT_PARAM_EFFECT, 4)
setCombatParam(combat3, COMBAT_PARAM_AGGRESSIVE, true)

local combat4 = createCombatObject() 
setCombatParam(combat4, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combat4, COMBAT_PARAM_EFFECT, 36)
setCombatParam(combat4, COMBAT_PARAM_AGGRESSIVE, true)

local combat5 = createCombatObject() 
setCombatParam(combat5, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combat5, COMBAT_PARAM_EFFECT, 36)
setCombatParam(combat5, COMBAT_PARAM_AGGRESSIVE, true)

local area1 = {
{0, 0, 0, 1, 0, 0, 0},
{0, 0, 1, 0, 1, 0, 0},
{0, 1, 0, 0, 0, 1, 0},
{1, 0, 0, 2, 0, 0, 1},
{0, 1, 0, 0, 0, 1, 0},
{0, 0, 1, 0, 1, 0, 0},
{0, 0, 0, 1, 0, 0, 0},
}

local area2 = {
{0, 0, 1, 0, 0},
{0, 1, 0, 1, 0},
{1, 0, 2, 0, 1},
{0, 1, 0, 1, 0},
{0, 0, 1, 0, 0},
}

local area3 = {
{0, 1, 0},
{1, 2, 1},
{0, 1, 0},
}

setCombatArea(combat1, createCombatArea(area1))
setCombatArea(combat2, createCombatArea(area2))
setCombatArea(combat3, createCombatArea(area3))
setCombatArea(combat4, createCombatArea(area3))
setCombatArea(combat5, createCombatArea(area2))

function onCastSpell(cid, var)
addEvent(doCombat, 0, cid, combat1, var)
addEvent(doCombat, 100, cid, combat2, var)
addEvent(doCombat, 200, cid, combat3, var)
addEvent(doCombat, 400, cid, combat4, var)
addEvent(doCombat, 600, cid, combat5, var)

return true

end