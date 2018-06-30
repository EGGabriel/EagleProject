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

shopModule:addSellableItem({'white pearl'}, 2143, 160, 'white pearl')
shopModule:addSellableItem({'black pearl'}, 2144, 280, 'black pearl')
shopModule:addSellableItem({'small diamond'}, 2145, 300, 'small diamond')
shopModule:addSellableItem({'small shapphire'}, 2146, 250, 'small shapphire')
shopModule:addSellableItem({'small ruby'}, 2147, 250, 'small ruby')
shopModule:addSellableItem({'small emerald'}, 2149, 250, 'small emerald')
shopModule:addSellableItem({'small amethyst'}, 2150, 200, 'small amethyst')
shopModule:addSellableItem({'talon'}, 2151, 320, 'talon')
shopModule:addSellableItem({'gold nugget'}, 2157, 500, 'gold nugget')
shopModule:addSellableItem({'elephant tusk'}, 3956, 100, 'elephant tusk')

-----------------------
-- / Parte editável
npcHandler:addModule(FocusModule:new())
