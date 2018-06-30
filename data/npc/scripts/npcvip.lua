local focus = 0
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
if (msgcontains(msg, 'hi') and focus == 0) and getDistanceToCreature(cid) < 4 then
selfSay('Ola ' .. getCreatureName(cid) .. '! Eu vendo Slayer Promotion e itens vips: Para Mages(Magician mask,coat,legs).Para Kina e Pally (Blessed helmet,armor,legs).E Slayer Boots,Blade,Axe,Punch,Crossbow,Staff,Shield,Medal,Bag,Backpack.')
focus = cid
talk_start = os.clock()
elseif msgcontains(msg, 'hi') and (focus ~= cid) and getDistanceToCreature(cid) < 4 then
selfSay('Sorry, ' .. getCreatureName(cid) .. '! I talk with you in one minute.')

		elseif msgcontains(msg, 'slayer promotion') or msgcontains(msg, 'slayerpromotion') then
 			if getPlayerVocation(cid) > 8 then
 				selfSay('Desculpe, voce ja tem Slayer promotion.')
 				talk_state = 0
 			elseif getPlayerLevel(cid) < 130 then
				selfSay('Voce precisa ter no minimo level 130...')
				talk_state = 0
			else
				selfSay('Voce quer ser Slayer Promotion por 10 Slayer Coins?')
				talk_state = 1
			end
		elseif talk_state == 1 then
if getPlayerItemCount(cid,2157) >= 10 then
if doPlayerRemoveItem(cid,2157,10) then
if getPlayerVocation(cid) > 8 then
end
selfSay('Parabens! Voce adquiriu a Slayer Promotion!')
doPlayerSetVocation(cid, getPlayerVocation(cid)+4)
doTeleportThing(cid,{x=160, y=54, z=4})
end
else
selfSay('Desculpe, voce nao tem os itens necessarios!')
end
			talk_state = 0


elseif msgcontains(msg, 'magician mask') then
selfSay('Voce tem os 30 Slayer Coins para comprar 1 Magician Mask?')
talk_state = 17
talk_start = os.clock()
elseif talk_state == 17 and msgcontains(msg, 'yes') then
if getPlayerItemCount(cid,2157) >= 30 then
if doPlayerRemoveItem(cid,2157,30) then
selfSay('Parabens! Voce adquiriu um item Vip!')
doPlayerAddItem(cid,9778,1)
end
else
selfSay('Desculpe, voce nao tem os itens necessarios!')
end

elseif msgcontains(msg, 'magician coat') then
selfSay('Voce tem os 30 Slayer Coins para comprar 1 Magician Coat?')
talk_state = 2
talk_start = os.clock()
elseif talk_state == 2 and msgcontains(msg, 'yes') then
if getPlayerItemCount(cid,2157) >= 30 then
if doPlayerRemoveItem(cid,2157,30) then
selfSay('Parabens! Voce adquiriu um item Vip!')
doPlayerAddItem(cid,9776,1)
end
else
selfSay('Desculpe, voce nao tem os itens necessarios!')
end

elseif msgcontains(msg, 'magician legs') then
selfSay('Voce tem os 30 Slayer Coins para comprar 1 Magician Legs?')
talk_state = 3
talk_start = os.clock()
elseif talk_state == 3 and msgcontains(msg, 'yes') then
if getPlayerItemCount(cid,2157) >= 30 then
if doPlayerRemoveItem(cid,2157,30) then
selfSay('Parabens! Voce adquiriu um item Vip!')
doPlayerAddItem(cid,9777,1)
end
else
selfSay('Desculpe, voce nao tem os itens necessarios!')
end

elseif msgcontains(msg, 'blessed helmet') then
selfSay('Voce tem os 30 Slayer Coins para comprar 1 Blessed Helmet?')
talk_state = 4
talk_start = os.clock()
elseif talk_state == 4 and msgcontains(msg, 'yes') then
if getPlayerItemCount(cid,2157) >= 30 then
if doPlayerRemoveItem(cid,2157,30) then
selfSay('Parabens! Voce adquiriu um item Vip!')
doPlayerAddItem(cid,2474,1)
end
else
selfSay('Desculpe, voce nao tem os itens necessarios!')
end

