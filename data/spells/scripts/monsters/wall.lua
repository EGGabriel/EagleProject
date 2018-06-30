function onCastSpell(cid, var)
	if getCreatureHealth(cid) <= (getCreatureMaxHealth(cid) / 100) * 59 then
		doSetItemOutfit(cid, 3767, -1)
	else
		doRemoveCondition(cid, CONDITION_OUTFIT)
		return FALSE
	end
	return TRUE
end