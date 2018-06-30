local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)


function onCreatureAppear(cid) npcHandler:-OnCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:-OnCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:-OnCreatureSay(cid, type, msg) end

function onThink()
npcHandler:-OnThink()
falar = math.random(1,40)
if falar == 1 then
selfSay("Bem vindo ao Legend FoxWorld, lembrando que o uso de bots fora dos treiner é proibido.")
elseif falar == 5 then
selfSay("O que está olhando? sou bonita mas sou dificil.")
elseif falar == 20 then
selfSay("Temos treiner em Solaris,Ashauchi e Versia chique néh?!")
end
end


npcHandler:SetCallback(CALLBACK_GREET, greetCallback)
npcHandler:addModule(FocusModule:new()) 
