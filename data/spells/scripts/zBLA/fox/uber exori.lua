local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, CONST_ME_CRAPS)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -3.9, -200, -4.2, -200)



local combat2 = createCombatObject()

setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)

setCombatParam(combat2, COMBAT_PARAM_EFFECT, 44)

setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -3.0, -200, -3.2, -250)

local area1 = createCombatArea(UBER_P)

setCombatArea(combat1, area1)



local area2 = createCombatArea(UBER_F)

setCombatArea(combat2, area2)



local function onCastSpell1(parameters)

doCombat(parameters.cid, parameters.combat1, parameters.var)

end



local function onCastSpell2(parameters)

doCombat(parameters.cid, parameters.combat2, parameters.var)

end



function onCastSpell(cid, var)

local parameters = { cid = cid, var = var, combat1 = combat1, combat2 = combat2 }


if getPlayerStorageValue(cid,10005) >= 1 then

return doCombat(cid, combat1, var)


else


return doCombat(cid, combat2, var)


end


end