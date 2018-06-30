local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_ENERGYAREA)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGY)
setAttackFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 0.7, 0.7, 5, 5)

local area = createCombatArea(AREA_SQUAREWAVE5, AREADIAGONAL_SQUAREWAVE5)
setCombatArea(combat, area)

function onCastSpell(cid, var)
if isMonster(cid) then
        doCreatureSay(cid, "exevo vis hur", TALKTYPE_MONSTER)
    end
	return doCombat(cid, combat, var)
end
