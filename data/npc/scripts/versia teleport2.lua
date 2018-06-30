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

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	
	if msgcontains(msg, 'solaris') or msgcontains(msg, 'yes') then
		setPlayerStorageValue(cid, 30002, 0) -- para que não seja teleportado pro templo se acabar a premmy e não estiver em local VIP
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
-- / Parte editável
npcHandler:addModule(FocusModule:new())
