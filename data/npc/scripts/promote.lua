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

	if msgcontains(msg, 'promotion') or msgcontains(msg, 'promote') then
		newvocation = 0
		
		if getPlayerLevel(cid) < 20 then
			npcHandler:say('Sorry, you need level 20 to buy promotion.', cid)
			npcHandler:releaseFocus(cid)
		else
			if getPlayerVocation(cid) == 1 then
				newvocation = 5		
			elseif getPlayerVocation(cid) == 2 then
				newvocation = 6
			elseif getPlayerVocation(cid) == 3 then
				newvocation = 7
			elseif getPlayerVocation(cid) == 4 then
				newvocation = 8
			elseif getPlayerVocation(cid) == 5 or getPlayerVocation(cid) == 6 or getPlayerVocation(cid) == 7 or getPlayerVocation(cid) == 8 then
				npcHandler:say('Sorry, you are already promoted.', cid)
				newvocation = 0
				npcHandler:releaseFocus(cid)
			elseif getPlayerVocation(cid) == 9 or getPlayerVocation(cid) == 10 then
				npcHandler:say('Sorry, you is a Game Master.', cid)
				newvocation = 0
				npcHandler:releaseFocus(cid)
			elseif getPlayerVocation(cid) == 15 or getPlayerVocation(cid) == 16 or getPlayerVocation(cid) == 17 or getPlayerVocation(cid) == 18 then
				npcHandler:say('Wow! You have a superior vocation, you don\'t need it.', cid)
				newvocation = 0
				npcHandler:releaseFocus(cid)
			else
				npcHandler:say('Sorry, you have a problem with your character. Please contact a tutor or a gamemaster.', cid)
				newvocation = 0
				npcHandler:releaseFocus(cid)
			end
		end
		
		if newvocation ~= 0 then
			if pay(cid,20000) then
				playerPos = getPlayerPosition(cid)
				doSendMagicEffect(playerPos,CONST_ME_HOLYAREA)
				doPlayerSetVocation(cid, newvocation)
				npcHandler:say('You are now promoted!', cid)
				npcHandler:releaseFocus(cid)
			else
				npcHandler:say('Sorry, you do not have enough money.', cid)
				npcHandler:releaseFocus(cid)
			end
		end
	
	elseif msgcontains(msg, 'premium') or msgcontains(msg, 'premmy') or msgcontains(msg, 'premmium') then
		npcHandler:say('I don\'t sell premium accounts. You can get premium days making donations to FoxWorld. More details on our site.', cid)
		npcHandler:releaseFocus(cid)
	end
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)

-----------------------
-- / Parte editável
npcHandler:addModule(FocusModule:new())
