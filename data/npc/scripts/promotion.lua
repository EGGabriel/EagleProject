local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)                  npcHandler:onCreatureAppear(cid)                end
function onCreatureDisappear(cid)               npcHandler:onCreatureDisappear(cid)             end
function onCreatureSay(cid, type, msg)          npcHandler:onCreatureSay(cid, type, msg)        end
function onThink()                              npcHandler:onThink()                            end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	if msgcontains(msg, "yes") or msgcontains(msg, "promot") then
		if not isPremium(cid) then
		selfSay('Sorry, promotion is only for *premium accounts*', cid)
		return true
		end
		if getPlayerPromotionLevel(cid) < 1 then
			if getPlayerLevel(cid) >= 20 then
				if doPlayerRemoveMoney(cid, 20000) then
				setPlayerPromotionLevel(cid, 1)
				selfSay('Congratulations! You are now promoted!', cid)
			    doSendMagicEffect(getPlayerPosition(cid),49)
				else
				selfSay('You need 20.0000 gps to get promoted.', cid)
				end
			else
			selfSay('I am sorry, but I can only promote you once you have reached level 20.', cid)
			end
		else
		selfSay('You are already promoted!', cid)
		end
	elseif msgcontains(msg, "no") then
	selfSay('Just come whenever you get ready.', cid)
	end

return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())