elseif msgcontains(msg, 'blessed armor') then
selfSay('Voce tem os 30 Slayer Coins para comprar 1 Blessed Armor?')
talk_state = 5
talk_start = os.clock()
elseif talk_state == 5 and msgcontains(msg, 'yes') then
if getPlayerItemCount(cid,2157) >= 30 then
if doPlayerRemoveItem(cid,2157,30) then
selfSay('Parabens! Voce adquiriu um item Vip!')
doPlayerAddItem(cid,2503,1)
end
else
selfSay('Desculpe, voce nao tem os itens necessarios!')
end

elseif msgcontains(msg, 'blessed legs') then
selfSay('Voce tem os 30 Slayer Coins para comprar 1 Blessed Legs?')
talk_state = 6
talk_start = os.clock()
elseif talk_state == 6 and msgcontains(msg, 'yes') then
if getPlayerItemCount(cid,2157) >= 30 then
if doPlayerRemoveItem(cid,2157,30) then
selfSay('Parabens! Voce adquiriu um item Vip!')
doPlayerAddItem(cid,2504,1)
end
else
selfSay('Desculpe, voce nao tem os itens necessarios!')
end

elseif msgcontains(msg, 'slayer boots') then
selfSay('Voce tem os 20 Slayer Coins para comprar 1 Slayer Boots?')
talk_state = 7
talk_start = os.clock()
elseif talk_state == 7 and msgcontains(msg, 'yes') then
if getPlayerItemCount(cid,2157) >= 20 then
if doPlayerRemoveItem(cid,2157,20) then
selfSay('Parabens! Voce adquiriu um item Vip!')
doPlayerAddItem(cid,9933,1)
end
else
selfSay('Desculpe, voce nao tem os itens necessarios!')
end

elseif msgcontains(msg, 'slayer blade') then
selfSay('Voce tem os 50 Slayer Coins para comprar 1 Slayer Blade?')
talk_state = 8
talk_start = os.clock()
elseif talk_state == 8 and msgcontains(msg, 'yes') then
if getPlayerItemCount(cid,2157) >= 50 then
if doPlayerRemoveItem(cid,2157,50) then
selfSay('Parabens! Voce adquiriu um item Vip!')
doPlayerAddItem(cid,8931,1)
end
else
selfSay('Desculpe, voce nao tem os itens necessarios!')
end

elseif msgcontains(msg, 'slayer axe') then
selfSay('Voce tem os 50 Slayer Coins para comprar 1 Slayer Axe?')
talk_state = 9
talk_start = os.clock()
elseif talk_state == 9 and msgcontains(msg, 'yes') then
if getPlayerItemCount(cid,2157) >= 50 then
if doPlayerRemoveItem(cid,2157,50) then
selfSay('Parabens! Voce adquiriu um item Vip!')
doPlayerAddItem(cid,8293,1)
end
else
selfSay('Desculpe, voce nao tem os itens necessarios!')
end

elseif msgcontains(msg, 'slayer punch') then
selfSay('Voce tem os 50 Slayer Coins para comprar 1 Slayer Punch?')
talk_state = 10
talk_start = os.clock()
elseif talk_state == 10 and msgcontains(msg, 'yes') then
if getPlayerItemCount(cid,2157) >= 50 then
if doPlayerRemoveItem(cid,2157,50) then
selfSay('Parabens! Voce adquiriu um item Vip!')
doPlayerAddItem(cid,8929,1)
end
else
selfSay('Desculpe, voce nao tem os itens necessarios!')
end

elseif msgcontains(msg, 'slayer crossbow') then
selfSay('Voce tem os 50 Slayer Coins para comprar 1 Slayer Crossbow?')
talk_state = 11
talk_start = os.clock()
elseif talk_state == 11 and msgcontains(msg, 'yes') then
if getPlayerItemCount(cid,2157) >= 50 then
if doPlayerRemoveItem(cid,2157,50) then
selfSay('Parabens! Voce adquiriu um item Vip!')
doPlayerAddItem(cid,8851,1)
end
else
selfSay('Desculpe, voce nao tem os itens necessarios!')
end

