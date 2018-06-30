local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()					npcHandler:onThink()					end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({'spellbook'}, 2175, 150, 'spellbook')

shopModule:addBuyableItem({'instense healing'}, 2265, 95, 100, 'intense healing rune')
shopModule:addBuyableItem({'blank rune'}, 2260, 10, 1, 'blank rune')
shopModule:addBuyableItem({'ultimate healing'}, 2273, 1000, 100, 'ultimate healing rune')
shopModule:addBuyableItem({'magic wall'}, 2293, 1500, 100, 'magic wall rune')
shopModule:addBuyableItem({'destroy field'}, 2261, 45, 100, 'destroy field rune')
shopModule:addBuyableItem({'heavy magic missile'}, 2311, 120, 100, 'heavy magic missile rune')
shopModule:addBuyableItem({'great fireball'}, 2304, 180, 25, 'great fireball rune')
shopModule:addBuyableItem({'explosion'}, 2313, 250, 100, 'explosion rune')
shopModule:addBuyableItem({'sudden death'}, 2268, 1500, 100, 'sudden death rune')
shopModule:addBuyableItem({'paralyze'}, 2278, 1500, 100, 'paralyze rune')
shopModule:addBuyableItem({'premium mana rune'}, 2294, 2000, 100, 'premium mana rune')
shopModule:addBuyableItem({'chameleon'}, 2291, 210, 100, 'chameleon rune')
shopModule:addBuyableItem({'icicle'}, 2271, 100,  100, 'icicle rune')
shopModule:addBuyableItem({'avalanche'}, 2274, 100,  100, 'avalanche rune')
shopModule:addBuyableItem({'stone shower'}, 2288, 100,  100, 'stone shower rune')

shopModule:addBuyableItem({'wand of dragonbreath', 'dragonbreath'}, 2191, 1000, 'wand of dragonbreath')
shopModule:addBuyableItem({'wand of decay', 'decay'}, 2188, 5000, 'wand of decay')
shopModule:addBuyableItem({'wand of draconia', 'draconia'}, 8921, 7500, 'wand of draconia')
shopModule:addBuyableItem({'wand of cosmic energy', 'cosmic energy'}, 2189, 10000, 'wand of cosmic energy')
shopModule:addBuyableItem({'wand of inferno', 'inferno'}, 2187, 15000, 'wand of inferno')

shopModule:addBuyableItem({'moonlight rod', 'moonlight'}, 2186, 1000, 'moonlight rod')
shopModule:addBuyableItem({'necrotic rod', 'necrotic'}, 2185, 5000, 'necrotic rod')
shopModule:addBuyableItem({'terra rod', 'terra'}, 2181, 10000, 'terra rod')
shopModule:addBuyableItem({'hailstorm rod', 'hailstorm'}, 2183, 15000, 'hailstorm rod')

shopModule:addSellableItem({'wand of dragonbreath', 'dragonbreath'}, 2191, 500, 'wand of dragonbreath')
shopModule:addSellableItem({'wand of decay', 'decay'}, 2188, 2500, 'wand of decay')
shopModule:addSellableItem({'wand of draconia', 'draconia'}, 8921, 3750, 'wand of draconia')
shopModule:addSellableItem({'wand of cosmic energy', 'cosmic energy'}, 2189, 5000, 'wand of cosmic energy')
shopModule:addSellableItem({'wand of inferno', 'inferno'},2187, 7500, 'wand of inferno')

shopModule:addSellableItem({'moonlight rod', 'moonlight'}, 2186, 500,   'moonlight rod')
shopModule:addSellableItem({'volcanic rod', 'volcanic'}, 2185, 2500, 'volcanic rod')
shopModule:addSellableItem({'quagmire rod', 'quagmire'}, 2181, 5000, 'quagmire rod')
shopModule:addSellableItem({'tempest rod', 'tempest'}, 2183, 7500, 'tempest rod')

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
