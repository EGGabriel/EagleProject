local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_MANADRAIN)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
setCombatParam(combat1, COMBAT_PARAM_AGGRESSIVE, false)
setCombatParam(combat1, COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
setCombatParam(combat1, COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)  --[[Fórmula dos Sorcerers]]

function onGetFormulaValues(cid, level, maglevel)
        local min = (150)
        local max = (220)
        return min, max
end

setCombatCallback(combat1, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(cid, var)
    return doCombat(cid, combat1, var)
end