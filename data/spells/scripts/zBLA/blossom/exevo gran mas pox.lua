local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_POISONDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 20)
setAttackFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, 0.16, 0.16, 7, 7)
local condition1 = createConditionObject(CONDITION_POISON)
setConditionParam(condition1, CONDITION_PARAM_DELAYED, 1)
addDamageCondition(condition1, 10, 2000, -100)
setCombatCondition(combat1, condition1)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_POISONDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 8)
setAttackFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, 0.2, 0.2, 7, 7)
local condition2 = createConditionObject(CONDITION_POISON)
setConditionParam(condition2, CONDITION_PARAM_DELAYED, 1)
addDamageCondition(condition2, 10, 2000, -50)
setCombatCondition(combat2, condition2)

local area1 = createCombatArea(AREA_CROSS5X5)
setCombatArea(combat1, area1)

local area2 = createCombatArea(AREA_CROSS4X4)
setCombatArea(combat2, area2)

local function onCastSpell1(parameters)
doCombat(parameters.cid, parameters.combat1, parameters.var)
end

local function onCastSpell2(parameters)
doCombat(parameters.cid, parameters.combat2, parameters.var)
end

function onCastSpell(cid, var)
local parameters = { cid = cid, var = var, combat1 = combat1, combat2 = combat2}

if getPlayerStorageValue(cid,10033) >= 1 then
   return doCombat(cid, combat1, var)
else
   return doCombat(cid, combat2, var)
end

end
