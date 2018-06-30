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
local dica = 1

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then -- testa se o jogador está falando com o NPC
		return FALSE
	end
	
	if talkState[cid] == nil then -- seta a variável responsável por ditar que parte da conversa que ambos estão
		talkState[cid] = 1
	end
	
	if msg == 'nao' or msg == 'não' or msg == 'bye' then
		local bye = math.random(1,2)
		if bye == 1 then
			npcHandler:say('Asta la vista... baby.', cid)
		elseif bye == 2 then
			npcHandler:say('Inté..', cid)
		else
			npcHandler:say('Adiós hermano!', cid)
		end
		npcHandler:releaseFocus(cid)
	end
	
	local GranCastleTest = doGranCastleTest()
	
	-- Tutoriais
	if (msg == 'saber mais') and talkState[cid] == 1 then
		talkState[cid] = 1
		npcHandler:say('Sobre o que queres saber? {Gran Castle}, {Gran Tower}, {Gran Aura} ou algumas {dicas} úteis?', cid)
	end
	if (msg == 'Gran Castle' or msg == 'gran castle') and talkState[cid] == 1 then
		talkState[cid] = 1
		npcHandler:say('O castelo tem vida própria e se protege sozinho. Porém, se um ser humano se mostrar forte e conseguir destruir a Gran Tower que fica no último andar do castelo, ganha Gran Aura! \nQuer {saber mais}?', cid)
	end
	if (msg == 'Gran Tower' or msg == 'gran tower') and talkState[cid] == 1 then
		talkState[cid] = 1
		npcHandler:say('Se você chegar no centro do sexto/último andar do castelo, haverá uma espécie de estátua com imenso poder visível a olho nú. Se você a destruir, ganhará a Gran Aura! Então seu objetivo passa a ser o de proteger a Gran Tower, pois se alguém destruí-la novamente antes do tempo do Melkrapo fechar o portal, você perde a aura adquirida. Quer {saber mais}?', cid)
	end
	if (msg == 'Gran Aura' or msg == 'gran aura') and talkState[cid] == 1 then
		talkState[cid] = 1
		npcHandler:say('Com a Gran Aura, o guerreiro fica brilhando e reflete 20% de todo dano recebido, além de ficar imune as B.Skill King Teleport e Changer Corpse. Quer {saber mais}?', cid)
	end
	
	if (msg == 'dicas' or msg == 'dica') and talkState[cid] == 1 then
		talkState[cid] = 1
		if dica == 1 then
			npcHandler:say('Leia as placas que ver, elas lhe darão informações importantes da ilha do Gran Castle. Quer {saber mais} ou quer outra {dica}?', cid)
			dica = 2
		elseif dica == 2 then
			npcHandler:say('Lute sem medo, você não perde nada se morrer na ilha do Gran Castle. Quer {saber mais} ou quer outra {dica}?', cid)
			dica = 3
		elseif dica == 3 then
			npcHandler:say('Se você não tem está com a Gran Aura, utilize as catapultas ao redor para sobrevoar a muralha. Quer {saber mais} ou quer outra {dica}?', cid)
			dica = 4
		elseif dica == 4 then
			npcHandler:say('Você pode healar(encher a vida) da Gran Tower ou das Walls(paredes de proteção no último andar), para dificultar que outros guerreiros dominem o Gran Castle. Quer {saber mais} ou quer outra {dica}?', cid)
			dica = 5
		elseif dica == 5 then
			npcHandler:say('Usar magic wall antes das Walls ou em volta da Gran Tower, é uma ótima estratégia para diminuir os hits que elas levam, caso seu objetivo seja proteger a torre. Quer {saber mais} ou quer outra {dica}?', cid)
			dica = 6
		elseif dica == 6 then
			npcHandler:say('Monte uma guild, evite conquistar o castelo sozinho. Se você dominar o castelo e tiver uma guild, todos membros online também ganharão a Gran Aura, então você terá ajuda para proteger a Gran Tower! Quer {saber mais} ou quer outra {dica}?', cid)
			dica = 7
		elseif dica == 7 then
			npcHandler:say('Apenas 5 membros da sua guild poderão entrar no castelo, os outros não passarão por mim, a não ser que um de vocês saia ou morra na ilha. Evite guilds grandes, um membro fraco pode impedir um forte de entrar no Gran Castle. Quer {saber mais} ou quer outra {dica}?', cid)
			dica = 8
		else
			npcHandler:say('Se você estiver com a Gran Aura, você pode atravessar as grades do castelo e entrar no portal entre elas, levando você para o sexto/último andar do castelo, facilitando para defendê-lo. Quer {saber mais} ou quer outra {dica}?', cid)
			dica = 1
		end
	end
	-- Parte 1
	if (msg == 'entrar' or msg == 'yes' or msg == 'sim') and talkState[cid] == 1 then
		if GranCastleTest ~= FALSE then
			talkState[cid] = 2
			npcHandler:say('O portal estará aberto pelos próximos '..GranCastleTest..' minutos. Quer ser enviado para o solo sagrado da ilha do Gran Castle?', cid)
		else
			talkState[cid] = 1
			npcHandler:say('O portal está fechado. Eu o abro todas as terças-feiras, quintas-feiras e sábados, dàs 19h às 20h. Quer {saber mais}?', cid)
		end
	end
	
	-- Parte 2
	if (msg == 'yes' or msg == 'sim' or msg == 'ok') and talkState[cid] == 2 then
		if GranCastleTest == FALSE then
			npcHandler:say('Opa! Acabou o horário que tenho permissão para abrir o portal, lamento mas ordens são ordens.', cid)
			npcHandler:releaseFocus(cid)
			return FALSE
		end
	
		local playerPos = getCreaturePosition(cid)
		if getTilePzInfo(playerPos) ~= TRUE then
			npcHandler:say('Entra aqui bundão! Não tenho como conjurar o portal com você no esgoto..', cid)
			npcHandler:releaseFocus(cid)
			return FALSE
		end
	
		if getPlayerLevel(cid) < 80 and getPlayerAccess(cid) ~= TRUE then
			npcHandler:say('Perdão, mas você ainda é muito jovem e fraco para um lugar tão perigoso. Volte quando estiver nível 80 ou acima.', cid)
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
				npcHandler:say('Seu covarde! Já tem '..membrosGuild..' membros da sua guild na ilha do Gran Castle. O máximo permitido é 7. Espere um morrer, sair ou saia desta guild, e quem sabe forme a sua própria! >=\)', cid)
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
-- / Parte editável

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
