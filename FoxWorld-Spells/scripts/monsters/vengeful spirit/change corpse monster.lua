local function changeCorpse(p)
	
	if isCreature(p.cid) == FALSE or isCreature(p.alvo) == FALSE then -- interrompe a magia se cid ou o alvo morrer
		return TRUE
	end
	
	alvoPos = getCreaturePosition(p.alvo)
	cidPos = getCreaturePosition(p.cid)
	
	if getDistanceBetween(cidPos, alvoPos) >= 10 then -- se conseguir ficar a uma distância de 10 sqm ou mais do alvo, a magia é interrompida
		return TRUE
	end
	
	doSendMagicEffect(alvoPos, CONST_ME_PURPLEENERGY)
	doSendMagicEffect(cidPos, CONST_ME_PURPLEENERGY)
	doSendDistanceShoot(cidPos, alvoPos, CONST_ANI_ENERGY)
	doSendDistanceShoot(alvoPos, cidPos, CONST_ANI_ENERGY)
	
	if p.contador == 17 then -- após fazer o efeito de troca 17 vezes, ele troca o jogador e alvo de lugar
		if getPlayerStorageValue(p.alvo,30039) == TRUE then -- jogador que tem a aura do Gran Castle, não é atingido pelo Change Corpse
			return TRUE
		end

		doTeleportThing(p.cid, alvoPos, 0)
		doTeleportThing(p.alvo, cidPos, 0)
		doSendMagicEffect(alvoPos, CONST_ME_TELEPORT)
		doSendMagicEffect(cidPos, CONST_ME_TELEPORT)
	else
		addEvent(changeCorpse, 100, {cid = p.cid, alvo = p.alvo, contador = p.contador+1})
	end
end

function onCastSpell(cid, var)
	addEvent(changeCorpse, 0, {cid = cid, alvo = getCreatureTarget(cid), contador = 0})
end
