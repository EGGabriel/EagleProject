local function inAtroposDimension(p)
	if isPlayer(p.alvo) == FALSE then
		return FALSE
	end
	
	if isCreature(p.atropos) == FALSE then
		p.tempo = 0
	end
	
	local alvoPos = getCreaturePosition(p.alvo)

	if p.tempo > 0 then
		doSendDistanceShoot(p.alvoOldPos, getCreaturePosition(p.atropos), CONST_ANI_CAKE)
		doSendMagicEffect(p.alvoOldPos, CONST_ME_GIFT_WRAPS)
		doSendMagicEffect(alvoPos, CONST_ME_GIFT_WRAPS)
		addEvent(inAtroposDimension, 1000, {alvo = p.alvo, alvoOldPos = p.alvoOldPos, atropos = p.atropos, tempo = p.tempo-1})
	else
		doSendMagicEffect(p.alvoOldPos, CONST_ME_GIFT_WRAPS)
		doSendMagicEffect(alvoPos, CONST_ME_GIFT_WRAPS)

		doTeleportThing(p.alvo, p.alvoOldPos, 0)

		local corpse = 0
		if getPlayerSex(p.alvo) == 0 then
			corpse = getTileItemById(p.alvoOldPos, 6081)
		else
			corpse = getTileItemById(p.alvoOldPos, 6080)
		end

		if corpse.itemid ~= 0 then
			doRemoveItem(corpse.uid)
		end
	end
end

function onCastSpell(cid, var)
	local alvo = getCreatureTarget(cid)
	
	if isPlayer(alvo) == FALSE then
		return FALSE
	end
	
	local alvoOldPos = getCreaturePosition(alvo)
	local atroposPos = getCreaturePosition(cid)
	local AtroposDimension = {x=math.random(31,56) , y=math.random(125,150) , z=5}

	local alvoEffect = {x=alvoOldPos.x , y=alvoOldPos.y , z=alvoOldPos.z}
	alvoEffect.x = alvoEffect.x-1
	doSendDistanceShoot(atroposPos, alvoEffect, CONST_ANI_CAKE)
	alvoEffect.y = alvoEffect.y-1
	doSendDistanceShoot(atroposPos, alvoEffect, CONST_ANI_CAKE)
	alvoEffect.x = alvoEffect.x+1
	doSendDistanceShoot(atroposPos, alvoEffect, CONST_ANI_CAKE)
	alvoEffect.x = alvoEffect.x+1
	doSendDistanceShoot(atroposPos, alvoEffect, CONST_ANI_CAKE)
	alvoEffect.y = alvoEffect.y+1
	doSendDistanceShoot(atroposPos, alvoEffect, CONST_ANI_CAKE)
	alvoEffect.y = alvoEffect.y+1
	doSendDistanceShoot(atroposPos, alvoEffect, CONST_ANI_CAKE)
	alvoEffect.x = alvoEffect.x-1
	doSendDistanceShoot(atroposPos, alvoEffect, CONST_ANI_CAKE)
	alvoEffect.x = alvoEffect.x-1
	doSendDistanceShoot(atroposPos, alvoEffect, CONST_ANI_CAKE)

	if getPlayerSex(alvo) == 0 then
		alvoCorpse = doCreateItem(6081,1,alvoOldPos)
	else
		alvoCorpse = doCreateItem(6080,1,alvoOldPos)
	end

	doTeleportThing(alvo, AtroposDimension, 0)
	doSendMagicEffect(AtroposDimension, CONST_ME_GIFT_WRAPS)
	
	addEvent(inAtroposDimension, 0, {alvo = alvo, alvoOldPos = alvoOldPos, atropos = cid, tempo = 10}) -- tempo é o qual ficará preso na Atropos Dimension
end
