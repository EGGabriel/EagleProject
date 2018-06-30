local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink()
npcHandler:onThink() end

function creatureSayCallback(cid, type, msg)
if(npcHandler.focus ~= cid) then
return false
end

if msgcontains(msg, 'job') or msgcontains(msg, 'speciality') then
selfSay('Bem, eu fui criado por Myself para trocar a sprite wand, que a partir de agora é de sorcerers apenas por uma mermaid rod. PEÇA PARA TROCAR APENAS SE VOCÊ FOR DRUID E QUISER TROCAR SUA SPRITE WAND PELA MERMAID ROD!')
elseif msgcontains(msg, 'mermaid rod') or msgcontains(msg, 'rod') or msgcontains(msg, 'trade') or msgcontains(msg, 'troca') then
selfSay('Tens certeza que deseja trocar sua Sprite Wand por uma Mermaid Rod? Apenas Druids podem usa-la. Confirme com um simples YES.')
talk_state = 1

elseif msgcontains(msg, 'yes') and talk_state == 1 then
if getPlayerItemCount(cid,7409) >= 1 then
if pay(cid,0) then
doPlayerTakeItem(cid, 7409, 1)
doPlayerAddItem(cid,7735,1)
selfSay('Aqui esta.')
end
else
selfSay('Me desculpe, mas voce nao tem uma Sprite Wand.')
end

elseif msgcontains(msg, 'no') and (talk_state >= 1 and talk_state <= 5) then
selfSay('Passar bem, ' .. creatureGetName(cid) .. '...')
talk_state = 0
end
return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())