elseif msgcontains(msg, 'slayer staff') then
selfSay('Voce tem os 50 Slayer Coins para comprar 1 Slayer Staff?')
talk_state = 12
talk_start = os.clock()
elseif talk_state == 12 and msgcontains(msg, 'yes') then
if getPlayerItemCount(cid,2157) >= 50 then
if doPlayerRemoveItem(cid,2157,50) then
selfSay('Parabens! Voce adquiriu um item Vip!')
doPlayerAddItem(cid,7424,1)
end
else
selfSay('Desculpe, voce nao tem os itens necessarios!')
end

elseif msgcontains(msg, 'slayer shield') then
selfSay('Voce tem os 25 Slayer Coins para comprar 1 Slayer Shield?')
talk_state = 13
talk_start = os.clock()
elseif talk_state == 13 and msgcontains(msg, 'yes') then
if getPlayerItemCount(cid,2157) >= 25 then
if doPlayerRemoveItem(cid,2157,25) then
selfSay('Parabens! Voce adquiriu um item Vip!')
doPlayerAddItem(cid,6391,1)
end
else
selfSay('Desculpe, voce nao tem os itens necessarios!')
end

elseif msgcontains(msg, 'slayer medal') then
selfSay('Voce tem os 50 Slayer Coins para comprar 1 Slayer Medal?')
talk_state = 14
talk_start = os.clock()
elseif talk_state == 14 and msgcontains(msg, 'yes') then
if getPlayerItemCount(cid,2157) >= 50 then
if doPlayerRemoveItem(cid,2157,50) then
selfSay('Parabens! Voce adquiriu um item Vip!')
doPlayerAddItem(cid,8979,1)
end
else
selfSay('Desculpe, voce nao tem os itens necessarios!')
end

elseif msgcontains(msg, 'slayer backpack') then
selfSay('Voce tem os 1 Slayer Coins para comprar 1 Slayer BackPack?')
talk_state = 15
talk_start = os.clock()
elseif talk_state == 15 and msgcontains(msg, 'yes') then
if getPlayerItemCount(cid,2157) >= 1 then
if doPlayerRemoveItem(cid,2157,1) then
selfSay('Parabens! Voce adquiriu um item Vip!')
doPlayerAddItem(cid,9774,1)
end
else
selfSay('Desculpe, voce nao tem os itens necessarios!')
end

elseif msgcontains(msg, 'slayer bag') then
selfSay('Voce tem os 1 Slayer Coins para comprar 1 Slayer Bag?')
talk_state = 16
talk_start = os.clock()
elseif talk_state == 16 and msgcontains(msg, 'yes') then
if getPlayerItemCount(cid,2157) >= 1 then
if doPlayerRemoveItem(cid,2157,1) then
selfSay('Parabens! Voce adquiriu um item Vip!')
doPlayerAddItem(cid,9775,1)
end
else
selfSay('Desculpe, voce nao tem os itens necessarios!')
end

   elseif msgcontains(msg, 'bye') and getDistanceToCreature(cid) < 4 then
            selfSay('Bye ' .. getCreatureName(cid) .. ', Come back.')
            focus = 0
            talk_start = 0
        elseif msgcontains(msg, 'kashsauahsuacuyio') then
            selfSay('What?')
            talk_state = 0
        end
end
function onCreatureChangeOutfit(creature)
end
function onThink()
    doNpcSetCreatureFocus(focus)
    if (os.clock() - talk_start) > 30 then
        if focus > 0 then
            selfSay('Next...')
        end
        focus = 0
        talk_start = 0
    end
    if focus ~= 0 then
        if getDistanceToCreature(focus) > 5 then
            selfSay('Good Bye')
            focus = 0
            talk_start = 0
        end
    end
end