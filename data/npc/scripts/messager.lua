local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

-- OTServ event handling functions start
-- BLOCOS de funçoes pre-definidas em data\npc\scripts\lib\npcsystem
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end
-- OTServ event handling functions end

function creatureSayCallback(cid, type, msg)
if(npcHandler.focus ~= cid) then
return false
end
msg = string.lower(msg)
if msg == 'help' or msg == 'job' then
selfSay('Ohh... My job is easy, I\'ll send your message to all players on-line!')
talk_state = 0

elseif msg == 'message' or msg == 'msg' or msg == 'mensagem' then
selfSay('Do you want to send a message to all players for 10000 gps?')
talk_state = 1

elseif msgcontains(msg, 'yes') and talk_state == 1 then
selfSay('What the message you want I send?')
talk_state = 2

elseif msgcontains(msg, 'no') and talk_state > 0 then
selfSay('Ok than.')
talk_state = 0

elseif msg ~= "" and talk_state == 2 then
if pay(cid,10000) then
selfSay('/B [BillNPCSystem] ' .. creatureGetName(cid) .. ' says: ' .. msg)
else
selfSay('Sorry, you don\'t have money.')
end
talk_state = 0
end
return TRUE
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())