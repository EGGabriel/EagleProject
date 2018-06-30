local config = {
	seconds = 0,
	storage = 111310,
	msg = "Você precisa aguardar %d segundos para acumular o espírito.",
  	shootId = 4, --Efeito dos tiros
	effectId = 47,--Efeito
	delayBeforeSwitchPositions = 2, -- Intervalo de tempo entre usar spell e trocar de posição (em segundos)--> TEM QUE SER NÚMERO INTEIRO
        mana = 0,
        semMana = "Você não tem mana suficiente."
}

local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, true)

function onCastSpell(cid, var)

	local function switchPositions(cid, targ, cidPos, targPos)
		if isPlayer(cid) and isPlayer(targ) then
			doTeleportThing(cid, targPos)
			doTeleportThing(targ, cidPos)	
			doSendMagicEffect(cidPos, 10)
			doSendMagicEffect(targPos, 10)
		end
	end

	local function effects(fromPos, toPos, shoot, effect)
		doSendDistanceShoot(fromPos, toPos, shoot)
		doSendDistanceShoot(toPos, fromPos, shoot)
		doSendMagicEffect(fromPos, effect)
		doSendMagicEffect(toPos, effect)
	end
	
	if getPlayerStorageValue(cid, config.storage) == -1 then
		setPlayerStorageValue(cid, config.storage, os.time()-config.seconds)
	end

	if config.seconds-(os.time()-getPlayerStorageValue(cid, config.storage)) > 0 then
		doPlayerSendCancel(cid, string.format(config.msg, config.seconds-(os.time()-getPlayerStorageValue(cid, config.storage))))
		return true
	end

        setPlayerStorageValue(cid, config.storage, os.time())

        if getPlayerMana(cid) >= config.mana then
        config.mana = getCreatureMaxMana(cid)*0.00
        doPlayerAddMana(cid, -config.mana)
        else
		doPlayerSendCancel(cid, config.semMana)
		return true
        end

	local target = getCreatureTarget(cid)
	local playerPos = getCreaturePosition(cid)
	local targetPos = getCreaturePosition(target)
	
	if isPlayer(cid) and isPlayer(target) then
		addEvent(switchPositions, config.delayBeforeSwitchPositions*1000, cid, target, playerPos, targetPos)
		for i=0,config.delayBeforeSwitchPositions*1000,250 do
			addEvent(effects, i, playerPos, targetPos, config.shootId, config.effectId)
		end
		return true
	else
		doPlayerSendCancel(cid, "Only players are affected by this spell.")
		return true
	end
end