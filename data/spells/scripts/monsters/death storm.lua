local combatx = createCombatObject()
local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_DISTANCEEFFECT, 31)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 17)
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, 0, -300, 0, -380)

local combatfree = createCombatObject()
setCombatParam(combatfree, COMBAT_PARAM_EFFECT, 17)
setCombatParam(combatfree, COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
setCombatFormula(combatfree, COMBAT_FORMULA_LEVELMAGIC, 0, -300, 0, -380)

local areap = createCombatArea(AREA_CROSS5X5)
local areafree = createCombatArea(AREA_CROSS5X5)
setCombatArea(combatx, areap)
setCombatArea(combat1, areap)
setCombatArea(combat2, areap)
setCombatArea(combatfree, areafree)

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

local function onCastSpellfree(parameters)
    doCombat(parameters.cid, combatfree, parameters.var)
end

function onCastSpell(cid, var)
local parameters = { cid = cid, var = var}
addEvent(onCastSpell1, 0, parameters)
addEvent(onCastSpell2, 0, parameters)
return true
end