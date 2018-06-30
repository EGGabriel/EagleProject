local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()					npcHandler:onThink()					end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end

	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

	if(msgcontains(msg, 'castle') then
                            if os.date("%A") == ("Saturday") then
                                          if (os.date("%X") >= "17:00:00") and (os.date("%X") <= "18:00:00") then
                                          templo = {x = 851, y = 967, z = 7}
                                          doTeleportThing(cid, templo)
                                          talkState[cid] = 0
                            else
                                          selfSay('Desculpe, mas eu só posso teleporta-lo para o Gran Castle aos Sábados entre ás 17:00 e 18:00 horas', cid) 
                            end
             end
                            
return TRUE
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
