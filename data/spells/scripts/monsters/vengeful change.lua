local config = {
  	shootId = 4, --Efeito dos tiros
	effectId = 47 --Efeito
}

local function startSpellSystem(cid, time, beforeTarget)
	if (isCreature(cid)) and (getCreatureTarget(cid) > 0) then
	local nowTarget = getCreatureTarget(cid)
		if nowTarget == beforeTarget then
			local nowTargetPos = getCreaturePosition(nowTarget)
			local cidPos = getCreaturePosition(cid)
			if time < 8 then
				doSendDistanceShoot(cidPos, nowTargetPos, config.shootId)
				doSendDistanceShoot(nowTargetPos, cidPos, config.shootId)
				doSendMagicEffect(cidPos, config.effectId)
				doSendMagicEffect(nowTargetPos, config.effectId)
				addEvent(startSpellSystem, 250, cid, time+1, nowTarget)
			elseif time == 8 then
				doTeleportThing(cid, nowTargetPos)
				doTeleportThing(nowTarget, cidPos)	
				doSendMagicEffect(cidPos, 10)
				doSendMagicEffect(nowTargetPos, 10)
			end
		else
			doPlayerSendCancel(cid, "Target lost.")
		end
	else return false
	end
end

function onCastSpell(cid, var)

	if (getPlayerStorageValue(getCreatureTarget(cid), GRANTOWER.AURA) == 1) then
    if getGlobalStorageValue(GRANTOWER.SAVEWINNERGUILDID) == getPlayerGuildId(getCreatureTarget(cid)) then
    doSendMagicEffect(getCreaturePosition(cid), 2)
    return false
    end
	end
	if (isCreature(cid)) and (getCreatureTarget(cid) > 0) then
	startSpellSystem(cid, 0, getCreatureTarget(cid))
	end
	return true
end