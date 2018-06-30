--|---------------------------------------------------------------------------------| --
--|----- NPC feito para substituir os Eventos Globais (GlobalEvents) -------|--
--|---------------------------------------------------------------------------------|--

-------------------
-- Vari�veis  --
-------------------

-- Para todos eventos
------------------------
local horarioAtual = os.time()
-------------------------
-- / Para todos eventos


-- Evento 1 - Mensagens para todos os jogadores de tempo em tempo
---------------------------------------------------------------------------
local horaUltimoEvento1 = horarioAtual
local intervaloEvento1 = 60*60*1 -- em segundos -- a cada intervalo, um an�ncio � mostrado a todos jogadores
local anuncioEvento1 = math.random(1,6) -- vari�vel que indica que mensagem ser� a primeira
--------------
-- / Evento 1


-- Evento 2 - NPC falando de tempo em tempo
--------------------------------------------------
local horaUltimoEvento2 = horarioAtual
local intervaloEvento2 = math.random(30,60) -- em segundos -- a cada intervalo, o NPC fala algo
local falaEvento2 = math.random(1,9) -- vari�vel que indica que fala ser� a primeira
---------------
-- / Evento 2


-- Evento 3 - Chance de come�ar uma n�voa que impede o Exiva a longa dist�ncias
-----------------------------------------------------------------------------------------
local horaUltimoEvento3 = horarioAtual
local intervaloEvento3 = 1*60*60*2 -- em segundos -- ap�s 2 horas com o servidor aberto, o evento roda a primeira vez
local chanceEvento3 = 6 -- porcentagem -- chance em porcentagem, da n�voa acontecer a cada intervalo
local storageDuracaoEvento3 = 20003 -- storage que indica se a n�voa est� acontecendo e quanto tempo durar�
---------------
-- / Evento 3


-- Evento 4 - Nos dias pares, o servidor � PVP, nos dias �mpares, o server � Non-PVP
---------------------------------------------------------------------------------------------
-- local evento4Executado = FALSE

-- local function setPVP()
-- 	broadcastMessage("Servidor setado para PVP pois todo dia par h� possibilidade de combate entre jogadores.", MESSAGE_STATUS_WARNING)
-- 	setWorldType(WORLD_TYPE_PVP)
-- 	evento4Executado = FALSE -- permite o evento de executar novamente
-- end
	
-- local function setNonPVP()
-- 	broadcastMessage("Servidor setado para Non-PVP pois todo dia �mpar n�o h� possibilidade de combate entre jogadores.", MESSAGE_STATUS_WARNING)
-- 	setWorldType(WORLD_TYPE_NO_PVP)
-- 	evento4Executado = FALSE
-- end
---------------
-- / Evento 4


-- Evento 5 - Sistema de invas�es autom�ticas
---------------------------------------------------
-- local horaUltimoEvento5 = horarioAtual
-- local intervaloEvento5 = math.random( (1*60*30) , ((1*60*60)+20) ) -- (entre 30 minutos e 1 hora e 20 minutos) - a cada intervalo, os testes de invas�es s�o feitos
-- local resetBoss = FALSE
---------------
-- / Evento 5


-- Evento 6 -- grades do 5� andar do Gran Castle (s� roda com o evento Gran Castle ativo)
---------------------------------------------------------------------------------------------------
local hora1UltimoEvento6 = horarioAtual -- um hor�rio e intervalo pra cada grade, pois elas n�o abrem e fecham juntas
local hora2UltimoEvento6 = horarioAtual
local hora3UltimoEvento6 = horarioAtual
local hora4UltimoEvento6 = horarioAtual
local intervalo1Evento6 = math.random(4,7) -- em segundos -- ap�s 4~7 segundos as grades norte abre
local intervalo2Evento6 = math.random(4,7) -- em segundos -- ap�s 4~7 segundos as grades leste abre
local intervalo3Evento6 = math.random(4,7) -- em segundos -- ap�s 4~7 segundos as grades sul abre
local intervalo4Evento6 = math.random(4,7) -- em segundos -- ap�s 4~7 segundos as grades oeste abre
--------------
-- / Evento 6


-- Evento 7 -- efeitos m�gicos nas catapultas do Gran Castle (s� roda com o evento Gran Castle ativo)
-------------------------------------------------------------------
local horaUltimoEvento7 = horarioAtual
local intervaloEvento7 = 9

