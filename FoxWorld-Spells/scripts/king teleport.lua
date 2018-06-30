-- Vari�veis da Special Skill
local storageSkill = 30037
local storageExhaust = 51010
local tempoExhaust = 10
-- Vari�veis da Special Skill

local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_EXPLOSIONHIT)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_FIRE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -0, -5000, -0, -7000)

function onCastSpell(cid, var)
	if (getPlayerStorageValue(cid,storageSkill) < 1 or getPlayerStorageValue(cid,storageSkill) > 3) and getPlayerVocation(cid) ~= GOD then -- testa se tem alguma carga da skill ou se � o GOD
		setPlayerStorageValue(cid, storageSkill, FALSE)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
		doPlayerSendCancel(cid, "Voc� n�o possui esta habilidade especial.")
		return FALSE
	end

	if isPlayerExhausted(cid, storageExhaust) ~= FALSE then -- testa se o jogador j� pode usar a magia novamente (exhausted)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
		doPlayerSendCancel(cid, "Voc� precisa aguardar "..getPlayerExhaustion(cid, storageExhaust).." segundos para acumular esp�rito.")
		return FALSE
	end

	alvo = 	getCreatureTarget(cid)
	if isPlayer(alvo) == FALSE then -- testa se o alvo � um player
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
		doPlayerSendCancel(cid, "Somente jogadores podem ser alvo.")
		return FALSE
	end
	
	if getPlayerStorageValue(alvo,30043) == TRUE then -- jogador que tem a aura do Gran Castle, n�o � atingido pelo King Teleport
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
		doPlayerSendCancel(cid, "O alvo � protegido pela Gran Aura.")
		return FALSE
	end
	
	alvoPos = getCreaturePosition(alvo)
	cidPos = getCreaturePosition(cid)		
	doSendMagicEffect(alvoPos, CONST_ME_FIREAREA)
	doSendMagicEffect(alvoPos, CONST_ME_HITBYFIRE)
	doSendDistanceShoot(cidPos, alvoPos, CONST_ANI_WHIRLWINDSWORD)
	doTeleportThing(cid, alvoPos, FALSE)	
	doCombat(cid, combat, var)
			
	if getPlayerVocation(cid) ~= GOD then -- se for GOD n�o pega exhaust e n�o perde carga da skill
		setPlayerExhaust(cid, storageExhaust, tempoExhaust)
		setPlayerStorageValue(cid, storageSkill, getPlayerStorageValue(cid,storageSkill)-1)
	end
	return TRUE
end
