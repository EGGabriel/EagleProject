-- Módulos padrão
-------------------------
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)    npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                        npcHandler:onThink()                        end
-------------------------
-- / Módulos padrão


-- Parte editável
---------------------

local talkState = {}

function creatureSayCallback(cid, type, msg)
    if(not npcHandler:isFocused(cid)) then -- testa se o jogador está falando com o NPC
        return FALSE
    end
        
    if talkState[cid] == nil then -- seta a variável responsável por ditar que parte da conversa ambos estão
        talkState[cid] = 1
    end

    if (msg == 'the volcano' and getPlayerStorageValue(cid, 5115) == 1 and getPlayerStorageValue(cid, 5116) < 300) then
        npcHandler:say('Quer ir para o The Volcano agora e continuar a task dos Blazing Spirits? Se sim, fale {travel}.', cid)
        talkState[cid] = 8
    end

    if (msg == 'the volcano' or msg == 'yes' or msg == 'sim') and talkState[cid] == 1 then
        if getPlayerStorageValue(cid,5115) >= 1 and getPlayerStorageValue(cid,5116) >= 300 then
            npcHandler:say('Você conseguiu? Você conseguiu mesmo? TOOOMA SEUS FILHOS DA #@%$! Como prometido, lhe encanto com o fogo que não queima permitindo que passe pela parede de fogo que da acessoa montanha. Se quiser ir para the volcano agora, só falar {travel}.', cid)
            setPlayerStorageValue(cid,5115,2)
            savePlayerStorage(cid)
        else
            npcHandler:say('Nasci e vivia em The Volcano, porém fui traído por aqueles malditos isqueiros! Me expulsaram só porque eu utilizava um {túnel proibido} para acessar o continente..', cid)
            talkState[cid] = 3
        end
    end
    
    if (msg == 'túnel proibido' or msg == 'tunel proibido') and talkState[cid] == 3 then
        npcHandler:say('Existe uma maneira de acessar nossa ilha por dentro do mar, um túnel interliga a ilha ao continente. Tenho uma proposta pra você e posso ti levar até a ilha. Quer {saber mais}?', cid)
        talkState[cid] = 4
    end
    
    if (msg == 'saber mais') and talkState[cid] == 4 then
        npcHandler:say('Quero que elimine, mate, extermine, o máximo de Blazing Spirits possível, quero ver essa raça cair e não me importo com sua extinção. Se apagar 300 da minha espécie, MENOS EU, ensinarei você a acessar a montanha dentro da ilha, aumentando seu respaw e melhorando suas hunts. {Aceita}?', cid)
        talkState[cid] = 5
    end

    if (msg == 'aceita' or msg == 'aceito' or msg == 'yes' or msg == 'sim') and talkState[cid] == 5 then
        setPlayerStorageValue(cid,5115,1) -- indica que o jogador aceitou a quest
        setPlayerStorageValue(cid,5116,0)
        savePlayerStorage(cid)
        npcHandler:say('Acordo fechado! Volte aqui com as cinzas daqueles miseráveis. Se quiser ir agora para o The Volcano, só falar {travel}.', cid)
        talkState[cid] = 7
    end
    if (msg == 'travel') and talkState[cid] == 7 then
        local destino = {x=1236, y=582, z=7} -- inicio da hunt para fazer a task
        doTeleportThing(cid,destino)
        doSendMagicEffect(destino,CONST_ME_TELEPORT)
        npcHandler:releaseFocus(cid)
    end
    
    if (getPlayerStorageValue(cid,5115) == 2 and msg == 'the volcano') then
        npcHandler:say('Quando quiser ir para The Volcano sem conversa fiada, fale {travel} a qualquer momento que ti levo até lá.', cid)
        talkState[cid] = 6
    end
    if (msg == 'travel') and talkState[cid] == 6 then
        local destino = {x=1236, y=582, z=7} -- inicio da hunt para fazer a task
        doTeleportThing(cid,destino)
        doSendMagicEffect(destino,CONST_ME_TELEPORT)
        npcHandler:releaseFocus(cid)
    end
    if (getPlayerStorageValue(cid,5115) == 2 and msg == 'travel' and talkState[cid] == 1) then
        local destino = {x=1236, y=582, z=7} -- inicio da hunt para fazer a task
        doTeleportThing(cid,destino)
        doSendMagicEffect(destino,CONST_ME_TELEPORT)
        npcHandler:releaseFocus(cid)
    end
    if (msg == 'travel' or msg == 'yes' or msg == 'sim') and talkState[cid] == 8 then
        local destino = {x=1236, y=582, z=7} -- inicio da hunt para fazer a task
        doTeleportThing(cid,destino)
        doSendMagicEffect(destino,CONST_ME_TELEPORT)
        npcHandler:releaseFocus(cid)
    end
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)

-----------------------
-- / Parte editável
npcHandler:addModule(FocusModule:new())