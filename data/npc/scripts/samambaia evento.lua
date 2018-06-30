local focus = 0
local talk_start = 0
local target = 0
local days = 0

 -- Tipo de Mensagens
local red = MESSAGE_STATUS_WARNING
local red2 = MESSAGE_STATUS_CONSOLE_RED
local orange = MESSAGE_STATUS_CONSOLE_ORANGE
local white = MESSAGE_EVENT_ADVANCE
local white2 = MESSAGE_EVENT_DEFAULT
local green = MESSAGE_INFO_DESCR
local small = MESSAGE_STATUS_SMALL
local default = MESSAGE_STATUS_DEFAULT
local blue = MESSAGE_STATUS_CONSOLE_BLUE
 -- /Tipo de Mensagens

stime1 = 90 -- 1 minuto e meio -- Tempo entre as execuções do comando (em segundos).
time1 = os.clock()
stime2 = 60*1 -- 1 minuto -- Tempo entre as execuções do comando (em segundos).
time2 = os.clock()

mensagens = math.random(1,4)

function onThink()
	
	if (os.clock() - talk_start) > 30 then
  		if focus > 0 then
  			selfSay('Demoro...')
  		end
  		focus = 0
  	end
 	if focus ~= 0 then
 		if getDistanceToCreature(focus) > 5 then
 			selfSay('Tah vai ti embora.')
 			focus = 0
 		end
 	end

	--Primeira ação
	if (time1 + stime1) < os.clock() then
		time1 = os.clock()
		
		-- mensagens irão ser em sequência 1, 2, 3 e 4 depois volta pro 1
		if mensagens == 1 then
			-- mensagem1
				broadcastMessage("Evento de Super Respaw rolando agora!!!", green)
				broadcastMessage("Todas as criaturas renascem na metade do tempo!", white)
			-- /mensagen1
			mensagens = 2
		elseif mensagens == 2 then
			-- mensagem2
				broadcastMessage("Evento de Super Respaw rolando agora!!!", green)
				broadcastMessage("Todas as criaturas renascem na metade do tempo!", white)
			--/mensagem2
			mensagens = 3
		elseif mensagens == 3 then
			--mensagem3
				broadcastMessage("Evento de Super Respaw rolando agora!!!", green)
				broadcastMessage("Todas as criaturas renascem na metade do tempo!", white)
			--/mensagem3
			mensagens = 4
		else
			--mensagem4
				broadcastMessage("Evento de Super Respaw rolando agora!!!", green)
				broadcastMessage("Todas as criaturas renascem na metade do tempo!", white)
			--/mensagem4
			mensagens = 1
		end
	end

	--Segunda ação
	if (time2 + stime2) < os.clock() then
		time2 = os.clock()
		fala=math.random(1,8)

		if fala == 1 then
			selfSay('To aqui soh pra enfeita u templo.')
		elseif fala == 2 then
			selfSay('Cade meu biquini di baixu? ;o~')
		elseif fala == 3 then
			selfSay('Quem min der CRAW to tirandu fotu i vai si entender com u meu Yang!')
		elseif fala == 4 then
			selfSay('Noxu ssite eah http://foxworld.servegame.com')
		elseif fala == 5 then
			selfSay('Noxu blog eah http://foxworldserver.blogspot.com')
		elseif fala == 6 then
			selfSay('Quer conhecer a equipe du FoxWorld?! Vai nu site i clique eim "Nossa Equipe" no menu =*')
		elseif fala == 7 then
			selfSay('Moxinhus e moxinhas temus comu no Orkut tambein: http://www.orkut.com/Community.aspx?cmm=50549866')
		else
			selfSay('Temus treiners em Solaris, Asauchi e Versia! Chique neah?!')	
		end
	end
end
