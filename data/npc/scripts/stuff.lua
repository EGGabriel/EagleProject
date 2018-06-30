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

shopModule:addBuyableItem({'fishing rod'}, 2580, 1000, 1, 'fishing rod')
shopModule:addBuyableItem({'worm'}, 3976, 100, 1, 'worm')
shopModule:addBuyableItem({'ring of healing'}, 2214, 10000, 1, 'ring of healing')
shopModule:addBuyableItem({'brown mushroom'}, 2789, 100, 1, 'brown mushroom')


shopModule:addSellableItem({'shrimp'}, 2670, 400, 'shrimp')
shopModule:addSellableItem({'fish fin'}, 5895, 5000, 'fish fin')
shopModule:addSellableItem({'northen pike'}, 2669, 35000, 'northen pike')
shopModule:addSellableItem({'green perch'}, 7159, 70000, 'green perch')
shopModule:addSellableItem({'rainbow trout'}, 7158, 210000, 'rainbow trout')

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
