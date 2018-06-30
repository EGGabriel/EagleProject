local combatpremium = createCombatObject()
setCombatParam(combatpremium, COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE)
setCombatParam(combatpremium, COMBAT_PARAM_EFFECT, CONST_ME_PLANTATTACK)
setAttackFormula(combatpremium, COMBAT_FORMULA_LEVELMAGIC, 0.14, 0.14, 7, 7)

local combatfree = createCombatObject()
setCombatParam(combatfree, COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE)
setCombatParam(combatfree, COMBAT_PARAM_EFFECT, 45)
setAttackFormula(combatfree, COMBAT_FORMULA_LEVELMAGIC, 0.2, 0.2, 7, 7)

local areapremium = createCombatArea(AREA_CROSS5X5)
setCombatArea(combatpremium, areapremium)

local areafree = createCombatArea(AREA_CROSS4X4)
setCombatArea(combatfree, areafree)

local function onCastSpellpremium(parameters)
doCombat(parameters.cid, parameters.combatpremium, parameters.var)
end

local function onCastSpellfree(parameters)
doCombat(parameters.cid, parameters.combatfree, parameters.var)
end

function onCastSpell(cid, var)
local parameters = { cid = cid, var = var, combatpremium = combatpremium, combatfree = combatfree }

if (getPlayerStorageValue(cid,10033) == 1) then
return doCombat(cid, combatpremium, var)
else
return doCombat(cid, combatfree, var)
end

end

