local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, true)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ETHEREALSPEAR)

function onGetFormulaValues(cid, level, skill, attack, factor)
    local min = -((getPlayerSkill(cid, 4)*2) + level)
	local max = -((getPlayerSkill(cid, 4)*3) + level)
	return min, max
end
setCombatCallback(combat, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

function onCastSpell(cid, var)
if isMonster(cid) then
        doCreatureSay(cid, "exori con", TALKTYPE_MONSTER)
    end
	return doCombat(cid, combat, var)
end
