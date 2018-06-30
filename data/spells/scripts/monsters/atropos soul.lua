function onCastSpell(cid, var)

target = getCreatureTarget(cid)
pos = getCreaturePosition(target)
posx = getPlayerStorageValue(target, 6000)
posy = getPlayerStorageValue(target, 6001)
posz = getPlayerStorageValue(target, 6002)
targetpos = {x=posx, y=posy, z=posz, stackpos=1}
postarget = getThingfromPos(targetpos)

if math.random(1, 100) <= 30 then
	if isPlayer(target) == TRUE and getPlayerSex(target) == 1 and postarget.itemid == 3058 then
		doSendDistanceShoot(getCreaturePosition(cid), getCreaturePosition(target), 41)
		doRemoveItem(postarget.uid, 1)
		doTeleportThing(target, {x = posx, y = posy, z = posz})
	elseif isPlayer(target) == TRUE and getPlayerSex(target) == 0 and postarget.itemid == 3065 then
		doSendDistanceShoot(getCreaturePosition(cid), getCreaturePosition(target), 41)
		doRemoveItem(postarget.uid, 1)
		doTeleportThing(target, {x = posx, y = posy, z = posz})
	end

else
	doSendMagicEffect({x=posx,y=posy-1,z=posz}, 32)
end
end