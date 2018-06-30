-- Variáveis da Special Skill
local storageExhaust = 51003
local tempoExhaust = 8
local manaPercentToUse = 40 -- em porcentagem
-- Variáveis da Special Skill

local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_AGGRESSIVE, 0)
setCombatParam(combat1, COMBAT_PARAM_DISPEL, CONDITION_HASTE)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_EFFECT, CONST_ME_STUN)
setCombatParam(combat2, COMBAT_PARAM_AGGRESSIVE, 0)

local condition2 = createConditionObject(CONDITION_HASTE)
setConditionParam(condition2, CONDITION_PARAM_TICKS, 2500)
setConditionFormula(condition2, 15.0, 0, 15.0, 0)
setCombatCondition(combat2, condition2)

function onCastSpell(cid, var)
	if isPlayerExhausted(cid, storageExhaust) ~= FALSE then -- testa se o jogador já pode usar a magia novamente (exhausted)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
		doPlayerSendCancel(cid, "Você precisa aguardar "..getPlayerExhaustion(cid, storageExhaust).." segundos para acumular espírito.")
		return FALSE
	end

	local manaToUse = getPlayerMaxMana(cid)*(manaPercentToUse/100)
	if getPlayerMana(cid) < manaToUse and getPlayerVocation(cid) ~= GOD then -- testa se tem mana pra usar a skill ou se é GOD
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
		doPlayerSendCancel(cid, "You do not have enough mana.")
		return FALSE
	end
	doPlayerAddMana(cid,-manaToUse,FALSE)
	doPlayerAddManaSpent(cid, manaToUse)

	if getPlayerVocation(cid) ~= GOD then -- seta o exhaust se não for GOD
		setPlayerExhaust(cid, storageExhaust, tempoExhaust)
	end

	doCombat(cid, combat1, var)
	doCombat(cid, combat2, var)
	return TRUE
end
