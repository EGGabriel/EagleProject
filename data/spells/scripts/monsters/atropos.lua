function onCastSpell(cid, var)

target = getCreatureTarget(cid)
pos = getCreaturePosition(target)

if isPlayer(target) == TRUE then
	setPlayerStorageValue(target, 6000, pos.x)
	setPlayerStorageValue(target, 6001, pos.y)
	setPlayerStorageValue(target, 6002, pos.z)
	doSendDistanceShoot(getCreaturePosition(cid), getCreaturePosition(target), 41)
	if getPlayerSex(target) == 1 then
		doCreateItem(3058, 1, pos)
		doSendMagicEffect({x=pos.x,y=pos.y-1,z=pos.z}, 32)
		doTeleportThing(target, {x= math.random(1074, 1104), y= math.random(638, 665), z= 6})
	elseif getPlayerSex(target) == 0 then
		doCreateItem(3065, 1, pos)
		doSendMagicEffect({x=pos.x,y=pos.y-1,z=pos.z}, 32)
		doTeleportThing(target, {x= math.random(1074, 1104), y= math.random(638, 665), z= 6})
	end
end
end