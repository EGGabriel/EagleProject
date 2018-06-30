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

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	
	if msgcontains(msg, 'solaris') or msgcontains(msg, 'yes') then
		setPlayerStorageValue(cid, 30002, 0) -- para que n�o seja teleportado pro templo se acabar a premmy e n�o estiver em local VIP
		playerPos = getPlayerPosition(cid)
		doSendMagicEffect(playerPos,CONST_ME_TELEPORT)
		local destino = {x=241, y=134, z=7} -- templo de Solaris
		doTeleportThing(cid,destino)
		doSendMagicEffect(destino,CONST_ME_TELEPORT)
	end
	return TRUE
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)

-----------------------
-- / Parte edit�vel
npcHandler:addModule(FocusModule:new())
