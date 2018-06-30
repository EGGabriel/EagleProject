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

local talkState = {}
-- talkState 1
-- talkState 2 -- resposta caso queira ir a Bangalore
-- talkState 3 -- resposta caso queira saber mais sobre o favor que Mirage quer que façam
-- talkState 4 -- resposta caso queira fazer a quest dos olhos de Kruha

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then -- testa se o jogador está falando com o NPC
		return FALSE
	end
		
	if talkState[cid] == nil then -- seta a variável responsável por ditar que parte da conversa ambos estão
		talkState[cid] = 1
	end

	if (msg == 'tartaruga' or msg == 'tartarugas' or msg == 'turtle' or msg == 'turtles') and talkState[cid] == 1 then
		if getPlayerStorageValue(cid,5100) == 1 and getPlayerStorageValue(cid,5101) < 1000 then
			npcHandler:say('Cadê os 1000 olhos de Kruha que me prometeu? '..getPlayerStorageValue(cid,5101)..' não é mil..', cid)
		elseif getPlayerStorageValue(cid,5100) == 1 and getPlayerStorageValue(cid,5101) >= 1000 then
			setPlayerStorageValue(cid,5100,2)
			savePlayerStorage(cid)
			npcHandler:say('OHH! São realmente mil olhos de Kruha! Ok, agora jogue-os na água pois não quero mais ver essa coisa nojenta. Como prometido, pode usar minhas tartarugas agora, tem uma ali embaixo.', cid)
		elseif getPlayerStorageValue(cid,5100) == 2 then
			npcHandler:say('Para usá-las, é só subir em cima delas, tem uma ali embaixo.', cid)
		else
			npcHandler:say('Ah, então mostrou interesse em minhas tartarugas é? Elas conseguem passar por lugares que meu barco não passa. Mas nessa vida nada é de graça, se quiser viajar sobre minhas tartarugas, terá que fazer um {favor} pra mim.', cid)
			talkState[cid] = 3
		end
	end
	
	if (msg == 'favor' or msg == 'quest') and talkState[cid] == 3 then
		npcHandler:say('A muito tempo atrás, quando eu ainda era uma criança, meu pai estava descobrindo novas rotas para que pudesse dar um diferencial aos habitantes de FoxWorld. Em uma destas viagens, ele se deparou com uma criatura de nome Kruha, que dizem ter em abundância em Bangalore.', cid)
		npcHandler:say('Meu pai foi morto por um filho da p.. desses =\'/ .. quero que você me ajude a extinguir esta espécie, me trazendo 1000 olhos de Kruha, sendo que cada um tem 4 olhos. Você {aceita} esta quest em troca de viajar com minhas tartarugas quando quiser?', cid)
		talkState[cid] = 4
	end
	
	if (msg == 'aceita' or msg == 'aceito' or msg == 'yes' or msg == 'sim') and talkState[cid] == 4 then
		setPlayerStorageValue(cid,5100,1) -- indica que o jogador aceitou a quest
		setPlayerStorageValue(cid,5101,0)
		savePlayerStorage(cid)
		npcHandler:say('Ok foxworldiano, volte aqui com a mochila cheia, que lhe darei o que prometi.', cid)
		npcHandler:releaseFocus(cid)
	end
	
	if (msg == 'rota' or msg == 'rotas' or msg == 'route' or msg == 'routes') and talkState[cid] == 1 then
		talkState[cid] = 2
		npcHandler:say('Estou passando pela ilha de {Bangalore}. Quer embarcar?', cid)
	end
	
	if (msg == 'bangalore' and talkState[cid] == 1) or -- se o jogador falar bangalore no começo da conversa, já é enviado ao destino
	   (msg == 'bangalore' and talkState[cid] == 2) or
	   (msg == 'yes' and talkState[cid] == 2)
	then
		talkState[cid] = 1
			
		-- parte do teleport
		playerPos = getPlayerPosition(cid)
		if getTilePzInfo(playerPos) == FALSE then -- o jogador precisa estar em PZ para navegar
			talkState[cid] = 1
			npcHandler:say('Você precisa estar dentro do barco. Duh!', cid)
		else
			talkState[cid] = 1
			doSendMagicEffect(playerPos,CONST_ME_TELEPORT)
			local destino = {x=643, y=127, z=6} -- barco de Bangalore
			doTeleportThing(cid,destino)
			doSendMagicEffect(destino,CONST_ME_TELEPORT)
			npcHandler:releaseFocus(cid)
		end
		-- / parte do teleport
	end
		
	if msg == 'no' or msg == 'não' or msg == 'nao' then
		talkState[cid] = 1
		npcHandler:say('Talvez uma outra hora.', cid)
		npcHandler:releaseFocus(cid)
	end

end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)

-----------------------
-- / Parte editável
npcHandler:addModule(FocusModule:new())
