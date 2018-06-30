[codebox]local focus = 0
local talk_start = 0
local target = 0
local following = false
local attacking = false

function onThingMove(creature, thing, oldpos, oldstackpos)

end


function onCreatureAppear(creature)

end


function onCreatureDisappear(cid, pos)
if focus == cid then
selfSay('Good bye then.')
focus = 0
talk_start = 0
end
end


function onCreatureTurn(creature)

end


function msgcontains(txt, str)
return (string.find(txt, str) and not string.find(txt, '(%w+)' .. str) and not string.find(txt, str .. '(%w+)'))
end


function onCreatureSay(cid, type, msg)
msg = string.lower(msg)

if (msgcontains(msg, 'hi') and (focus == 0)) and getDistanceToCreature(cid) < 4 then
selfSay('Ola ' .. getCreatureName(cid) .. '! Eu vendo todas as 5 Bless, se estiver interessado diga: BLESSINGS. Quando morrer e quiser comprar as bless novamente diga RESET.')
focus = cid
talk_start = os.clock()

elseif msgcontains(msg, 'hi') and (focus ~= cid) and getDistanceToCreature(cid) < 4 then
selfSay('Sorry, ' .. getCreatureName(cid) .. '! I talk to you in a minute.')

elseif focus == cid then
talk_start = os.clock()

if msgcontains(msg, 'blessings') then
selfSay('Eu posso liberar as 5 blesses por 10k cada, se estiver interessado diga: bless1,bless2,bless3 ou bless4.(A bless4 custa 20k pois adiciona a bless4 e bless5).')


elseif msgcontains(msg, 'bless1') then
queststatus = getPlayerStorageValue(cid,750199)
if queststatus == -1 then
if pay(cid,10000) then
doPlayerAddBlessing(cid,1)
selfSay('Parabens, voce adquiriu a primeira Bless.')
setPlayerStorageValue(cid,750199,1)
else
selfSay('Desculpe, voce precisa de 10k.')

end
else
selfSay('Desculpe, voce ja tem essa bless.')

end

elseif msgcontains(msg, 'bless2') then
queststatus2 = getPlayerStorageValue(cid,750299)
queststatus = getPlayerStorageValue(cid,750199)
if queststatus2 == -1 then
if queststatus ~= -1 then
if pay(cid,10000) then
doPlayerAddBlessing(cid,2)
selfSay('Parabens, voce adquiriu a segunda Bless.')
setPlayerStorageValue(cid,750299,1)
else
selfSay('Desculpe, voce precisa de 10k.')
end
else
selfSay('Desculpe, voce precisa da primeira bless.')
end
else
selfSay('Desculpe, voce ja tem essa bless.')
end

elseif msgcontains(msg, 'bless3') then
queststatus3 = getPlayerStorageValue(cid,750399)
queststatus2 = getPlayerStorageValue(cid,750299)
if queststatus3 == -1 then
if queststatus2 ~= -1 then
if pay(cid,10000) then
doPlayerAddBlessing(cid,3)
selfSay('Parabens, voce adquiriu a terceira Bless.')
setPlayerStorageValue(cid,750399,1)
else
selfSay('Desculpe, voce precisa de 10k.')
end
else
selfSay('Desculpe, voce precisa da segunda bless.')
end
else
selfSay('Desculpe, voce ja tem essa bless.')
end

elseif msgcontains(msg, 'bless4') then
queststatus4 = getPlayerStorageValue(cid,750499)
queststatus3 = getPlayerStorageValue(cid,750399)
if queststatus4 == -1 then
if queststatus3 ~= -1 then
if pay(cid,20000) then
doPlayerAddBlessing(cid,4)
doPlayerAddBlessing(cid,5)
selfSay('Muito bom, agora voce tem todas as blesses .')
setPlayerStorageValue(cid,750499,1)
else
selfSay('Desculpe, voce precisa de 20k.')
end
else
selfSay('Desculpe, voce precisa da terceira bless.')
end
else
selfSay('Desculpe, voce ja tem essa bless.')
end

elseif msgcontains(msg, 'reset') then
queststatus4 = getPlayerStorageValue(cid,750499)
queststatus3 = getPlayerStorageValue(cid,750399)
queststatus2 = getPlayerStorageValue(cid,750299)
queststatus1 = getPlayerStorageValue(cid,750199)
setPlayerStorageValue(cid,750199,-1)
setPlayerStorageValue(cid,750299,-1)
setPlayerStorageValue(cid,750399,-1)
setPlayerStorageValue(cid,750499,-1)
selfSay('Agora voce pode comprar as bless novamente.')


elseif msgcontains(msg, 'bye') and focus == cid and getDistanceToCreature(cid) < 4 then
selfSay('Good bye, ' .. getCreatureName(cid) .. '!')
focus = 0
talk_start = 0
end
end
end


function onCreatureChangeOutfit(creature)

end

function onThink()

if (os.clock() - talk_start) > 20 then
if focus > 0 then
selfSay('...')
end
focus = 0
end
if focus ~= 0 then
if getDistanceToCreature(focus) > 5 then
selfSay('...')
focus = 0
end
end
end[/codebox]