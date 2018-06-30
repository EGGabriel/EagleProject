local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HEALING)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, 0)  

function onGetFormulaValues(cid, level, maglevel)
        local min = (150+(level/10))
        local max = (200+(level/10))
        return min, max
end

setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(cid, var)
doSendAnimatedText(getPlayerPosition(cid), "Aaaaah...", TEXTCOLOR_BLUE)
return true	
end