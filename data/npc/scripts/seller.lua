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
  		selfSay('Hello, ' .. creatureGetName(cid) .. '! I sell ropes (50gp), shovels (20gp), backpacks (30gp), fishing rods (100gp), amulet of loss (50k), obsidian knife (6k), blessed wooden stake (5k) and torches (2gp). I buy vials (10gp).')
  		focus = cid
  		talk_start = os.clock()

  	elseif msgcontains(msg, 'hi') and (focus ~= cid) and getDistanceToCreature(cid) < 4 then
  		selfSay('Sorry, ' .. creatureGetName(cid) .. '! I talk to you in a minute.')

	elseif focus == cid then
		talk_start = os.clock()

		if msgcontains(msg, 'shovel') then
			buy(cid,2554,getCount(msg),20)
		elseif msgcontains(msg, 'rope') then
			buy(cid,2120,getCount(msg),40)
		elseif msgcontains(msg, 'fishing rod') then
			buy(cid,2580,getCount(msg),100)
		elseif msgcontains(msg, 'torch') then
			buy(cid,2050,getCount(msg),2)
		elseif msgcontains(msg, 'aol') then
			buy(cid,2173,getCount(msg),50000)
		elseif msgcontains(msg, 'obsidian knife') then
			buy(cid,5908,getCount(msg),6000)
		elseif msgcontains(msg, 'blessed wooden stake') then
			buy(cid,5942,getCount(msg),5000)
		elseif msgcontains(msg, 'vial') or msgcontains(msg, 'flask') then
			sell(cid,2006,getCount(msg),10)
end
		if msgcontains(msg, 'backpack') then
		selfSay('What color/type do you want? I have brown, green, yellow, red, purple, blue, grey, golden, fur, camouflage and beach.')

		elseif msgcontains(msg, 'brown') then
			buy(cid,1988,getCount(msg),30)

		elseif msgcontains(msg, 'green') then
			buy(cid,1998,getCount(msg),30)

		elseif msgcontains(msg, 'yellow') then
			buy(cid,1999,getCount(msg),30)

		elseif msgcontains(msg, 'red') then
			buy(cid,2000,getCount(msg),30)

		elseif msgcontains(msg, 'purple') then
			buy(cid,2001,getCount(msg),30)

		elseif msgcontains(msg, 'blue') then
			buy(cid,2002,getCount(msg),30)

		elseif msgcontains(msg, 'grey') then
			buy(cid,2003,getCount(msg),30)

		elseif msgcontains(msg, 'golden') then
			buy(cid,2004,getCount(msg),30)

		elseif msgcontains(msg, 'fur') then
			buy(cid,7342,getCount(msg),30)

		elseif msgcontains(msg, 'camouflage') then
			buy(cid,3940,getCount(msg),30)

		elseif msgcontains(msg, 'beach') then
			buy(cid,5949,getCount(msg),30)



		elseif msgcontains(msg, 'bye') and getDistanceToCreature(cid) < 4 then
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
 			selfSay('If you need, you ca... <too far away>.')
 			focus = 0
 		end
 	end
end