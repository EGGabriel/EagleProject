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
local dica = 1

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then -- testa se o jogador est� falando com o NPC
		return FALSE
	end
	
	if talkState[cid] == nil then -- seta a vari�vel respons�vel por ditar que parte da conversa que ambos est�o
		talkState[cid] = 1
	end
	
	if msg == 'nao' or msg == 'n�o' or msg == 'bye' then
		local bye = math.random(1,2)
		if bye == 1 then
			npcHandler:say('Asta la vista... baby.', cid)
		elseif bye == 2 then
			npcHandler:say('Int�..', cid)
		else
			npcHandler:say('Adi�s hermano!', cid)
		end
		npcHandler:releaseFocus(cid)
	end
	
	local GranCastleTest = doGranCastleTest()
	
	-- Tutoriais
	if (msg == 'saber mais') and talkState[cid] == 1 then
		talkState[cid] = 1
		npcHandler:say('Sobre o que queres saber? {Gran Castle}, {Gran Tower}, {Gran Aura} ou algumas {dicas} �teis?', cid)
	end
	if (msg == 'Gran Castle' or msg == 'gran castle') and talkState[cid] == 1 then
		talkState[cid] = 1
		npcHandler:say('O castelo tem vida pr�pria e se protege sozinho. Por�m, se um ser humano se mostrar forte e conseguir destruir a Gran Tower que fica no �ltimo andar do castelo, ganha Gran Aura! \nQuer {saber mais}?', cid)
	end
	if (msg == 'Gran Tower' or msg == 'gran tower') and talkState[cid] == 1 then
		talkState[cid] = 1
		npcHandler:say('Se voc� chegar no centro do sexto/�ltimo andar do castelo, haver� uma esp�cie de est�tua com imenso poder vis�vel a olho n�. Se voc� a destruir, ganhar� a Gran Aura! Ent�o seu objetivo passa a ser o de proteger a Gran Tower, pois se algu�m destru�-la novamente antes do tempo do Melkrapo fechar o portal, voc� perde a aura adquirida. Quer {saber mais}?', cid)
	end
	if (msg == 'Gran Aura' or msg == 'gran aura') and talkState[cid] == 1 then
		talkState[cid] = 1
		npcHandler:say('Com a Gran Aura, o guerreiro fica brilhando e reflete 20% de todo dano recebido, al�m de ficar imune as B.Skill King Teleport e Changer Corpse. Quer {saber mais}?', cid)
	end
	
	if (msg == 'dicas' or msg == 'dica') and talkState[cid] == 1 then
		talkState[cid] = 1
		if dica == 1 then
			npcHandler:say('Leia as placas que ver, elas lhe dar�o informa��es importantes da ilha do Gran Castle. Quer {saber mais} ou quer outra {dica}?', cid)
			dica = 2
		elseif dica == 2 then
			npcHandler:say('Lute sem medo, voc� n�o perde nada se morrer na ilha do Gran Castle. Quer {saber mais} ou quer outra {dica}?', cid)
			dica = 3
		elseif dica == 3 then
			npcHandler:say('Se voc� n�o tem est� com a Gran Aura, utilize as catapultas ao redor para sobrevoar a muralha. Quer {saber mais} ou quer outra {dica}?', cid)
			dica = 4
		elseif dica == 4 then
			npcHandler:say('Voc� pode healar(encher a vida) da Gran Tower ou das Walls(paredes de prote��o no �ltimo andar), para dificultar que outros guerreiros dominem o Gran Castle. Quer {saber mais} ou quer outra {dica}?', cid)
			dica = 5
		elseif dica == 5 then
			npcHandler:say('Usar magic wall antes das Walls ou em volta da Gran Tower, � uma �tima estrat�gia para diminuir os hits que elas levam, caso seu objetivo seja proteger a torre. Quer {saber mais} ou quer outra {dica}?', cid)
			dica = 6
		elseif dica == 6 then
			npcHandler:say('Monte uma guild, evite conquistar o castelo sozinho. Se voc� dominar o castelo e tiver uma guild, todos membros online tamb�m ganhar�o a Gran Aura, ent�o voc� ter� ajuda para proteger a Gran Tower! Quer {saber mais} ou quer outra {dica}?', cid)
			dica = 7
		elseif dica == 7 then
			npcHandler:say('Apenas 5 membros da sua guild poder�o entrar no castelo, os outros n�o passar�o por mim, a n�o ser que um de voc�s saia ou morra na ilha. Evite guilds grandes, um membro fraco pode impedir um forte de entrar no Gran Castle. Quer {saber mais} ou quer outra {dica}?', cid)
			dica = 8
		else
			npcHandler:say('Se voc� estiver com a Gran Aura, voc� pode atravessar as grades do castelo e entrar no portal entre elas, levando voc� para o sexto/�ltimo andar do castelo, facilitando para defend�-lo. Quer {saber mais} ou quer outra {dica}?', cid)
			dica = 1
		end
	end
	-- Parte 1
	if (msg == 'entrar' or msg == 'yes' or msg == 'sim') and talkState[cid] == 1 then
		if GranCastleTest ~= FALSE then
			talkState[cid] = 2
			npcHandler:say('O portal estar� aberto pelos pr�ximos '..GranCastleTest..' minutos. Quer ser enviado para o solo sagrado da ilha do Gran Castle?', cid)
		else
			talkState[cid] = 1
			npcHandler:say('O portal est� fechado. Eu o abro todas as ter�as-feiras, quintas-feiras e s�bados, d�s 19h �s 20h. Quer {saber mais}?', cid)
		end
	end
	
	-- Parte 2
	if (msg == 'yes' or msg == 'sim' or msg == 'ok') and talkState[cid] == 2 then
		if GranCastleTest == FALSE then
			npcHandler:say('Opa! Acabou o hor�rio que tenho permiss�o para abrir o portal, lamento mas ordens s�o ordens.', cid)
			npcHandler:releaseFocus(cid)
			return FALSE
		end
	
		local playerPos = getCreaturePosition(cid)
		if getTilePzInfo(playerPos) ~= TRUE then
			npcHandler:say('Entra aqui bund�o! N�o tenho como conjurar o portal com voc� no esgoto..', cid)
			npcHandler:releaseFocus(cid)
			return FALSE
		end
	
		if getPlayerLevel(cid) < 80 and getPlayerAccess(cid) ~= TRUE then
			npcHandler:say('Perd�o, mas voc� ainda � muito jovem e fraco para um lugar t�o perigoso. Volte quando estiver n�vel 80 ou acima.', cid)
			npcHandler:releaseFocus(cid)
			return FALSE
		end
		
		local playerGuild = getPlayerGuildId(cid)
		local membrosGuild = 0
		if playerGuild ~= FALSE then
			for _,name in ipairs(getOnlinePlayers()) do
				jogador = getPlayerByName(name)
				if getPlayerLevel(jogador) < 80 then
				
				elseif getPlayerGuildId(jogador) ~= playerGuild then
				
				elseif isInGranCastleArea(getCreaturePosition(jogador)) == TRUE then
					membrosGuild = membrosGuild+1
				end
			end
			
			if membrosGuild > 7 then
				npcHandler:say('Seu covarde! J� tem '..membrosGuild..' membros da sua guild na ilha do Gran Castle. O m�ximo permitido � 7. Espere um morrer, sair ou saia desta guild, e quem sabe forme a sua pr�pria! >=\)', cid)
				npcHandler:releaseFocus(cid)
				return FALSE
			end
		end

		npcHandler:say('Boa viagem aventureiro!', cid)
		local teleport = math.random(1,table.getn(ARREDORES_GRANCASTLE))
		doSendMagicEffect(playerPos,CONST_ME_TELEPORT)
		doTeleportThing(cid,ARREDORES_GRANCASTLE[teleport])
		doSendMagicEffect(ARREDORES_GRANCASTLE[teleport],CONST_ME_TELEPORT)
		npcHandler:releaseFocus(cid)
	end

end
-----------------------
-- / Parte edit�vel

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
