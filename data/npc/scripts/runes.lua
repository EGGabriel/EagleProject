local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)				
npcHandler:onCreatureAppear(cid)			
end
function onCreatureDisappear(cid) 			
npcHandler:onCreatureDisappear(cid)			
end
function onCreatureSay(cid, type, msg)			
npcHandler:onCreatureSay(cid, type, msg)		
end
function onThink()					
npcHandler:onThink()					
end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItemContainer({'bp ultimate healing'}, 10519, 2273, 300000, 100, 'backpack of ultimate healing rune')
shopModule:addBuyableItemContainer({'bp ultimate healing rune'}, 10519, 2273, 300000, 100, 'backpack of ultimate healing rune')
shopModule:addBuyableItemContainer({'bp magic wall'}, 10519, 2293, 300000, 100, 'backpack of magic wall rune')
shopModule:addBuyableItemContainer({'bp mw'}, 10519, 2293, 300000, 100, 'backpack of magic wall rune')
shopModule:addBuyableItemContainer({'bp destroy field'}, 10519, 2261, 200000, 100, 'backpack of destroy field rune')
shopModule:addBuyableItemContainer({'bp df'}, 10519, 2261, 200000, 100, 'backpack of destroy field rune')
shopModule:addBuyableItemContainer({'bp great fireball'}, 10519, 2304, 60000, 100, 'backpack of great fireball rune')
shopModule:addBuyableItemContainer({'bp gfb'}, 10519, 2304, 60000, 100, 'backpack of great fireball rune')
shopModule:addBuyableItemContainer({'bp explosion'}, 10519, 2313, 100000, 100, 'backpack of explosion rune')
shopModule:addBuyableItemContainer({'bp sudden death'}, 10519, 2268, 160000, 100, 'backpack of sudden death rune')
shopModule:addBuyableItemContainer({'bp sd'}, 10519, 2268, 160000, 100, 'backpack of sudden death rune')
shopModule:addBuyableItemContainer({'bp paralyze'}, 10519, 2278, 300000, 100, 'backpack of paralyze rune')
shopModule:addBuyableItemContainer({'bp avalanche'}, 10519, 2274, 60000, 100, 'backpack of avalanche rune')
shopModule:addBuyableItemContainer({'bp wild growth'}, 10519, 2269, 200000, 100, 'backpack of wild growth rune')
shopModule:addBuyableItemContainer({'bp wg'}, 10519, 2269, 200000, 100, 'backpack of wild growth rune')
shopModule:addBuyableItemContainer({'bp chameleon'}, 10519, 2291, 420000, 100, 'backpack of chameleon rune')
shopModule:addBuyableItemContainer({'bp uhp'}, 10519, 8473, 300000, 100, 'backpack of ultimate healing potions')
shopModule:addBuyableItemContainer({'bp ultimate healing potion'}, 10519, 8473, 300000, 100, 'backpack of ultimate healing potions')
shopModule:addBuyableItemContainer({'bp gsp'}, 10519, 8472, 240000, 100, 'backpack of great spirit potions')
shopModule:addBuyableItemContainer({'bp spirit potion'}, 10519, 8472, 360000, 100, 'backpack of great spirit potions')
shopModule:addBuyableItemContainer({'bp great spirit potion'}, 10519, 8472, 360000, 100, 'backpack of great spirit potions')
shopModule:addBuyableItemContainer({'bp shp'}, 10519, 7588, 100000, 100, 'backpack of strong health potions')
shopModule:addBuyableItemContainer({'bp smp'}, 10519, 7589, 100000, 100, 'backpack of strong mana potions')
shopModule:addBuyableItemContainer({'bp gmp'}, 10519, 7590, 200000, 100, 'backpack of great mana potions')
shopModule:addBuyableItemContainer({'bp ghp'}, 10519, 7591, 160000, 100, 'backpack of great health potions')
shopModule:addBuyableItemContainer({'bp mp'}, 10519, 7620, 60000, 100, 'backpack of mana potions')
shopModule:addBuyableItemContainer({'bp mana potion'}, 10519, 7620, 60000, 100, 'backpack of mana potions')
shopModule:addBuyableItemContainer({'bp mana rune'}, 10519, 2296, 300000, 100, 'backpack of mana rune')
shopModule:addBuyableItemContainer({'bp mr'}, 10519, 2296, 300000, 100, 'backpack of mana rune')

