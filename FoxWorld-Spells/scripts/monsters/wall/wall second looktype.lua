function onCastSpell(cid, var)
	if getCreatureHealth(cid) < (getCreatureMaxHealth(cid)/2) then
		doSetItemOutfit(cid, 3767, 2000)
	else
		return FALSE
	end
	return TRUE
end
