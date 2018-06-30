local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SMALLHOLY)

local function doTargetSleep(param)
	if param.contador <= 10 then -- o teste é feito 1x a cada 100 milissegundos
		if isCreature(param.alvo) == FALSE then -- interrompe a magia se o alvo morrer
			return FALSE
		end
		doSendMagicEffect(param.alvoPos, CONST_ME_SLEEP)
		doTeleportThing(param.alvo, param.alvoPos, 1) -- teleporta o jogador para o lugar que ele estava quando levou a magia hypnosis
		addEvent(doTargetSleep, 100, {alvo = param.alvo, alvoPos = param.alvoPos, contador = param.contador+1})
	end
end

function onCastSpell(cid, var)
	local alvo = getCreatureTarget(cid)
	local alvoPos = getCreaturePosition(alvo)
	addEvent(doTargetSleep, 0, {alvo = alvo, alvoPos = alvoPos, contador = 0})
	doCombat(cid, combat, var)
	return TRUE
end
