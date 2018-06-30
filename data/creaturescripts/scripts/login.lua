local config = {
	loginMessage = getConfigValue('loginMessage'),
	useFragHandler = getBooleanFromString(getConfigValue('useFragHandler'))
}

function onLogin(cid)
	local loss = getConfigValue('deathLostPercent')
	if(loss ~= nil) then
		doPlayerSetLossPercent(cid, PLAYERLOSS_EXPERIENCE, loss * 10)
	end

	local accountManager = getPlayerAccountManager(cid)
	if(accountManager == MANAGER_NONE) then
		local lastLogin, str = getPlayerLastLoginSaved(cid), config.loginMessage
		if(lastLogin > 0) then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, str)
			str = "Your last visit was on " .. os.date("%a %b %d %X %Y", lastLogin) .. "."
		else
			str = str .. " Please choose your outfit."
			doPlayerSendOutfitWindow(cid)
		end

		doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, str)
	elseif(accountManager == MANAGER_NAMELOCK) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Hello, it appears that your character has been namelocked, what would you like as your new name?")
	elseif(accountManager == MANAGER_ACCOUNT) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Hello, type {account} to manage your account and if you want to start over then type {cancel}.")
	else
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Hello, type {account} to create an account or type {recover} to recover an account.")
	end

	if(not isPlayerGhost(cid)) then
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
	end
	
	if getPlayerStorageValue(cid, 5001) > 0 then
    sendGemEffect(cid, 600)
    end
	if getPlayerVocation(cid) > 34 or ((getPlayerVocation(cid) > 0) and (getPlayerVocation(cid) < 11)) then
    doPlayerSetVocation(cid, 11)
    end
	registerCreatureEvent(cid, "onlinebonus")
	registerCreatureEvent(cid, "combat_dodge")
	registerCreatureEvent(cid, "combat_critical")
	registerCreatureEvent(cid, "idle")
	registerCreatureEvent(cid, "loguthunt") 	
	registerCreatureEvent(cid, "mail") 	  	 
	registerCreatureEvent(cid, "reportbug")
	registerCreatureEvent(cid, "skullcheck")
	
	if(config.useFragHandler) then
		registerCreatureEvent(cid, "skullcheck")
		registerCreatureEvent(cid, "reward")
	end
	
	doPlayerSave(cid, true)
	
return true
end

