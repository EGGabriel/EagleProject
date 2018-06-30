local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()						npcHandler:onThink()						end

function buyAddons(cid, message, keywords, parameters, node)
	--TODO: buyAddons function in modules.lua
	if(not npcHandler:isFocused(cid)) then
		return false
	end

	local addon = parameters.addon
	local cost = parameters.cost
	local premium = (parameters.premium ~= nil and parameters.premium)
	roupa = getPlayerStorageValue(cid, 7551)
	
	    if (roupa == -1) then
		setPlayerStorageValue(cid,7551,0)
		end

	    if (roupa ~= addon) and (roupa < 3) then
		    if doPlayerRemoveMoney(cid, cost) == TRUE then
			doPlayerAddAddons(cid, addon)
			npcHandler:say('Prontinho, você já pode usar esse addon!', cid)
			setPlayerStorageValue(cid, 7551, (roupa + addon))
			doSendMagicEffect(getPlayerPosition(cid),14)
		    else
			npcHandler:say('Poxa, que pena, você não tem dinheiro suficiente :/', cid)
		    end
		else
        npcHandler:say('Desculpe, você já obteve esse addon :)', cid)
		end
	keywordHandler:moveUp(1)
	return true
end

local node1 = keywordHandler:addKeyword({'first addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Quer mesmo comprar o first addon por 2000 gold coins?'})
	node1:addChildKeyword({'yes'}, buyAddons, {addon = 1, cost = 2000, premium = false})
	node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, moveup = 1, text = 'Muito caro, éh?'})

local node2 = keywordHandler:addKeyword({'second addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Quer mesmo comprar o second addon por 3000 gold coins?'})
	node2:addChildKeyword({'yes'}, buyAddons, {addon = 2, cost = 3000, premium = false})
	node2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, moveup = 1, text = 'Muito caro, éh?'})

keywordHandler:addKeyword({'addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Eu vendo first addon por 2000 gold coins e o second addon por 3000 gold coins.'})

npcHandler:addModule(FocusModule:new())