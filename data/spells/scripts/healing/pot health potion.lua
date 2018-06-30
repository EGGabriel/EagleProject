local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_HEALING)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
setCombatParam(combat1, COMBAT_PARAM_AGGRESSIVE, false)
setCombatParam(combat1, COMBAT_PARAM_TARGETCASTERORTOPMOST, true)

function onGetFormulaValues(cid, level, maglevel)
        local min = (50)
        local max = (125)
        return min, max
end

setCombatCallback(combat1, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(cid, var)
    return doCombat(cid, combat1, var)
end