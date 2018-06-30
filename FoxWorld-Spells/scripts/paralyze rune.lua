local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_RED)
local condition1 = createConditionObject(CONDITION_PARALYZE)
setConditionParam(condition1, CONDITION_PARAM_TICKS, 20000)
setConditionFormula(condition1, -0.85, 0, -0.85, 0)
setCombatCondition(combat1, condition1)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SMALLHOLY)

function onCastSpell(cid, var)
doCombat(cid, combat1, var)
doCombat(cid, combat2, var)
end