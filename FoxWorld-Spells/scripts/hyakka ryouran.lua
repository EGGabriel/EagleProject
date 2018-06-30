-- Variáveis da Special Skill
local storageSkill = 30024
local storageExhaust = 51002
local tempoExhaust = 10
local manaToUse = 600
-- Variáveis da Special Skill

local condition1 = createConditionObject(CONDITION_POISON)
setConditionParam(condition1, CONDITION_PARAM_DELAYED, 1)
addDamageCondition(condition1, 5, 2000, -500)

local condition2 = createConditionObject(CONDITION_PARALYZE)
setConditionParam(condition2, CONDITION_PARAM_TICKS, 20000)
setConditionFormula(condition2, -0.85, 0, -0.85, 0)

local condition3 = createConditionObject(CONDITION_POISON)
setConditionParam(condition3, CONDITION_PARAM_DELAYED, 1)
addDamageCondition(condition3, 5, 2000, -600)

local combat1 = createCombatObject(COMBAT_POISONDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_POISONDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, CONST_ME_PLANTATTACK)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -1.8, -150, -1.4, -150)
setCombatCondition(combat1, condition1)

local combat2 = createCombatObject()
setCombatCondition(combat2, condition2)

local combat3 = createCombatObject(COMBAT_POISONDAMAGE)
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_POISONDAMAGE)
setCombatParam(combat3, COMBAT_PARAM_EFFECT, CONST_ME_PLANTATTACK)
setCombatFormula(combat3, COMBAT_FORMULA_LEVELMAGIC, -1.8, -150, -1.4, -150)
setCombatCondition(combat3, condition3)

local combat4 = createCombatObject()
setCombatCondition(combat4, condition2)

local arr1 = {
{1}
}

local arr2 = {
{1},
{2}
}

local area1 = createCombatArea(arr1)
local area2 = createCombatArea(arr2)

setCombatArea(combat1, area1)
setCombatArea(combat2, area1)
setCombatArea(combat3, area2)
setCombatArea(combat4, area2)

local function onCastSpell2(param)
	if getTilePzInfo(getPlayerPosition(param.cid)) == TRUE or isPlayer(param.cid) == FALSE then -- não continua a magia se o jogador entrar em PZ ou morrer
		return FALSE
	end
	
	doCombat(param.cid, param.combat3, param.var)
	doCombat(param.cid, param.combat4, param.var)
end

function onCastSpell(cid, var)
	if isPlayerExhausted(cid, storageExhaust) ~= FALSE then -- testa se o jogador já pode usar a magia novamente (exhausted)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
		doPlayerSendCancel(cid, "Você precisa aguardar "..getPlayerExhaustion(cid, storageExhaust).." segundos para acumular espírito.")
		return FALSE
	end

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
	-- if getPlayerStorageValue(cid,storageSkill) == TRUE or getPlayerVocation(cid) == GOD then -- testa se tem a skill de aprimoramento ou se é GOD
		local param = {cid = cid, var = var, combat3 = combat3, combat4 = combat4}
		addEvent(onCastSpell2, 200, param)
	-- end
	return TRUE
end