local catapultasPos = {
	{x=938 , y=500 , z=3 },
	{x=975 , y=500 , z=3 },
	{x=976 , y=547 , z=3 },
	{x=937 , y=547 , z=3 },
	{x=883 , y=507 , z=7 },
	{x=880 , y=534 , z=7 },
	{x=941 , y=596 , z=7 },
	{x=975 , y=598 , z=7 },
	{x=1028 , y=540 , z=7 },
	{x=1029 , y=509 , z=7 },
	{x=980 , y=454 , z=7 },
	{x=940 , y=453 , z=7 }
}
---------------
-- / Evento 7


-- Evento 8 - Evento Gran Castle de dom�nio do castelo
-------------------------------------------------------------
local mensagem1_entregue = FALSE
local mensagem2_entregue = FALSE
local mensagem3_entregue = FALSE
---------------
-- / Evento 8


-- Evento 9 - Letra F do templo de Solaris, fica girando
----------------------------------------------------------------
local horaUltimoEvento9 = horarioAtual
local intervaloEvento9 = 2 -- em segundos -- a cada intervalo, o F da um giro
local efeitoEvento9 = 1
local letrapos = {x=240,y=137,z=7}
local coluna1 = {}
local coluna2 = {}
local coluna3 = {}
local tile1 = 0
local tile2 = 0
local tile3 = 0

local function F_Normal()
	for i=0,4 do
		coluna1 = {x=letrapos.x , y=letrapos.y+i , z=7 , stackpos=0}
		coluna2 = {x=letrapos.x+1 , y=letrapos.y+i , z=7 , stackpos=0}
		coluna3 = {x=letrapos.x+2 , y=letrapos.y+i , z=7 , stackpos=0}
		
		tile1 = getThingfromPos(coluna1)
		tile2 = getThingfromPos(coluna2)
		tile3 = getThingfromPos(coluna3)
		
		doTransformItem(tile1.uid, 406)
		
		if i == 0 or i == 2 then
			doTransformItem(tile2.uid, 406)
		else
			doTransformItem(tile2.uid, 407)
		end
		
		if i == 0 then
			doTransformItem(tile3.uid, 406)
		else
			doTransformItem(tile3.uid, 407)
		end
	end
end

local function F_AoContrario()
	for i=0,4 do
		coluna1 = {x=letrapos.x , y=letrapos.y+i , z=7 , stackpos=0}
		coluna2 = {x=letrapos.x+1 , y=letrapos.y+i , z=7 , stackpos=0}
		coluna3 = {x=letrapos.x+2 , y=letrapos.y+i , z=7 , stackpos=0}
		
		tile1 = getThingfromPos(coluna1)
		tile2 = getThingfromPos(coluna2)
		tile3 = getThingfromPos(coluna3)
		
		if i == 0 then
			doTransformItem(tile1.uid, 406)
		else
			doTransformItem(tile1.uid, 407)
		end
		
		if i == 0 or i == 2 then
			doTransformItem(tile2.uid, 406)
		else
			doTransformItem(tile2.uid, 407)
		end
			
		doTransformItem(tile3.uid, 406)
	end
end

local function F_Giro(p)
	for i=0,4 do
		coluna1 = {x=letrapos.x , y=letrapos.y+i , z=7 , stackpos=0}
		coluna2 = {x=letrapos.x+1 , y=letrapos.y+i , z=7 , stackpos=0}
		coluna3 = {x=letrapos.x+2 , y=letrapos.y+i , z=7 , stackpos=0}
		
		tile1 = getThingfromPos(coluna1)
		tile2 = getThingfromPos(coluna2)
		tile3 = getThingfromPos(coluna3)
		
		doTransformItem(tile1.uid, 407)
		doTransformItem(tile2.uid, 406)
		doTransformItem(tile3.uid, 407)
	end
	
	if p == "horario" then
		addEvent(F_AoContrario, 300)
	else
		addEvent(F_Normal, 300)
	end
end
---------------
-- / Evento 9


-- Evento 10 - efeitos de magia no c�lice verde do templo de Solaris
---------------------------------------------------------------------------
local horaUltimoEvento10 = horarioAtual
local intervaloEvento10 = 3 -- em segundos -- a cada intervalo, um efeito diferente sai do c�lice
local efeitoEvento10 = 1
local effectPosEvento10 = {x=233,y=132,z=7}
----------------
-- / Evento 10

