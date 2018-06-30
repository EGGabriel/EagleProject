-- Variáveis da Special Skill
local storageSkill = 30038
local storageExhaust = 51011
local tempoExhaust = 3*60 -- também é a duração
-- Variáveis da Special Skill

function onCastSpell(cid, var)
	if (getPlayerStorageValue(cid,storageSkill) < 1 or getPlayerStorageValue(cid,storageSkill) > 3) and getPlayerVocation(cid) ~= GOD then -- testa se tem alguma carga da skill ou se é o GOD
		setPlayerStorageValue(cid, storageSkill, FALSE)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
		doPlayerSendCancel(cid, "Você não possui esta habilidade especial.")
		return FALSE
	end

	if isPlayerExhausted(cid, storageExhaust) ~= FALSE then -- testa se o jogador já pode usar a magia novamente (exhausted)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
		doPlayerSendCancel(cid, "Você ainda tem "..getPlayerExhaustion(cid, storageExhaust).." segundos de camuflagem.") -- nesta skill, o tempo de ehxaust é o mesmo tempo que ela dura
		return FALSE
	end

	if getPlayerVocation(cid) ~= GOD then -- se for GOD não perde carga da skill
		setPlayerStorageValue(cid, storageSkill, getPlayerStorageValue(cid,storageSkill)-1)
	end
	
	setPlayerExhaust(cid, storageExhaust, tempoExhaust) -- nesta skill, o tempo de exhaust é o mesmo tempo que ela dura
	addEvent(antiExiva, 0, cid) -- esta função está na biblioteca FoxWorld Auras
	return TRUE
end