shopModule:addBuyableItem({'wild growth'}, 2269, 100, 1, 'wild growth rune')
shopModule:addBuyableItem({'mana'}, 2296, 150, 1, 'mana rune')
shopModule:addBuyableItem({'ultimate healing'}, 2273, 150, 1, 'ultimate healing rune')
shopModule:addBuyableItem({'magic wall'}, 2293, 150, 1, 'magic wall rune')
shopModule:addBuyableItem({'destroy field'}, 2261, 100, 1, 'destroy field rune')
shopModule:addBuyableItem({'great fireball'}, 2304, 30, 1, 'great fireball rune')
shopModule:addBuyableItem({'explosion'}, 2313, 50, 1, 'explosion rune')
shopModule:addBuyableItem({'sudden death'}, 2268, 80, 1, 'sudden death rune')
shopModule:addBuyableItem({'paralyze'}, 2278, 150, 1, 'paralyze rune')
shopModule:addBuyableItem({'chameleon'}, 2291, 210, 1, 'chameleon rune')
shopModule:addBuyableItem({'avalanche'}, 2274, 30,  1, 'avalanche rune')

shopModule:addBuyableItem({'uhp'}, 8473, 150,  1, 'ultimate healing potion')
shopModule:addBuyableItem({'gsp'}, 8472, 180,  1, 'great spirit potion')
shopModule:addBuyableItem({'shp'}, 7588, 50,  1, 'strong health potion')
shopModule:addBuyableItem({'smp'}, 7589, 50,  1, 'strong mana potion')
shopModule:addBuyableItem({'gmp'}, 7590, 100,  1, 'great mana potion')
shopModule:addBuyableItem({'ghp'}, 7591, 80,  1, 'great health potion')
shopModule:addBuyableItem({'mp'}, 7620, 30,  1, 'mana potion')

shopModule:addBuyableItem({'decay'}, 2188, 3500, 1, 'wand of decay')
shopModule:addBuyableItem({'draconia'}, 8921, 3500, 1, 'wand of draconia')
shopModule:addBuyableItem({'cosmic energy'}, 2189, 5000, 1, 'wand of cosmic energy')
shopModule:addBuyableItem({'inferno'}, 2187, 15000, 1, 'wand of inferno')
shopModule:addBuyableItem({'voodoo'},8922, 20000, 1, 'wand of voodoo')

shopModule:addBuyableItem({'moonlight'}, 2186, 1000, 1, 'moonlight rod')
shopModule:addBuyableItem({'necrotic'}, 2185, 2500, 1, 'necrotic rod')
shopModule:addBuyableItem({'terra'}, 2181, 3500, 1, 'terra rod')
shopModule:addBuyableItem({'hailstorm'}, 2183, 15000, 1, 'hailstorm rod')
shopModule:addBuyableItem({'underworld'}, 8910, 20000, 1, 'underworld rod')

shopModule:addSellableItem({'epgf'}, 7636, 15, 'empty potion flask')
shopModule:addSellableItem({'epsf'}, 7634, 22, 'empty potion flask')
shopModule:addSellableItem({'epuf'}, 7635, 30, 'empty potion flask')

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end

	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	local items = {[1] = 2190, [2] = 2182, [5] = 2190, [6] = 2182}

	if(msgcontains(msg, 'first rod') or msgcontains(msg, 'first wand')) then
		if(isSorcerer(cid) or isDruid(cid)) then
			if(getPlayerStorageValue(cid, 30002) == -1) then
				selfSay('So you ask me for a {' .. getItemNameById(items[getPlayerVocation(cid)]) .. '} to begin your advanture?', cid)
				talkState[talkUser] = 1
			else
				selfSay('What? I have already gave you one {' .. getItemNameById(items[getPlayerVocation(cid)]) .. '}!', cid)
			end
		else
			selfSay('Sorry, you aren\'t a druid either a sorcerer.', cid)
		end
	elseif(msgcontains(msg, 'yes')) then
		if(talkState[talkUser] == 1) then
			doPlayerAddItem(cid, items[getPlayerVocation(cid)], 1)
			selfSay('Here you are young adept, take care yourself.', cid)
			setPlayerStorageValue(cid, 30002, 1)
		end
		talkState[talkUser] = 0
	elseif(msgcontains(msg, 'no') and isInArray({1}, talkState[talkUser]) == TRUE) then
		selfSay('Ok then.', cid)
		talkState[talkUser] = 0
	end

	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
