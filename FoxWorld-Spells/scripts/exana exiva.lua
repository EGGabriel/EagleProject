-- Vari�veis da Special Skill
local storageSkill = 30038
local storageExhaust = 51011
local tempoExhaust = 3*60 -- tamb�m � a dura��o
-- Vari�veis da Special Skill

function onCastSpell(cid, var)
	if (getPlayerStorageValue(cid,storageSkill) < 1 or getPlayerStorageValue(cid,storageSkill) > 3) and getPlayerVocation(cid) ~= GOD then -- testa se tem alguma carga da skill ou se � o GOD
		setPlayerStorageValue(cid, storageSkill, FALSE)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
		doPlayerSendCancel(cid, "Voc� n�o possui esta habilidade especial.")
		return FALSE
	end

	if isPlayerExhausted(cid, storageExhaust) ~= FALSE then -- testa se o jogador j� pode usar a magia novamente (exhausted)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
		doPlayerSendCancel(cid, "Voc� ainda tem "..getPlayerExhaustion(cid, storageExhaust).." segundos de camuflagem.") -- nesta skill, o tempo de ehxaust � o mesmo tempo que ela dura
		return FALSE
	end

	if getPlayerVocation(cid) ~= GOD then -- se for GOD n�o perde carga da skill
		setPlayerStorageValue(cid, storageSkill, getPlayerStorageValue(cid,storageSkill)-1)
	end
	
	setPlayerExhaust(cid, storageExhaust, tempoExhaust) -- nesta skill, o tempo de exhaust � o mesmo tempo que ela dura
	addEvent(antiExiva, 0, cid) -- esta fun��o est� na biblioteca FoxWorld Auras
	return TRUE
end
