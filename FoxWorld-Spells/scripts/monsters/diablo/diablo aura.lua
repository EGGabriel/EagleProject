local function DiabloAura4(p)
	if isCreature(p.cid) == FALSE then
		return FALSE
	end
	p.outfit.lookBody = 78
	p.outfit.lookFeet = 79
	doCreatureChangeOutfit(p.cid, p.outfit)
	return TRUE
end

local function DiabloAura3(p)
	if isCreature(p.cid) == FALSE then
		return FALSE
	end
	p.outfit.lookBody = 77
	p.outfit.lookFeet = 78
	doCreatureChangeOutfit(p.cid, p.outfit)
	addEvent(DiabloAura4, 250, p)
	return TRUE
end

local function DiabloAura2(p)
	if isCreature(p.cid) == FALSE then
		return FALSE
	end
	p.outfit.lookBody = 96
	p.outfit.lookFeet = 79
	doCreatureChangeOutfit(p.cid, p.outfit)
	addEvent(DiabloAura3, 250, p)
	return TRUE
end

local function DiabloAura1(p)
	if isCreature(p.cid) == FALSE then
		return FALSE
	end
	p.outfit.lookBody = 115
	p.outfit.lookFeet = 78
	doCreatureChangeOutfit(p.cid, p.outfit)
	addEvent(DiabloAura2, 250, p)
	return TRUE
end

function onCastSpell(cid, var)
	local outfit = getCreatureOutfit(cid)
	addEvent(DiabloAura1, 0, {cid=cid,outfit=outfit})
	return TRUE
end
