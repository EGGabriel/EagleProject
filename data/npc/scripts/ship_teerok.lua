local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
local talkState = {}
NpcSystem.parseParameters(npcHandler)
local pos = {x=376,y=868,z=6}

function onCreatureAppear(cid)                  npcHandler:onCreatureAppear(cid)                end
function onCreatureDisappear(cid)               npcHandler:onCreatureDisappear(cid)             end
function onCreatureSay(cid, type, msg)          npcHandler:onCreatureSay(cid, type, msg)        end
function onThink()                              npcHandler:onThink()                            end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	
local talkUser = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid
	
if msgcontains(msg, 'Teerok') or msgcontains(msg, 'yes') then
if doPlayerRemoveMoney(cid, 10000) == true then          
selfSay("Passageiro entregue em Teerok!.", cid)
doTeleportThing(cid, pos, true)
else
selfSay("Você não tem dinheiro o suficiente.", cid)
end
end
return true 
end
        
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())