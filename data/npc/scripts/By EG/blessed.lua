local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

NpcSystem.parseParameters(npcHandler)

local talkState = {}

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end
function creatureSayCallback(cid, type, msg)

	if(not npcHandler:isFocused(cid)) then
		return false
	end

local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

	if(msgcontains(msg, 'velho')) then
		selfSay('Ao Longo dos anos o Pharao Helmet, tem sido muito cobicado por todos os seres do Foxworld.', cid) 
		selfSay('E por ao longo de varios anos no deserto estudando todos os fenomenos para defender Versia, eu decobri uma maneira de deixa-lo mais forte!', cid)
		selfSay('Eu posso usar uma magia para melhorar o seu Pharao Helmet facilmente, contanto que me de uma {ajudinha} em uma coisa', cid) 
		setPlayerStorageValue(cid, 697, 0)
		return true
	end
-----------------------------------------------------------------	
	if(msgcontains(msg, 'ajudinha')) then
        selfSay('Ao norte de VERSIA, existe uma criatura chamada Witch Doctor, onde ele esta causando um CAOS la!', cid)
        selfSay('Preciso que um bravo guerreiro consiga mata-lo, para restaurar o paz de toda cidade!', cid)
        selfSay('Voce Aceita essa {tarefa}?', cid)
		return true
	end
-----------------------------------------------------------------
	if(msgcontains(msg, 'tarefa')) then
        selfSay('Agora, voce pode tentar matar o Witch Doctor e retomar a paz de VERSIA.', cid)
        setPlayerStorageValue(cid, 698, 1)
        setPlayerStorageValue(cid, 696, 1)
		return true
	end
-----------------------------------------------------------------
	if(msgcontains(msg, 'blessar')) and (getPlayerStorageValue(cid,697) == 1)  then
        selfSay('Voce ja ganhou minha magia secreta, relogue se quiser adicionala novamente!', cid)
		return true
	end
-----------------------------------------------------------------
	if(msgcontains(msg, 'blessar')) and getPlayerSlotItem(cid, CONST_SLOT_HEAD).itemid ~= 2342 then
        	selfSay('Voce precisa de estar com um pharao helmet na cabeca!', cid)
		return true
	end
-----------------------------------------------------------------
	if (msgcontains(msg, 'blessar')) and (getPlayerStorageValue(cid,699) == 1) and (doPlayerRemoveItem(cid, 2342, 1) == TRUE) then
		doPlayerAddItem(cid, 2343)
		selfSay('Voce blessou seu pharao helmet!', cid)
		setPlayerStorageValue(cid, 697, 1)
		return true
	end
-----------------------------------------------------------------
	if(msgcontains(msg, 'blessar')) then
        selfSay('Voce ainda nao matou o Witch Doctor!', cid)
		return true
	end
-----------------------------------------------------------------	
end    

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())