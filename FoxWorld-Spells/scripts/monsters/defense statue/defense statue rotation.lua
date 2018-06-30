local function StatueRotation4(cid)
	if isCreature(cid) == FALSE then
		return FALSE
	end
	doSetItemOutfit(cid, 3739, 1000)
	return TRUE
end

local function StatueRotation3(cid)
	if isCreature(cid) == FALSE then
		return FALSE
	end
	doSetItemOutfit(cid, 3742, 1000)
	addEvent(StatueRotation4, 1000, cid)
	return TRUE
end

local function StatueRotation2(cid)
	if isCreature(cid) == FALSE then
		return FALSE
	end
	doSetItemOutfit(cid, 3741, 1000)
	addEvent(StatueRotation3, 1000, cid)
	return TRUE
end

local function StatueRotation1(cid)
	if isCreature(cid) == FALSE then
		return FALSE
	end
	doSetItemOutfit(cid, 3740, 1000)
	addEvent(StatueRotation2, 1000, cid)
	return TRUE
end

function onCastSpell(cid, var)
	addEvent(StatueRotation1, 0, cid)
	return TRUE
end
