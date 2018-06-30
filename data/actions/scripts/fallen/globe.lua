function onUse(cid, item, frompos, item2, topos)
	
    if getPlayerGroupId(cid) == 6 then
    doPlayerAddPremiumDays(cid, 5)
	doSendMagicEffect(getPlayerPosition(cid),14)
	return true
	end

   	return false
end
