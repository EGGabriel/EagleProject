-- M�dulos padr�o
-------------------------
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()						npcHandler:onThink()						end
-------------------------
-- / M�dulos padr�o


-- Parte edit�vel
---------------------

local shopModule = ShopModule:new() 
npcHandler:addModule(shopModule) 

shopModule:addBuyableItem({'bar of chocolate'}, 6574, 500, 'bar of chocolate')

-----------------------
-- / Parte edit�vel
npcHandler:addModule(FocusModule:new())