--------------------
-- / Vari�veis --
--------------------

function onThink()

	-- Evento 1
	-------------
	if (horaUltimoEvento1 + intervaloEvento1) < horarioAtual then
		horaUltimoEvento1 = horarioAtual

		-- mensagens ir�o ser em sequ�ncia
		if anuncioEvento1 == 1 then
			-- mensagem1
				broadcastMessage("Acompanhe nosso forum para ficar por dentro de tudo no servidor!", MESSAGE_INFO_DESCR)
				broadcastMessage("http://eagleworld.forumeiros.com/", MESSAGE_EVENT_ADVANCE)
			-- /mensagen1
			anuncioEvento1 = 2
		elseif anuncioEvento1 == 2 then
			-- mensagem2
				broadcastMessage("N�o tem uma Recovery Key? Fique sem por enquanto, nosso sistema ainda esta em desenvolvimento!", MESSAGE_INFO_DESCR)
				broadcastMessage("www.foxworldserver.com", MESSAGE_EVENT_ADVANCE)
			--/mensagem2
			anuncioEvento1 = 3
		elseif anuncioEvento1 == 3 then
			--mensagem3
				broadcastMessage("A equipe do Eagle World JAMAIS solicitar� os dados de sua conta por motivo algum.", MESSAGE_INFO_DESCR)
				broadcastMessage("http://eagleworld.servegame.com/site/notes.php", MESSAGE_EVENT_ADVANCE)
			--/mensagem3
			anuncioEvento1 = 4
		elseif anuncioEvento1 == 4 then
			--mensagem4
				broadcastMessage("Curta nossa p�gina no Facebook e fique por dentro das novidades na sua rede social!", MESSAGE_INFO_DESCR)
				broadcastMessage("www.facebook.com/EagleOpenTibia", MESSAGE_EVENT_ADVANCE)
			--/mensagem4
			anuncioEvento1 = 5
		elseif anuncioEvento1 == 5 then
			--mensagem5
				broadcastMessage("Eagle World conta com trainers na cidade de Solaris(cidade principal), Asauchi(cidade no deserto) e V�rsia(ilha VIP)!", MESSAGE_INFO_DESCR)
				broadcastMessage("Curte la: www.facebook.com/EagleOpenTibia", MESSAGE_EVENT_ADVANCE)
			--/mensagem5
			anuncioEvento1 = 6
		else
			--mensagem6
				broadcastMessage("Quer entender melhor sobre o sistema exclusivo de Special Skills em Eagle World?", MESSAGE_INFO_DESCR)
				broadcastMessage("eagleworld.servegame.com/site/skills.php", MESSAGE_EVENT_ADVANCE)
			--mensagem6
			anuncioEvento1 = 1
		end
	end
	--------------
	-- / Evento 1


	-- Evento 2
	-------------
	if (horaUltimoEvento2 + intervaloEvento2) < horarioAtual then
		intervaloEvento2 = math.random(30,60)
		horaUltimoEvento2 = horarioAtual

		-- falas ir�o aparecer em sequ�ncia
		if falaEvento2 == 1 then
			selfSay('Seu Amooooooor me pegou! Veio a tona foi a lona foi K.O.')
			falaEvento2 = 2
		elseif falaEvento2 == 2 then
			selfSay('Neeim tenho voz grossa tah?!')
			falaEvento2 = 3
		elseif falaEvento2 == 3 then
			selfSay('Quem min der CRAW to tirandu fotu i vai si entender com u EG!')
			falaEvento2 = 4
		elseif falaEvento2 == 4 then
			selfSay('Vai passar mal. viro sua mente com meu corpo sensuaalll')
			falaEvento2 = 5
		elseif falaEvento2 == 5 then
			selfSay('Que eu vo jogar, bem na sua cara!')
			falaEvento2 = 6
		elseif falaEvento2 == 6 then
			selfSay('Quer conhecer a equipe du eagleworld?! Vai nu site i clique eim "Equipe" no menu =*')
			falaEvento2 = 7
		elseif falaEvento2 == 7 then
			selfSay('Moxinhus e moxinhas temus forum tambein http://eagleworld.forumeiros.com/')
			falaEvento2 = 8
		elseif falaEvento2 == 8 then
			selfSay('Ui, eles tem Facebook! www.facebook.com/EagleOpenTibia')
			falaEvento2 = 9
		else
			selfSay('Temus treiners em Solaris, Asauchi e Versia! Chique neah?!')
			falaEvento2 = 1
		end
	end
	---------------
	-- / Evento 2


	-- Evento 3
	-------------
	if (horaUltimoEvento3 + intervaloEvento3) < horarioAtual then
		horaUltimoEvento3 = horarioAtual
		intervaloEvento3 = 1*60*60*4
		
		if chanceEvento3 >= math.random(0,100) then
			local duracaoEvento3 = math.random( (60*30) , (60*60) ) -- em segundos -- dura��o da n�voa, se acontecer (o math.random indica que a n�voa poder� durar de tanto a tanto tempo)
			setGlobalStorageValue(storageDuracaoEvento3, (duracaoEvento3 + horarioAtual))
			local testeEvento3 = "no"
			broadcastMessage("Uma estranha n�voa toma conta de FoxWorld. A magia Find Person(exiva), n�o funcionar� a longas dist�ncias.", MESSAGE_EVENT_ADVANCE)
		end
	end
	
	if testeEvento3 ~= "ok" and getGlobalStorageValue(storageDuracaoEvento3) < horarioAtual then
		setGlobalStorageValue(storageDuracaoEvento3, FALSE)
		if testeEvento3 == "no" then 
			broadcastMessage("A estranha n�voa que impedia a magia Find Person(exiva) de funcionar a longas dist�ncias, acabou.", MESSAGE_EVENT_ADVANCE)
		end
		testeEvento3 = "ok"
	end
	---------------
	-- / Evento 3


	-- Evento 4
	-------------
	-- if getConfigInfo('serverName') == "FoxWorld 3" then
	-- 	local dia = os.date("%d")
	-- 	local resto = math.fmod(dia,2) -- divide dia por 2, se sobrar 1, � porque o dia � impar
	-- 	if resto == 1 and getWorldType() ~= WORLD_TYPE_NO_PVP and evento4Executado == FALSE then
	-- 		if getWorldUpTime() < 60*5000 then
	-- 			addEvent(setNonPVP, 0)
	-- 		else
	-- 			broadcastMessage("Em 5 minutos o servidor estar� em Non-PVP pois hoje � um dia �mpar.", MESSAGE_STATUS_WARNING)
	-- 			addEvent(setNonPVP, 1000*60*5)
	-- 		end
	-- 		evento4Executado = TRUE
	-- 	elseif resto == 0 and getWorldType() ~= WORLD_TYPE_PVP  and evento4Executado == FALSE then
	-- 		broadcastMessage("Em 5 minutos o servidor estar� em PVP pois hoje � um dia par.", MESSAGE_STATUS_WARNING)
	-- 		addEvent(setPVP, 1000*60*5)
	-- 		evento4Executado = TRUE
	-- 	end
	-- end
	---------------
	-- / Evento 4


	-- Evento 5
	-------------
	-- if (horaUltimoEvento5 + intervaloEvento5) < horarioAtual then
	-- 	horaUltimoEvento5 = horarioAtual
	-- 	intervaloEvento5 = math.random( (1*60*30) , ((1*60*60)+20) ) -- (entre 30 minutos e 1 hora e 20 minutos) - a cada intervalo, os testes de invas�es s�o feitos
	
	-- 	if getGlobalStorageValue(22000) == LUA_ERROR then
	-- 		setGlobalStorageValue(22000, ( (horarioAtual-1000000000) + math.random( (1*60*60*24*3) , (1*60*60*24*6) ) ) ) -- o intervalo entre invas�es de bosses � de 3 a 6 dias (tira-se 1 000 000 000 pois storage n�o aceita n�meros de 10 d�gitos
	-- 	end
		
	-- 	if getGlobalStorageValue(22000) < (horarioAtual-1000000000) then
	-- 		addEvent(randomRaid, 0)
	-- 	end
	-- end

	-- if resetBoss == FALSE then
	-- 	addEvent(resetBosses, (1000*60)) -- zera as storages que indicam se um boss est� sumonado no mapa (roda somente quando o OT inicia)
	-- 	-- OBS: Essa fun��o cont�m setGlobalStorage que n�o pode rodar quando o OT est� iniciando, por isso do addEvent para 1 minuto ap�s o in�cio
	-- 	resetBoss = TRUE
	-- end
	---------------
	-- / Evento 5


	-- local GranCastleTime = doGranCastleTest() -- vari�vel utilizada nos eventos 6 e 7 para saber se o evento Gran Castle est� ativo


	-- -- Evento 6
	-- -------------
	-- if GranCastleTime ~= FALSE and (hora1UltimoEvento6 + intervalo1Evento6) < horarioAtual then
	-- 	hora1UltimoEvento6 = horarioAtual
	-- 	-- grades norte
	-- 	local grade1Pos = {x=955,y=516,z=3}
	-- 	intervalo1Evento6 = math.random(4,7) -- o novo intervalo � declarado antes do for para todas grades terem o mesmo valor aleat�rio
	-- 	for i=0,5 do
	-- 		grades1Pos = {x=grade1Pos.x+i , y=grade1Pos.y , z=grade1Pos.z}
	-- 		grade1 = getTileItemById(grades1Pos, 5071)
	-- 		if grade1.itemid == 5071 then
	-- 			doRemoveItem(grade1.uid,1)
	-- 			intervalo1Evento6 = 1
	-- 		else
	-- 			doRelocate(grades1Pos, {x=grades1Pos.x , y=grades1Pos.y+1 , z=grades1Pos.z})
	-- 			doCreateItem(5071,1,grades1Pos)
	-- 		end
	-- 	end
	-- end
	
	-- if GranCastleTime ~= FALSE and (hora2UltimoEvento6 + intervalo2Evento6) < horarioAtual then
	-- 	hora2UltimoEvento6 = horarioAtual	
	-- 	-- grades leste
	-- 	local grade2Pos = {x=966,y=523,z=3}
	-- 	intervalo2Evento6 = math.random(4,7) -- o novo intervalo � declarado antes do for para todas grades terem o mesmo valor aleat�rio
	-- 	for i=0,5 do
	-- 		grades2Pos = { x=grade2Pos.x , y=grade2Pos.y+i , z=grade2Pos.z}
	-- 		grade2 = getTileItemById(grades2Pos, 5072)
	
	-- 		if grade2.itemid == 5072 then
	-- 			doRemoveItem(grade2.uid,1)
	-- 			intervalo2Evento6 = 1
	-- 		else
	-- 			doRelocate(grades2Pos, {x=grades2Pos.x-1 , y=grades2Pos.y , z=grades2Pos.z})
	-- 			doCreateItem(5072,1,grades2Pos)
	-- 		end
	-- 	end
	-- end

	-- if GranCastleTime ~= FALSE and (hora3UltimoEvento6 + intervalo3Evento6) < horarioAtual then
	-- 	hora3UltimoEvento6 = horarioAtual
	-- 	-- grades sul
	-- 	local grade3Pos = {x=955,y=535,z=3}
	-- 	intervalo3Evento6 = math.random(4,7) -- o novo intervalo � declarado antes do for para todas grades terem o mesmo valor aleat�rio
	-- 	for i=0,5 do
	-- 		grades3Pos = { x=grade3Pos.x+i , y=grade3Pos.y , z=grade3Pos.z}
	-- 		grade3 = getTileItemById(grades3Pos, 5071)
	
	-- 		if grade3.itemid == 5071 then
	-- 			doRemoveItem(grade3.uid,1)
	-- 			intervalo3Evento6 = 1
	-- 		else
	-- 			doRelocate(grades3Pos, {x=grades3Pos.x , y=grades3Pos.y-1 , z=grades3Pos.z})
	-- 			doCreateItem(5071,1,grades3Pos)
	-- 		end
	-- 	end
	-- end

	-- if GranCastleTime ~= FALSE and (hora4UltimoEvento6 + intervalo4Evento6) < horarioAtual then
	-- 	hora4UltimoEvento6 = horarioAtual
	-- 	-- grades oeste
	-- 	local grade4Pos = {x=949,y=523,z=3}
	-- 	intervalo4Evento6 = math.random(4,7) -- o novo intervalo � declarado antes do for para todas grades terem o mesmo valor aleat�rio
	-- 	for i=0,5 do
	-- 		grades4Pos = { x=grade4Pos.x , y=grade4Pos.y+i , z=grade4Pos.z}
	-- 		grade4 = getTileItemById(grades4Pos, 5072)
	
	-- 		if grade4.itemid == 5072 then
	-- 			doRemoveItem(grade4.uid,1)
	-- 			intervalo4Evento6 = 1
	-- 		else
	-- 			doRelocate(grades4Pos, {x=grades4Pos.x+1 , y=grades4Pos.y , z=grades4Pos.z})
	-- 			doCreateItem(5072,1,grades4Pos)
	-- 		end
	-- 	end
	-- end
	---------------
	-- / Evento 6


	-- Evento 7
	-- -------------
	-- if GranCastleTime ~= FALSE and (horaUltimoEvento7 + intervaloEvento7) < horarioAtual then
	-- 	horaUltimoEvento7 = horarioAtual
		
	-- 	for _,effectPos in ipairs(catapultasPos) do
	-- 		doSendMagicEffect(effectPos, CONST_ME_TUTORIALARROW)
	-- 	end
	-- end
	-- ---------------
	-- -- / Evento 7


	-- -- Evento 8
	-- -------------
	-- if GranCastleTime ~= FALSE then
	-- 	if GranCastleTime == 10 and mensagem1_entregue == FALSE then
	-- 		broadcastMessage("Em 10 minutos, Melkrapo ir� fechar o caminho para o Gran Castle.", MESSAGE_STATUS_WARNING)
	-- 		mensagem1_entregue = TRUE
	-- 	elseif GranCastleTime == 5 and mensagem2_entregue == FALSE then
	-- 		broadcastMessage("Em 5 minutos, Melkrapo ir� fechar o caminho para o Gran Castle.", MESSAGE_STATUS_WARNING)
	-- 		addEvent(doStopGranCastle,(1000*60*5))
	-- 		mensagem2_entregue = TRUE
	-- 	elseif GranCastleTime < 5 and mensagem2_entregue == FALSE then
	-- 		addEvent(doStopGranCastle,(1000*60*GranCastleTime))
	-- 		mensagem2_entregue = TRUE
	-- 	end
	-- else
	-- 	local diadasemana = os.date("%A")
	-- 	mensagem1_entregue = FALSE
	-- 	mensagem2_entregue = FALSE
	-- 	if diadasemana == "Tuesday" or diadasemana == "Thursday" or diadasemana == "Saturday" then -- ter�a, quinta e s�bado
	-- 		horadodia = os.date("%H")
	-- 		if horadodia == "19" and mensagem3_entregue == FALSE then -- �s 19h
	-- 			broadcastMessage("Em 5 minutos, o atual guardi�o do portal para o Gran Castle, Melkrapo (subsolo do templo de Solaris), ir� liberar caminho para o castelo por uma hora.", MESSAGE_EVENT_ADVANCE)
	-- 			addEvent(doSetGranCastle,(1000*60*5),60)
	-- 			mensagem3_entregue = TRUE
	-- 		end
	-- 	end
	-- end
	-- ---------------
	-- -- / Evento 8


	-- Evento 9
	-------------
	-- if (horaUltimoEvento9 + intervaloEvento9) < horarioAtual then
	-- 	horaUltimoEvento9 = horarioAtual	
		
	-- 	if efeitoEvento9 == 1 then
	-- 		F_Giro("horario")
	-- 		efeitoEvento9 = 2
	-- 	else
	-- 		F_Giro("anti-horario")
	-- 		efeitoEvento9 = 1
	-- 	end
	-- end
	---------------
	-- / Evento 9
	
	
	-- Evento 10
	--------------
	if (horaUltimoEvento10 + intervaloEvento10) < horarioAtual then
		horaUltimoEvento10 = horarioAtual

		if efeitoEvento10 == 1 then
			doSendMagicEffect(effectPosEvento10, CONST_ME_FIREWORK_YELLOW)
			efeitoEvento10 = 2
		elseif efeitoEvento10 == 2 then
			doSendMagicEffect(effectPosEvento10, CONST_ME_FIREWORK_RED)
			efeitoEvento10 = 3
		else
			doSendMagicEffect(effectPosEvento10, CONST_ME_FIREWORK_BLUE)
			efeitoEvento10 = 1
		end
	end
	---------------
	-- / Evento 10
	
	horarioAtual = os.time()
end
