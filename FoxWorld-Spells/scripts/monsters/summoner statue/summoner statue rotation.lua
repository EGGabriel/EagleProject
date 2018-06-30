local function StatueRotation2(cid)
	if isCreature(cid) == FALSE then
		return FALSE
	end
	doSetItemOutfit(cid, 8834, 1000)
	return TRUE
end

local function StatueRotation1(cid)
	if isCreature(cid) == FALSE then
		return FALSE
	end
	doSetItemOutfit(cid, 8835, 1000)
	addEvent(StatueRotation2, 1000, cid)
	return TRUE
end

function onCastSpell(cid, var)
	addEvent(StatueRotation1, 0, cid)
	return TRUE
end
