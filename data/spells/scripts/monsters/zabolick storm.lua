local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 43)

local condition1 = createConditionObject(CONDITION_PARALYZE)
setConditionParam(condition1, CONDITION_PARAM_TICKS, 30000)
setConditionFormula(condition1, -0.9, 0, -0.9, 0)
setCombatCondition(combat1, condition1)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 52)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -1, 0, -1, -10, 5, 5, 1.2, 2, -20, -40)

local condition2 = createConditionObject(CONDITION_FREEZING)
setConditionParam(condition2, CONDITION_PARAM_DELAYED, 1)
addDamageCondition(condition2, 5, 2000, -300)
setCombatCondition(combat2, condition2)

local area = createCombatArea(AREA_SQUARE7X7)

setCombatArea(combat1, area)
setCombatArea(combat2, area)

function onCastSpell(cid, var)
addEvent(doCombat, 0, cid, combat2, var)
addEvent(doCombat, 0, cid, combat1, var)
  return true
end