-- Módulos padrão
-------------------------
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()						npcHandler:onThink()						end
-------------------------
-- / Módulos padrão


-- Parte editável
---------------------

local shopModule = ShopModule:new() 
npcHandler:addModule(shopModule) 

shopModule:addBuyableItem({'bow'}, 2456, 400, 'bow') 
shopModule:addBuyableItem({'crossbow'}, 2455, 500, 'crossbow') 

shopModule:addSellableItem({'crossbow'}, 2455, 180, 'crossbow') 

shopModule:addBuyableItem({'spear'}, 2389, 10, 'spear')
shopModule:addBuyableItem({'royal spear'}, 7378, 25, 'royal spear') 

shopModule:addBuyableItem({'arrow'}, 2544, 3, 'arrow')

shopModule:addBuyableItem({'bolt'}, 2543, 4, 'bolt')
shopModule:addBuyableItem({'power bolt'}, 2547, 7, 'power bolt')

-----------------------
-- / Parte editável
npcHandler:addModule(FocusModule:new())
