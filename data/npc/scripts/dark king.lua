local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

function creatureSayCallback(cid, type, msg)
if(not npcHandler:isFocused(cid)) then
return false
end
if msgcontains(msg, 'items') then
selfSay('Eu vendo {dragon jester set}, {solar demon set}, também vendo {guardian lance}, {black axe}, {runed sword} e {cranial basher}', cid)

elseif msgcontains(msg, 'dragon jester set') then
if getPlayerItemCount(cid,2157) >= 200 then
selfSay('Uma Dragon Jester Set set custa 200 Moedas de Evento. Deseja comprar uma ?', cid)
talk_state = 1
else
selfSay('Você precisa de 200 Moedas de Evento para comprar uma Dragon Jester Set.', cid)
talk_state = 0
end

elseif msgcontains(msg, 'sim') and talk_state == 1 then
talk_state = 0
if getPlayerItemCount(cid,2157) >= 200 then
if doPlayerRemoveItem(cid,2157, 200) == TRUE then
selfSay(done, cid)
doPlayerAddItem(cid, 7957, 1)
doPlayerAddItem(cid, 7958, 1)
doPlayerAddItem(cid, 8880, 1)
doPlayerAddItem(cid, 8909, 1)
doPlayerAddItem(cid, 2469, 1)
end
else
selfSay(item, cid)
end




elseif msgcontains(msg, 'solar demon set') then
if getPlayerItemCount(cid,2157) >= 200 then
selfSay('Uma Solar Demon Set custa 200 Moedas de Evento. Deseja comprar uma ?', cid)
talk_state = 1
else
selfSay('Você precisa de 200 Moedas de Evento para comprar uma Solar Demon Set.', cid)
talk_state = 0
end

elseif msgcontains(msg, 'sim') and talk_state == 1 then
talk_state = 0
if getPlayerItemCount(cid,2157) >= 200 then
if doPlayerRemoveItem(cid,2157, 200) == TRUE then
selfSay(done, cid)
doPlayerAddItem(cid, 2128, 1)
doPlayerAddItem(cid, 8925, 1)
doPlayerAddItem(cid, 8892, 1)
doPlayerAddItem(cid, 8906, 1)
doPlayerAddItem(cid, 2495, 1)
end
else
selfSay(item, cid)
end



elseif msgcontains(msg, 'black axe') then
if getPlayerItemCount(cid,2157) >= 40 then
selfSay('Um Black Axe custa 40 Moedas de Evento. Deseja comprar um ?', cid)
talk_state = 1
else
selfSay('Você precisa de 40 Moedas de Evento para comprar 1 Black Axe.', cid)
talk_state = 0
end

elseif msgcontains(msg, 'sim') and talk_state == 1 then
talk_state = 0
if getPlayerItemCount(cid,2157) >= 40 then
if doPlayerRemoveItem(cid,2157, 40) == TRUE then
selfSay(done, cid)
doPlayerAddItem(cid, 7435, 1)
end
else
selfSay(item, cid)
end



elseif msgcontains(msg, 'runed sword') then
if getPlayerItemCount(cid,2157) >= 40 then
selfSay('Uma Runed Sword custa 40 Moedas de Evento. Deseja comprar uma ?', cid)
talk_state = 1
else
selfSay('Você precisa de 40 gold nugget para comprar uma Runed Sword.', cid)
talk_state = 0
end

elseif msgcontains(msg, 'sim') and talk_state == 1 then
talk_state = 0
if getPlayerItemCount(cid,2157) >= 40 then
if doPlayerRemoveItem(cid,2157, 40) == TRUE then
selfSay(done, cid)
doPlayerAddItem(cid, 7417, 1)

end
else
selfSay(item, cid)
end





elseif msgcontains(msg, 'cranial basher') then
if getPlayerItemCount(cid,2157) >= 40 then
selfSay('Um Cranial Basher custa 40 Moedas de Evento. Deseja comprar um ?', cid)
talk_state = 1
else
selfSay('Você precisa de 40 gold nugget para comprar um Cranial Basher.', cid)
talk_state = 0
end

elseif msgcontains(msg, 'sim') and talk_state == 1 then
talk_state = 0
if getPlayerItemCount(cid,2157) >= 40 then
if doPlayerRemoveItem(cid,2157, 40) == TRUE then
selfSay(done, cid)
doPlayerAddItem(cid, 7415, 1)

end
else
selfSay(item, cid)
end




elseif msgcontains(msg, 'guardian lance') then
if getPlayerItemCount(cid,2157) >= 40 then
selfSay('você tem 40 gold nugget?', cid)
talk_state = 1
else
selfSay('Você precisa de 40 Moedas de Evento para comprar uma Guardian Lance.', cid)
talk_state = 0
end

elseif msgcontains(msg, 'sim') and talk_state == 1 then
talk_state = 0
if getPlayerItemCount(cid,2157) >= 40 then
if doPlayerRemoveItem(cid,2157, 40) == TRUE then
selfSay(done, cid)
doPlayerAddItem(cid, 2427, 1)

end
else
selfSay(item, cid)
end


elseif msgcontains(msg, 'no') and (talk_state >= 1 and talk_state <= 5) then
selfSay('Ok than.')
talk_state = 0
end
-- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself.
return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())