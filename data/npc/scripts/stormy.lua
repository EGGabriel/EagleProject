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
selfSay('I\'m the owner of this old and abandoned library. I\'m hiding here because the Silverwar\'s troops wants to catch me, because I\'ve discovered some secrets of them.')
elseif msgcontains(msg, 'mission') or msgcontains(msg, 'task') or msgcontains(msg, 'reward') or msgcontains(msg, 'silverwar') or msgcontains(msg, 'silverwar\'s') or msgcontains(msg, 'secrets') or msgcontains(msg, 'service') then
selfSay('Hmm, do you REALLY want to know? Silverwar is a General who stole and kill wise men, just for fun. He wants to kill me, but he doesn\'t know I\'m hidding here... If you see him, please kill and get my old book. If you do this, I can give a nice reward to you.')
elseif msgcontains(msg, 'book') or msgcontains(msg, 'tome')  or msgcontains(msg, 'green tome') then
selfSay('Oh! Have you found my book?')
talk_state = 1

elseif msgcontains(msg, 'yes') and talk_state == 1 then
if getPlayerItemCount(cid,1983) >= 1 then
doPlayerTakeItem(cid, 1983, 1)
doPlayerAddItem(cid,7422,1)
doPlayerAddItem(cid,2507,1)
selfSay('Thanks so much! Take these rarely items. I\'m sure you deserve them!')
else
selfSay('Sorry, you don\'nt bring my book to me.')
end

elseif msgcontains(msg, 'no') and (talk_state >= 1 and talk_state <= 5) then
selfSay('Ok then...')
talk_state = 0
end
return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())