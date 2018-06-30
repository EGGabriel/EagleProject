-- Variáveis da Special Skill
local storageSkill = 30021
local storageExhaust = 51001
local tempoExhaust = 10
local manaToUse = 2400
-- Variáveis da Special Skill

local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, CONST_ME_GIANTICE)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -4.5, -400, -4.0, -400)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, CONST_ME_ICEATTACK)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -4.5, -400, -4.0, -400)

local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
setCombatParam(combat3, COMBAT_PARAM_EFFECT, CONST_ME_GIANTICE)
setCombatFormula(combat3, COMBAT_FORMULA_LEVELMAGIC, -4.5, -400, -4.0, -400)

local arr1 = {
{2},
{1}
}

local arr2 = {
{1},
{1},
{1},
{1},
{1},
{3}
}

local arr3 = {
{1},
{1},
{1},
{1},
{1},
{1},
{1},
{3}
}

local area1 = createCombatArea(arr1)
local area2 = createCombatArea(arr2)
local area3 = createCombatArea(arr3)

setCombatArea(combat1, area1)
setCombatArea(combat2, area2)
setCombatArea(combat3, area3)

local function onCastSpell2(param)
	if getTilePzInfo(getPlayerPosition(param.cid)) == TRUE or isPlayer(param.cid) == FALSE then -- não continua a magia se o jogador entrar em PZ ou morrer
		return FALSE
	end
	
	if param.skill == TRUE then -- se no teste anterior ele tinha a skill de upgrade, a magia é melhor
		doCombat(param.cid, param.combat3, param.var)
	else
		doCombat(param.cid, param.combat2, param.var)
	end
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
	-- if getPlayerStorageValue(cid,storageSkill) == TRUE or getPlayerVocation(cid) == GOD then -- testa se tem a skill de aprimoramento ou se é GOD
		local param = {cid = cid, var = var, combat2 = combat2, combat3 = combat3, skill = TRUE}
		addEvent(onCastSpell2, 500, param)
	-- else
		-- local param = {cid = cid, var = var, combat2 = combat2, skill = FALSE}
		-- addEvent(onCastSpell2, 800, param)
	-- end
	return TRUE
end
