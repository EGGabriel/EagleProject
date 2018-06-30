local focus = 0
local talk_start = 0
local talk_state = 0
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

if (msgcontains(msg, 'hi') and focus == 0) and getDistanceToCreature(cid) < 4 then
selfSay('Hello ' .. creatureGetName(cid) .. '! I sell masquerade costumes.')
focus = cid
talk_start = os.clock()

elseif msgcontains(msg, 'hi') and (focus ~= cid) and getDistanceToCreature(cid) < 4 then
selfSay('Sorry, ' .. creatureGetName(cid) .. '! I talk to you in a minute.')

elseif focus == cid then
talk_start = os.clock()

if msgcontains(msg, 'deluxe costume') then
selfSay('Do you want to buy deluxe costume for 1500 gps?')
talk_state = 1

elseif msgcontains(msg, 'uncommon costume') then
selfSay('Do you want to buy uncommon costume for 1000 gps?')
talk_state = 2

elseif msgcontains(msg, 'common costume') then
selfSay('Do you want to buy common costume for 500 gps?')
talk_state = 3

elseif msg == 'costume' or msg == 'costumes' then
selfSay('I sell Deluxe Costume (1500gps), Uncommon Costume (1000 gps) and Commom Costume (500 gps)')
selfSay('I sell also Party Hats (600gps) and Party Trumpets (80 gps)')
talk_start = os.clock()

elseif msgcontains(msg, 'party hat') then
selfSay('Do you want to buy party hat for 600 gps?')
talk_state = 4

elseif msgcontains(msg, 'party trumpet') then
selfSay('Do you want to buy party trumpet for 80 gps?')
talk_state = 5

elseif msgcontains(msg, 'bye') and getDistanceToCreature(cid) < 4 then
selfSay('Good bye, ' .. creatureGetName(cid) .. '!')
focus = 0
talk_start = 0
talk_state = 0

elseif msgcontains(msg, 'yes') and talk_state == 1 then
if doPlayerRemoveMoney(cid,1500) == TRUE then
bag = doPlayerAddItem(cid, 1997, 1)
doSetItemActionId(bag,3001)
talk_state = 0
talk_start = os.clock()
else
selfSay('Sorry, you don\'t have money.')
end
talk_state = 0

elseif msgcontains(msg, 'yes') and talk_state == 2 then
if doPlayerRemoveMoney(cid,1000) == TRUE then
bag = doPlayerAddItem(cid, 1996, 1)
doSetItemActionId(bag,3002)
talk_start = os.clock()
else
selfSay('Sorry, you don\'t have money.')
end
talk_state = 0

elseif msgcontains(msg, 'yes') and talk_state == 3 then
if doPlayerRemoveMoney(cid,500) == TRUE then
bag = doPlayerAddItem(cid, 1994, 1)
doSetItemActionId(bag,3003)
talk_start = os.clock()
else
selfSay('Sorry, you don\'t have money.')
end
talk_state = 0

elseif msgcontains(msg, 'yes') and talk_state == 4 then
buy(cid,6578,1,600)
talk_start = os.clock()
talk_state = 0

elseif msgcontains(msg, 'yes') and talk_state == 5 then
buy(cid,6572,1,80)
talk_start = os.clock()
talk_state = 0
end
end
end

function onCreatureChangeOutfit(creature)
end

function onThink()
doNpcSetCreatureFocus(focus)
if (os.clock() - talk_start) > 30 then
if focus > 0 then
selfSay('Next Please...')
end
focus = 0
end
if focus ~= 0 then
if getDistanceToCreature(focus) > 5 then
selfSay('Good bye then.')
focus = 0
end
end
end