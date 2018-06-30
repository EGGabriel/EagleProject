local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 5)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_EXPLOSION)
setAttackFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 5, 5, 0, 4.8)

local area = createCombatArea(AREA_CIRCLE2X2)
setCombatArea(combat, area)

function onCastSpell(cid, var)

local target = getCreatureTarget(cid)
doCreatureSetNoMove(target, true)
addEvent(doCreatureSetNoMove, 5000, target, false)

return doCombat(cid, combat, var)
end


