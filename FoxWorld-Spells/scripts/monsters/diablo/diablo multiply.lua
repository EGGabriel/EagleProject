local function DiabloReturn(p)
	local newDiabloPos = getCreaturePosition(p.minidiablos[math.random(1,6)])

	for i=1,6 do
		doSendMagicEffect(getCreaturePosition(p.minidiablos[i]), CONST_ME_ENERGYAREA)
		doRemoveCreature(p.minidiablos[i])
	end

	doTeleportThing(p.cid, newDiabloPos, FALSE)
end

function onCastSpell(cid, var)
	
	local nothingPos = {x=50,y=50,z=7} -- lugar vazio no mapa do FoxWorld
	local minidiablos = {}
	local oldDiabloPos = getCreaturePosition(cid)
	
	doTeleportThing(cid, nothingPos, FALSE)
	doSendMagicEffect(oldDiabloPos, CONST_ME_ENERGYAREA)

	for i=1,6 do
		minidiablos[i] = doSummonCreature("mini diablo", nothingPos)
		doTeleportThing(minidiablos[i], oldDiabloPos, FALSE)
	end
	
	addEvent(DiabloReturn, 10000, {cid=cid,minidiablos=minidiablos})

	return TRUE
end
