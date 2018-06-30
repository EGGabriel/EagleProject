local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)			npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()					npcHandler:onThink()					end

function creatureSayCallback(cid, type, msg)

	local armaleft = (getPlayerSlotItem(cid, 5).itemid)
	local armaright = (getPlayerSlotItem(cid, 6).itemid)
	local xaxes = {7878,7753,7772,7863,7436} 
    local xclubs = {7881,7756,7775,7866,7415} 
    local xswords = {7872,7747,7766,7857,7406} 

	if(not npcHandler:isFocused(cid)) then
		return FALSE
	end

	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

	if (msgcontains(msg, 'transformar')) then
         if (isInArray({7878,7753,7772,7863,7436}, armaleft) == 1) then 
		 arma = armaleft
		 w = 1
		 talkState[talkUser] = 1
		 selfSay("Hehe... Vejamos... Posso transformar a sua Aura Weapon utilizando {energia}, {fogo}, {gelo}, {terra}, ou posso {remover} o elemento se preferir... Agora vamos vamos, escolha!", cid)	
		 elseif (isInArray({7878,7753,7772,7863,7436}, armaright ) == 1) then 
		 arma = armaright
		 w = 1
		 talkState[talkUser] = 1
         selfSay("Hehe... Vejamos... Posso transformar a sua Aura Weapon utilizando {energia}, {fogo}, {gelo}, {terra}, ou posso {remover} o elemento se preferir... Agora vamos vamos, escolha!", cid)				 
		 elseif (isInArray({7881,7756,7775,7866,7415} , armaleft ) == 1) then
		 arma = armaleft
		 w = 2
		 talkState[talkUser] = 1
         selfSay("Hehe... Vejamos... Posso transformar a sua Aura Weapon utilizando {energia}, {fogo}, {gelo}, {terra}, ou posso {remover} o elemento se preferir... Agora vamos vamos, escolha!", cid)		
         elseif (isInArray({7881,7756,7775,7866,7415} , armaright ) == 1) then
		 arma = armaright
		 w = 2
		 talkState[talkUser] = 1
         selfSay("Hehe... Vejamos... Posso transformar a sua Aura Weapon utilizando {energia}, {fogo}, {gelo}, {terra}, ou posso {remover} o elemento se preferir... Agora vamos vamos, escolha!", cid)		
		 elseif (isInArray({7872,7747,7766,7857,7406} , armaleft ) == 1) then
		 arma = armaleft
		 w = 3
		 talkState[talkUser] = 1
         selfSay("Hehe... Vejamos... Posso transformar a sua Aura Weapon utilizando {energia}, {fogo}, {gelo}, {terra}, ou posso {remover} o elemento se preferir... Agora vamos vamos, escolha!", cid)	
		 elseif (isInArray({7872,7747,7766,7857,7406} , armaright ) == 1) then
		 arma = armaright
		 w = 3
		 talkState[talkUser] = 1
         selfSay("Hehe... Vejamos... Posso transformar a sua Aura Weapon utilizando {energia}, {fogo}, {gelo}, {terra}, ou posso {remover} o elemento se preferir... Agora vamos vamos, escolha!", cid)		
	     else
	     selfSay("Você não está empunhando uma Aura Weapon de Knight.", cid)	
	     talkState[talkUser] = 0
	     return true
	     end
    end	 
	   
	     if (msgcontains(msg, 'energia') or (msgcontains(msg, 'energy'))) and talkState[talkUser] == 1 then
	     escolha = 1
		 talkState[talkUser] = 2
	     elseif (msgcontains(msg, 'fogo') or (msgcontains(msg, 'fire'))) and talkState[talkUser] == 1 then
	     escolha = 2
		 talkState[talkUser] = 2
	     elseif (msgcontains(msg, 'gelo') or (msgcontains(msg, 'ice'))) and talkState[talkUser] == 1 then
	     escolha = 3
		 talkState[talkUser] = 2
	     elseif (msgcontains(msg, 'terra') or (msgcontains(msg, 'earth'))) and talkState[talkUser] == 1 then
	     escolha = 4
		 talkState[talkUser] = 2
	     elseif msgcontains(msg, 'remove') and talkState[talkUser] == 1 then
	     escolha = 5
		 talkState[talkUser] = 2
	     end	 
	     
         if talkState[talkUser] == 2 and w >= 1 then
         doPlayerRemoveItem(cid, arma, 1)	
	     if w == 1 and talkState[talkUser] == 2 then	 
         doPlayerAddItem(cid, xaxes[escolha], 1)
	     elseif w == 2 and talkState[talkUser] == 2 then	 
	     doPlayerAddItem(cid, xclubs[escolha], 1)
	     elseif w == 3 and talkState[talkUser] == 2 then	 
	     doPlayerAddItem(cid, xswords[escolha], 1)
	     end
	     doSendMagicEffect(getThingPos(cid), 14)  
	     selfSay("Aqui está nobre Knight! Boa sorte em suas batalhas.", cid)	
		 talkState[talkUser] = 0
		 return TRUE
		 end
		  
return TRUE
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())