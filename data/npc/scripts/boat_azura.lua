local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
local pos = {x=811,y=746,z=7}

function onCreatureAppear(cid)                  npcHandler:onCreatureAppear(cid)                end
function onCreatureDisappear(cid)               npcHandler:onCreatureDisappear(cid)             end
function onCreatureSay(cid, type, msg)          npcHandler:onCreatureSay(cid, type, msg)        end
function onThink()                              npcHandler:onThink()                            end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	
local talkUser = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid
	
if msgcontains(msg, 'Fallenori') or msgcontains(msg, 'yes') then
if doPlayerRemoveMoney(cid, 10000) == true then          
selfSay("Até mais!.", cid)
doTeleportThing(cid, pos, true)
else
selfSay("Você não tem dinheiro o suficiente.", cid)
end
end
return true 
end
        
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())