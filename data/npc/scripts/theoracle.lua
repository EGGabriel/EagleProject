local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

function oracle(cid, message, keywords, parameters, node)
if(cid ~= npcHandler.focus) then
return false
end

local cityNode = node:getParent():getParent()
local vocNode = node:getParent()

local destination = cityNode:getParameters().destination
local town = cityNode:getParameters().town
local vocation = vocNode:getParameters().vocation

if(destination ~= nil and vocation ~= nil and town ~= nil) then
if(getPlayerLevel(cid) < parameters.level) then
npcHandler:say('You must first reach level ' .. parameters.level .. '!')
else
if getPlayerVocation(cid) > 0 then
npcHandler:say('Desculpe, Voce ja tem a vocacao!')
else
doPlayerSetVocation(cid, vocation)
doPlayerSetTown(cid, town)
doTeleportThing(cid, destination)
doSendMagicEffect(destination, CONST_ME_MAGIC_BLUE)
end
end
end
npcHandler:resetNpc()
return true
end

function greetCallback(cid)
if(getPlayerLevel(cid) < 12) then
npcHandler:say('COME BACK WHEN YOU GROW UP, CHILD!')
return false
else
return true
end
end
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setMessage(MESSAGE_GREET, 'Ola |PLAYERNAME|. Voce esta preparado para seu destino??')

local yesNode = KeywordNode:new({'yes'}, oracle, {level = 20})
local noNode = KeywordNode:new({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, moveup = 1, text = 'Then what vocation do you want to become?'})

local node1 = keywordHandler:addKeyword({'yes'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Kual cidade voce ker morar? Slayer City?'})
local node2 = node1:addChildKeyword({'slayer city'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, town = 1, destination = {x=160, y=54, z=7}, text = 'Slayer City, eh? Kual a sua Vocacao? Henzen Sorcerer, Henzen Druid, Henzen Paladin ou Henzen Knight?'})
local node3 = node2:addChildKeyword({'henzen sorcerer'}, StdModule.say, {npcHandler = npcHandler, vocation = 9, onlyFocus = true, text = 'Sua Decisao e irrevessivel. Muhaaa Se fudeu!'})
node3:addChildKeywordNode(yesNode)
node3:addChildKeywordNode(noNode)
local node3 = node2:addChildKeyword({'henzen druid'}, StdModule.say, {npcHandler = npcHandler, vocation = 10, onlyFocus = true, text = 'Sua Decisao e irrevessivel. Muhaaa Se fudeu!'})
node3:addChildKeywordNode(yesNode)
node3:addChildKeywordNode(noNode)
local node3 = node2:addChildKeyword({'henzen paladin'}, StdModule.say, {npcHandler = npcHandler, vocation = 11, onlyFocus = true, text = 'Sua Decisao e irrevessivel. Muhaaa Se fudeu!'})
node3:addChildKeywordNode(yesNode)
node3:addChildKeywordNode(noNode)
local node3 = node2:addChildKeyword({'henzen knight'}, StdModule.say, {npcHandler = npcHandler, vocation = 12, onlyFocus = true, text = 'Sua Decisao e irrevessivel Muhaaa Se fudeu!'})
node3:addChildKeywordNode(yesNode)
node3:addChildKeywordNode(noNode)
keywordHandler:addKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Then come back when you are ready.'})

npcHandler:addModule(FocusModule:new())