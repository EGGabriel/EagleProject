local config = {
	seconds = 10,
	cdStorage = 111312,
	msg = "Você precisa aguardar %d segundos para acumular o espírito.",
	manaPercentage = 50, -- Porcentagem de Mana que a habilidade consome (Min = 0, Max = 100)
    semMana = "Voc\ê n\ão t\êm mana suficiente."
}

local areaA = createCombatArea(AREA_PIERCEDCIRCLE3X3A)
local areaB = createCombatArea(AREA_PIERCEDCIRCLE3X3B)

local function startSpellSystem(cid, time, beforeTarget, area)

	local nowTarget = getCreatureTarget(cid)
	if isCreature(cid) then
		if nowTarget == beforeTarget then
			local nowTargetPos = getCreaturePosition(nowTarget)
			local cidPos = getCreaturePosition(cid)
			if time < 20 then
			    doSendDistanceShoot(cidPos, nowTargetPos, 18)
				doSendDistanceShoot(cidPos, nowTargetPos, 40)
				addEvent(startSpellSystem, 100, cid, time+1, nowTarget)
			elseif time == 20 then
				doTeleportThing(cid, nowTargetPos)
				doAreaCombatHealth(cid,COMBAT_PHYSICALDAMAGE,getPlayerPosition(cid),areaA,-(getPlayerLevel(cid)*1.5),-(getPlayerLevel(cid)*3),34)
				doAreaCombatHealth(cid,COMBAT_PHYSICALDAMAGE,getPlayerPosition(cid),areaB,-(getPlayerLevel(cid)*1.5),-(getPlayerLevel(cid)*3),68)
			end
		else
			doPlayerSendCancel(cid, "Target lost.")
		end
	end
end

function onCastSpell(cid, var)
	local manaConsumption = getCreatureMaxMana(cid)*config.manaPercentage/100
	
	if not isCreature(getCreatureTarget(cid)) then
	doPlayerSendCancel(cid, "Você precisa selecionar um alvo.")
	return false
	end

    if config.seconds-(os.time()-getPlayerStorageValue(cid, config.cdStorage)) > 0 then
    doPlayerSendCancel(cid, string.format(config.msg, config.seconds-(os.time()-getPlayerStorageValue(cid, config.cdStorage))))
    doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
    return false
    end
	
	if getCreatureMana(cid) < manaConsumption then
	doPlayerSendCancel(cid, config.semMana)
	doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
	return false
	end
		
    setPlayerStorageValue(cid, config.cdStorage, os.time())
	doPlayerAddMana(cid, -manaConsumption)
	startSpellSystem(cid, 0, getCreatureTarget(cid))	
	return true
end