-- Walking --

max_x = 1 -- change the max x here. Means the NPC wont walk more to east or west as the number which is set here.

max_y = 1 --change the max y here. Means the NPC wont walk more to north or south as the number which is set here.

current_x = 0 --do nothing change here

current_y = 0 --do nothing change here

max_x = max_x - 1 --do nothing change here

max_y = max_y - 1 --do nothing change here

-- End Walking--

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

  	if (msgcontains(msg, 'hi') and (focus == 0)) and getDistanceToCreature(cid) < 4 then
  		selfSay('Hello ' .. creatureGetName(cid) .. '! I sell Gems, Big Gems and Misc Decoration!')
  		focus = cid
  		talk_start = os.clock()

  	elseif msgcontains(msg, 'hi') and (focus ~= cid) and getDistanceToCreature(cid) < 4 then
  		selfSay('Sorry, ' .. creatureGetName(cid) .. '! I talk to you in a minute.')

	elseif focus == cid then
		talk_start = os.clock()

		if msgcontains(msg, 'big gems') then
			selfSay('I sell Violet (1k), Yellow (1k), Green (1k), Red (1k) and Blue Gems (1k).')
		elseif msgcontains(msg, 'misc') then
			selfSay('I sell Blood Herbs (1k), 100 Coconuts (5k), 100 Snowballs (10k), 100 Gold Nuggets (10k), and Teddy Bears (10k).')
		elseif msgcontains(msg, 'gems') then
			selfSay('I sell 100 Talons (5k), 100 Small Rubies (5k), 100 Small Emeralds (5k), 100 Small Diamonds (5k), 100 Small Amethysts (5k), 100 Small Sapphires (5k), 100 Black Pearls (5k) and 100 White Pearls (5k).')

		elseif msgcontains(msg, 'violet') then
			buy(cid,2153,1,1000)
		elseif msgcontains(msg, 'yellow') then
			buy(cid,2154,1,1000)
		elseif msgcontains(msg, 'green') then
			buy(cid,2155,1,1000)
		elseif msgcontains(msg, 'red') then
			buy(cid,2156,1,1000)
		elseif msgcontains(msg, 'blue') then
			buy(cid,2158,1,1000)

		elseif msgcontains(msg, 'blood herb') then
			buy(cid,2798,1,1000)
		elseif msgcontains(msg, 'coconuts') then
			buy(cid,2678,100,5000)
		elseif msgcontains(msg, 'snowballs') then
			buy(cid,2111,100,10000)
		elseif msgcontains(msg, 'teddy bear') then
			buy(cid,2326,1,10000)
		elseif msgcontains(msg, 'nuggets') then
			buy(cid,2157,100,10000)

		elseif msgcontains(msg, 'small rubies') then
			buy(cid,2147,100,5000)
		elseif msgcontains(msg, 'small emeralds') then
			buy(cid,2149,100,5000)
		elseif msgcontains(msg, 'small diamonds') then
			buy(cid,2145,100,5000)
		elseif msgcontains(msg, 'small sapphires') then
			buy(cid,2146,100,5000)
		elseif msgcontains(msg, 'small amethysts') then
			buy(cid,2150,100,5000)
		elseif msgcontains(msg, 'talons') then
			buy(cid,2151,100,5000)
		elseif msgcontains(msg, 'black pearls') then
			buy(cid,2144,100,5000)
		elseif msgcontains(msg, 'white pearls') then
			buy(cid,2143,100,5000)
		
		
		elseif string.find(msg, '(%a*)bye(%a*)') and getDistanceToCreature(cid) < 4 then
			selfSay('Good bye, ' .. creatureGetName(cid) .. '!')
			focus = 0
			talk_start = 0
		end
	end
end


function onCreatureChangeOutfit(creature)

end


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
