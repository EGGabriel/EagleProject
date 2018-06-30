local function GranTowerAura(p)
	if isCreature(p.cid) == FALSE then
		return FALSE
	end
	
	towerPos = getCreaturePosition(p.cid)

	if p.auraDir == 1 then
		doSendDistanceShoot({x=towerPos.x-1 , y=towerPos.y+1 , z=towerPos.z}, {x=towerPos.x-1 , y=towerPos.y-1 , z=towerPos.z}, CONST_ANI_FIRE)
		doSendDistanceShoot({x=towerPos.x , y=towerPos.y+1 , z=towerPos.z}, {x=towerPos.x+1 , y=towerPos.y , z=towerPos.z}, CONST_ANI_FIRE)
		auraDir = 2
		addEvent(GranTowerAura, 250, {cid = p.cid, auraDir = auraDir})
	elseif p.auraDir == 2 then
		doSendDistanceShoot({x=towerPos.x-1 , y=towerPos.y-1 , z=towerPos.z}, {x=towerPos.x+1 , y=towerPos.y-1 , z=towerPos.z}, CONST_ANI_FIRE)
		doSendDistanceShoot({x=towerPos.x+1 , y=towerPos.y , z=towerPos.z}, {x=towerPos.x , y=towerPos.y-1 , z=towerPos.z}, CONST_ANI_FIRE)
		auraDir = 3
		addEvent(GranTowerAura, 250, {cid = p.cid, auraDir = auraDir})
	elseif p.auraDir == 3 then
		doSendDistanceShoot({x=towerPos.x+1 , y=towerPos.y-1 , z=towerPos.z}, {x=towerPos.x+1 , y=towerPos.y+1 , z=towerPos.z}, CONST_ANI_FIRE)
		doSendDistanceShoot({x=towerPos.x , y=towerPos.y-1 , z=towerPos.z}, {x=towerPos.x-1 , y=towerPos.y , z=towerPos.z}, CONST_ANI_FIRE)
		auraDir = 4
		addEvent(GranTowerAura, 250, {cid = p.cid, auraDir = auraDir})
	else
		doSendDistanceShoot({x=towerPos.x+1 , y=towerPos.y+1 , z=towerPos.z}, {x=towerPos.x-1 , y=towerPos.y+1 , z=towerPos.z}, CONST_ANI_FIRE)
		doSendDistanceShoot({x=towerPos.x-1 , y=towerPos.y , z=towerPos.z}, {x=towerPos.x , y=towerPos.y+1 , z=towerPos.z}, CONST_ANI_FIRE)
		auraDir = 1
	end
end

function onCastSpell(cid, var)
	addEvent(GranTowerAura, 0, {cid = cid, auraDir = 1})
	return TRUE
end
