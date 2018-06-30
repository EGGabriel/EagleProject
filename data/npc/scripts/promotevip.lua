-- Módulos padrão
-------------------------
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()						npcHandler:onThink()						end
-------------------------
-- / Módulos padrão


-- Parte editável
---------------------

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	
	if msgcontains(msg, 'promotion') or msgcontains(msg, 'promote') or msgcontains(msg, 'vip') then
		newvocation = 0
	
		if getPlayerLevel(cid) < 20 then
			npcHandler:say('Sorry, you need level 20 to buy the superior promotion.', cid)
			npcHandler:releaseFocus(cid)
		elseif isPremium(cid) ~= TRUE then
			npcHandler:say('Sorry, you must be premium to buy the superior promotion.', cid)
			npcHandler:releaseFocus(cid)
		else
			if getPlayerVocation(cid) == 1 or getPlayerVocation(cid) == 5 then
				newvocation = 15
			elseif getPlayerVocation(cid) == 2 or getPlayerVocation(cid) == 6 then
				newvocation = 16
			elseif getPlayerVocation(cid) == 3 or getPlayerVocation(cid) == 7 then		
				newvocation = 17
			elseif getPlayerVocation(cid) == 4 or getPlayerVocation(cid) == 8 then
				newvocation = 18
			elseif getPlayerVocation(cid) == 9 then
				npcHandler:say('Sorry, you is a Game Master.', cid)
				newvocation = 0
				npcHandler:releaseFocus(cid)
			elseif getPlayerVocation(cid) == 10 then
				npcHandler:say('You is the GOD!', cid)
				newvocation = 0
				npcHandler:releaseFocus(cid)
			elseif getPlayerVocation(cid) == 15 or getPlayerVocation(cid) == 16 or getPlayerVocation(cid) == 17 or getPlayerVocation(cid) == 18 then
				npcHandler:say('Sorry, you are already superior promoted.', cid)
				newvocation = 0
				npcHandler:releaseFocus(cid)
			else
				npcHandler:say('Sorry, you have a problem with your character. Please contact a tutor or a gamemaster.', cid)
				newvocation = 0
				npcHandler:releaseFocus(cid)
			end
			
			if newvocation ~= 0 then
				playerPos = getPlayerPosition(cid)
				doSendMagicEffect(playerPos,CONST_ME_HOLYAREA)
				doPlayerSetVocation(cid, newvocation)
				npcHandler:say('You are now superior promoted!', cid)
				npcHandler:releaseFocus(cid)
			end
		end
	end
	return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)

-----------------------
-- / Parte editável
npcHandler:addModule(FocusModule:new())
