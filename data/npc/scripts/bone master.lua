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
selfSay('I\'m a Necromancer from Brotherhood of Bones. I can give you a nice reward, if you do a mission for me.')
elseif msgcontains(msg, 'mission') or msgcontains(msg, 'task') or msgcontains(msg, 'reward') or msgcontains(msg, 'service') then
selfSay('I need you get 100 demonic essences from the demons around Pits, could you?')
elseif msgcontains(msg, 'essence') or msgcontains(msg, 'demonic') then
selfSay('Did you bring me the 100 demonic essences?')
talk_state = 1

storagevalue = 2541 -- qualquer storage não usada pelas quests do servidor ainda
newvalue = 1 -- value que será colocado na storage storagevalue ao fazer a quest
elseif msgcontains(msg, 'yes') and talk_state == 1 then
if getPlayerItemCount(cid,6500) >= 100 then
if getPlayerStorageValue(cid,storagevalue) ~= newvalue then
doPlayerTakeItem(cid, 6500, 100)
doPlayerAddItem(cid,6433,1)
setPlayerStorageValue(cid,storagevalue,newvalue)
selfSay('Thanks very much! Take this nice and rarely shield, I hope you like it.')
else
selfSay('You already have this shield.')
end
else
selfSay('You don\'t have 100 demonic essence. Back when you got that.')
end

elseif msgcontains(msg, 'no') and (talk_state >= 1 and talk_state <= 5) then
selfSay('Ok then...')
talk_state = 0
end
return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())