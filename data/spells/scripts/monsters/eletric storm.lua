local combatx = createCombatObject()
local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_DISTANCEEFFECT, 31)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -9999999, -5000, -9999999, -5000)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -9999999, -5000, -9999999, -5000)

local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_COSMICDAMAGE)
setCombatFormula(combat3, COMBAT_FORMULA_LEVELMAGIC, -9999999, -5000, -9999999, -5000)

local arr1 = {
{1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1},
{0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0},
{0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0},
{0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0},
{0, 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{1, 1, 1, 1, 1, 0, 3, 0, 1, 1, 1, 1, 1},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0},
{0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0},
{0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0},
{0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0},
{1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1}}

local arr2 = {
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 3, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}}

local area1 = createCombatArea(arr1)
local area2 = createCombatArea(arr2)
local area3 = createCombatArea(arr2)
local areax = createCombatArea(arr1)
setCombatArea(combatx, area1)
setCombatArea(combat1, area1)
setCombatArea(combat2, area2)
setCombatArea(combat3, area3)

function onTargetTile(cid, pos)
	doCombat(cid,combat1,positionToVariant(pos))
end

setCombatCallback(combatx, CALLBACK_PARAM_TARGETTILE, "onTargetTile")

local function onCastSpell1(parameters)
    doCombat(parameters.cid, combatx, parameters.var)
end

local function onCastSpell2(parameters)
    doCombat(parameters.cid, combat2, parameters.var)
end

local function onCastSpell3(parameters)
    doCombat(parameters.cid, combat3, parameters.var)
end


function onCastSpell(cid, var)
local parameters = { cid = cid, var = var}
addEvent(onCastSpell3, 0, parameters)
addEvent(onCastSpell2, 100, parameters)
addEvent(onCastSpell1, 200, parameters)
end