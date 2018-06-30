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
  		selfSay('Hello ' .. creatureGetName(cid) .. '! I sell crossbows (200gps), bows (100gps), arrows (30gps), bolts (50gps), earth arrow (50gps), flash arrow (50gps), sniper arrow (50gps), piercing bolt (60gps), flaming arrow (50gps), shiver arrow (50gps), onyx arrow (50gps), viper star (100gps) and spears (20gps).')
  		focus = cid
  		talk_start = os.clock()

  	elseif msgcontains(msg, 'hi') and (focus ~= cid) and getDistanceToCreature(cid) < 4 then
  		selfSay('Sorry, ' .. creatureGetName(cid) .. '! I talk to you in a minute.')

  	elseif focus == cid then
		talk_start = os.clock()

		if msgcontains(msg, 'crossbow') then
			buy(cid,2455,getCount(msg),200)
		elseif msgcontains(msg, 'bow') then
			buy(cid,2456,getCount(msg),100)
		elseif msgcontains(msg, 'arrows') then
			buy(cid,2544,getCount(msg),30)
		elseif msgcontains(msg, 'bolts') then
			buy(cid,2543,getCount(msg),50)
		elseif msgcontains(msg, 'spears') then
			buy(cid,2389,getCount(msg),20)
		elseif msgcontains(msg, 'earth arrow') then
			buy(cid,7850,getCount(msg),50)
		elseif msgcontains(msg, 'flash arrow') then
			buy(cid,7838,getCount(msg),50)
		elseif msgcontains(msg, 'sniper arrow') then
			buy(cid,7364,getCount(msg),50)
		elseif msgcontains(msg, 'piercing bolt') then
			buy(cid,7363,getCount(msg),60)
		elseif msgcontains(msg, 'flaming arrow') then
			buy(cid,7840,getCount(msg),50)
		elseif msgcontains(msg, 'shiver arrow') then
			buy(cid,7839,getCount(msg),50)
		elseif msgcontains(msg, 'onyx arrow') then
			buy(cid,7365,getCount(msg),50)
		elseif msgcontains(msg, 'viper star') then
			buy(cid,7366,getCount(msg),100)

		elseif msgcontains(msg, 'bye') and focus == cid and getDistanceToCreature(cid) < 4 then
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
