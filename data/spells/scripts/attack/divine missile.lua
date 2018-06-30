local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_HOLYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SMALLHOLY)

function onGetFormulaValues(cid, level, skill, attack, factor)
    local min = -((getPlayerSkill(cid, 4)*2) + level)
	local max = -((getPlayerSkill(cid, 4)*3) + level)
	return min, max
end
setCombatCallback(combat, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

function onCastSpell(cid, var)
if isMonster(cid) then
        doCreatureSay(cid, "exori san", TALKTYPE_MONSTER)
    end
	return doCombat(cid, combat, var)
end
