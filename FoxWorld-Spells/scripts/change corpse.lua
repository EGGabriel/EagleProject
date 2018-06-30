-- Variáveis da Special Skill
local storageSkill = 30039
local storageExhaust = 51012
local tempoExhaust = 3*60
local manaPercentToUse = 25 -- em porcentagem
-- / Variáreis da Special Skill

local function onCastSpell2(p)
	if isPlayer(p.cid) == FALSE or isPlayer(p.alvo) == FALSE then -- interrompe a magia se cid ou o alvo morrer
		return TRUE
	end
	
	alvoPos = getCreaturePosition(p.alvo)
	cidPos = getCreaturePosition(p.cid)
	
	if getDistanceBetween(cidPos, alvoPos) >= 9 or getCreatureTarget(p.cid) ~= p.alvo then -- se conseguir ficar a uma distância de 8 sqm do alvo, ou parar de atacar/trocar de alvo a magia é interrompida
		return TRUE
	end
	
	doSendMagicEffect(alvoPos, CONST_ME_PURPLEENERGY)
	doSendMagicEffect(cidPos, CONST_ME_PURPLEENERGY)
	doSendDistanceShoot(cidPos, alvoPos, CONST_ANI_ENERGY)
	doSendDistanceShoot(alvoPos, cidPos, CONST_ANI_ENERGY)
	
	if p.contador == 17 then
		if getPlayerStorageValue(p.alvo,30043) == TRUE then -- jogador que tem a aura do Gran Castle, não é atingido pelo Change Corpse
			doPlayerSendCancel(p.cid, "O alvo é protegido pela Gran Aura.")
			return TRUE
		end
	
		doTeleportThing(p.cid, alvoPos, 0)
		doTeleportThing(p.alvo, cidPos, 0)
		doSendMagicEffect(alvoPos, CONST_ME_TELEPORT)
		doSendMagicEffect(cidPos, CONST_ME_TELEPORT)
	else
		addEvent(onCastSpell2, 100, {cid = p.cid, alvo = p.alvo, contador = p.contador+1})
	end
end

function onCastSpell(cid, var)
	-- if getPlayerStorageValue(cid,storageSkill) ~= TRUE and getPlayerVocation(cid) ~= GOD then -- testa se tem a skill ou se é o GOD
		setPlayerStorageValue(cid, storageSkill, FALSE)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
		doPlayerSendCancel(cid, "Você não possui esta habilidade especial.")
		-- return FALSE
	-- end
	
	if isPlayerExhausted(cid, storageExhaust) ~= FALSE then -- testa se o jogador já pode usar a magia novamente (exhausted)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
		doPlayerSendCancel(cid, "Você precisa aguardar "..getPlayerExhaustion(cid, storageExhaust).." segundos para acumular espírito.")
		return FALSE
	end
	
	alvo = 	getCreatureTarget(cid)
	if isPlayer(alvo) == FALSE then -- testa se o alvo é um player
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
		doPlayerSendCancel(cid, "Somente jogadores podem ser alvo.")
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

	addEvent(onCastSpell2, 0, {cid = cid, alvo = alvo, contador = 0})
	return TRUE
end
