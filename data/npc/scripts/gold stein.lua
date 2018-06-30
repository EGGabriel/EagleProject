local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink()
-- Walking --

if focus == 0 and max_x >= 0 and max_y >= 0 then

cx, cy, cz = selfGetPosition()

randmove = math.random(1,20)

if randmove == 4 and current_x <= max_x then

nx = cx + 1

current_x = current_x + 1

elseif randmove == 8 and current_x >= (max_x - (max_x * 2)) then

nx = cx - 1

current_x = current_x - 1

elseif randmove == 12 and current_y <= max_y then

ny = cy + 1

current_y = current_y + 1

elseif randmove == 16 and current_y >= (max_y - (max_y * 2)) then

ny = cy - 1

current_y = current_y - 1

elseif randmove <= 20 then

nx = cx

ny = cy

end

moveToPosition(nx, ny, cz)

end

-- End Walking --
npcHandler:onThink() end

function creatureSayCallback(cid, type, msg)
if(npcHandler.focus ~= cid) then
return false
end

if msgcontains(msg, 'job') or msgcontains(msg, 'speciality') then
selfSay('I\'m Gold Stein, an axe warrior who looks for stronger people to do a task for me.')
elseif msgcontains(msg, 'mission') or msgcontains(msg, 'task') or msgcontains(msg, 'reward') or msgcontains(msg, 'secrets') or msgcontains(msg, 'service') then
selfSay('Oh, may you help me? Are you really strong? Well... A Warlord called Sphinks is trying to get the Zathroth\'s armor and rule our world. If you kill Sphinks BEFORE it, and bring to me his heart, I can give to you a NICE reward. Tip, you can find the teleport to this area in a Hydra\'s mountain.')
elseif msgcontains(msg, 'heart') or msgcontains(msg, 'defeated')  or msgcontains(msg, 'killed') then
selfSay('OH MY GOD! DID YOU KILL THE SUPREME WARLORD SPHINKS?')
talk_state = 1

storagevalue = 26743 -- qualquer storage não usada pelas quests do servidor ainda
newvalue = 1 -- value que será colocado na storage storagevalue ao fazer a quest

elseif msgcontains(msg, 'yes') and talk_state == 1 then
if getPlayerItemCount(cid,5943) >= 1 then
if getPlayerStorageValue(cid,storagevalue) ~= newvalue then
doPlayerTakeItem(cid, 5943, 1)
doPlayerAddItem(cid,2090,1)
setPlayerStorageValue(cid,storagevalue,newvalue)
selfSay('OH YEAH! This is its heart! Well... Take this key. Dwarvens keep secrets inside a door.')
else
selfSay('Sorry, you have already done this mission for me.')
end
else
selfSay('First bring me the proof, then I\'ll give you a reward..')
end

elseif msgcontains(msg, 'no') and (talk_state >= 1 and talk_state <= 5) then
selfSay('Ok then...')
talk_state = 0
end
return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())