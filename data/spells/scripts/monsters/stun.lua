local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 31)
setAttackFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 5, 5, 0, 4.8)

local area = createCombatArea(AREA_SQUAREWAVE5, AREADIAGONAL_SQUAREWAVE5)
setCombatArea(combat, area)

function onCastSpell(cid, var)

local target = getCreatureTarget(cid)
doCreatureSetNoMove(target, true)
addEvent(doCreatureSetNoMove, 3000, target, false)

return doCombat(cid, combat, var)
end


