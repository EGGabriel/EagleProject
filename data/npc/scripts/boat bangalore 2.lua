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

local talkState = {}

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then -- testa se o jogador est� falando com o NPC
		return FALSE
	end
		
	if talkState[cid] == nil then -- seta a vari�vel respons�vel por ditar que parte da conversa ambos est�o
		talkState[cid] = 1
	end

		if (msg == 'foxworld' and talkState[cid] == 1) or -- se o jogador falar FoxWorld no come�o da conversa, j� � enviado ao destino
		   (msg == 'FoxWorld' and talkState[cid] == 1) or
		   (msg == 'yes' and talkState[cid] == 1)
		then
			talkState[cid] = 1
			
			-- parte do teleport
			playerPos = getPlayerPosition(cid)
			if getTilePzInfo(playerPos) == FALSE then -- o jogador precisa estar em PZ para navegar
				talkState[cid] = 1
				npcHandler:say('You need to be inside my boat. Duh!', cid)
			else
				talkState[cid] = 1
				doSendMagicEffect(playerPos,CONST_ME_TELEPORT)
				local destino = {x=577, y=170, z=6} -- barco no Deserto de Asauchi
				doTeleportThing(cid,destino)
				doSendMagicEffect(destino,CONST_ME_TELEPORT)
				npcHandler:releaseFocus(cid)
			end
			-- / parte do teleport
		
		elseif (msg == 'no' and talkState[cid] == 1) then
			talkState[cid] = 1
			npcHandler:say('Maybe next time.', cid)
			npcHandler:releaseFocus(cid)
		end
	
	
	
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)

-----------------------
-- / Parte edit�vel
npcHandler:addModule(FocusModule:new())
