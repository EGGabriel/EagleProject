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

shopModule:addBuyableItem({'spellbook'}, 2175, 1000, 'spellbook')

shopModule:addBuyableItem({'ultimate healing'}, 2273, 50, 1, 'ultimate healing rune')
shopModule:addBuyableItem({'magic wall'}, 2293, 50, 1, 'magic wall rune')
shopModule:addBuyableItem({'destroy field'}, 2261, 50, 1, 'destroy field rune')
shopModule:addBuyableItem({'great fireball'}, 2304, 50, 1, 'great fireball rune')
shopModule:addBuyableItem({'explosion'}, 2313, 50, 1, 'explosion rune')
shopModule:addBuyableItem({'sudden death'}, 2268, 50, 1, 'sudden death rune')
shopModule:addBuyableItem({'paralyze'}, 2278, 50, 1, 'paralyze rune')
shopModule:addBuyableItem({'mana rune'}, 2296, 50, 1, 'mana rune')
shopModule:addBuyableItem({'chameleon'}, 2291, 50, 1, 'chameleon rune')
shopModule:addBuyableItem({'avalanche'}, 2274, 50, 1, 'avalanche rune')
shopModule:addBuyableItem({'stone shower'}, 2288, 50, 1, 'stone shower rune')
shopModule:addBuyableItem({'wild growth rune'}, 2269, 50, 1, 'wild growth rune')

shopModule:addBuyableItem({'wand of dragonbreath'}, 2191, 1000, 1, 'wand of dragonbreath')
shopModule:addBuyableItem({'wand of decay'}, 2188, 5000, 1, 'wand of decay')
shopModule:addBuyableItem({'wand of draconia'}, 8921, 7500, 1, 'wand of draconia')
shopModule:addBuyableItem({'wand of cosmic energy'}, 2189, 10000, 1, 'wand of cosmic energy')
shopModule:addBuyableItem({'wand of inferno'}, 2187, 15000, 1, 'wand of inferno')

shopModule:addBuyableItem({'moonlight rod'}, 2186, 1000, 1, 'moonlight rod')
shopModule:addBuyableItem({'necrotic rod'}, 2185, 5000, 1, 'necrotic rod')
shopModule:addBuyableItem({'terra rod'}, 2181, 10000, 1, 'terra rod')
shopModule:addBuyableItem({'hailstorm rod'}, 2183, 15000, 1, 'hailstorm rod')

shopModule:addSellableItem({'dragonbreath'}, 2191, 1000, 'wand of dragonbreath')
shopModule:addSellableItem({'decay'}, 2188, 5000, 'wand of decay')
shopModule:addSellableItem({'draconia'}, 8921, 7500, 'wand of draconia')
shopModule:addSellableItem({'energy'}, 2189, 10000, 'wand of cosmic energy')
shopModule:addSellableItem({'inferno'}, 2187, 15000, 'wand of inferno')

shopModule:addSellableItem({'moonlight'}, 2186, 1000, 'moonlight rod')
shopModule:addSellableItem({'necrotic'}, 2185, 5000, 'necrotic rod')
shopModule:addSellableItem({'terra'}, 2181, 10000, 'terra rod')
shopModule:addSellableItem({'hailstorm'}, 2183, 15000, 'hailstorm rod')

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
