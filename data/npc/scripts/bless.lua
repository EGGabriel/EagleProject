local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)				
npcHandler:onCreatureAppear(cid)			
end
function onCreatureDisappear(cid) 			
npcHandler:onCreatureDisappear(cid)			
end
function onCreatureSay(cid, type, msg)			
npcHandler:onCreatureSay(cid, type, msg)		
end
function onThink()					
npcHandler:onThink()					
end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	
local talkUser = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid
	
 if msgcontains(msg, 'yes') or msgcontains(msg, 'bless') then
    talkState[talkUser] = 1
    if getPlayerBlessing(cid, 5) == false then
		if doPlayerRemoveMoney(cid, 500000) == true then          
		selfSay("Em nome dos deuses, lhe concedo agora bless!", cid)
		for i = 1, 5 do
		doPlayerAddBlessing(cid, i)
		end
		doSendMagicEffect(getPlayerPosition(cid),49)
		return true
		else
		selfSay("Não tem o suficiente para se proteger?", cid)
		end
	else
	selfSay("Impossível, você já está com bless!", cid)
	end
 elseif msgcontains(msg, 'no') or talkState[talkUser] == 1 then
 selfSay('Ok then.', cid)
 talkState[talkUser] = 0
 end
return true 
end
        
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())