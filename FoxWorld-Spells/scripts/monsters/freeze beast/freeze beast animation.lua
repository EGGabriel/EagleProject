function onCastSpell(cid, var)
	local cidPos = getCreaturePosition(cid)
	doSendMagicEffect(cidPos, CONST_ME_WATERCREATURE)
	return TRUE
end
