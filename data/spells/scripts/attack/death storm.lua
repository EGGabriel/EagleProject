local combatx = createCombatObject()
local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_DISTANCEEFFECT, 31)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 17)
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
setAttackFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, 0.12, 0.12, 7, 7)

local combatfree = createCombatObject()
setCombatParam(combatfree, COMBAT_PARAM_EFFECT, 17)
setCombatParam(combatfree, COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
setAttackFormula(combatfree, COMBAT_FORMULA_LEVELMAGIC, 0.16, 0.16, 7, 7)

local areap = createCombatArea(AREA_CROSS5X5)
local areafree = createCombatArea(AREA_CROSS4X4)
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
if getPlayerStorageValue(cid, 10033) == 1 then
addEvent(onCastSpell1, 0, parameters)
addEvent(onCastSpell2, 0, parameters)
else
addEvent(onCastSpellfree, 0, parameters)
end
return true
end