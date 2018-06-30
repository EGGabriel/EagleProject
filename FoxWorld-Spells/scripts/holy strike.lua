local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 39)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -0.4, -30, -0.5, 0)




local combatDist = createCombatObject()
setCombatParam(combatDist, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatParam(combatDist, COMBAT_PARAM_EFFECT, 39)
setCombatParam(combatDist, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_HOLY)
setCombatFormula(combatDist, COMBAT_FORMULA_LEVELMAGIC, -0.4, -30, -0.5, 0)



function onCastSpell(cid, var)
local target = getCreatureTarget(cid)
if(target ~= 0) then
return doCombat(cid, combatDist, numberToVariant(target))
end
return doCombat(cid, combat, var)
end
