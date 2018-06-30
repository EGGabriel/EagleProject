---------------                                                   
-----BY PC98-------  
  ---------------                                                   
         
function onUse(cid, item, frompos, item2, topos) 

-------------------------Config-----------------------------------------------------------------

door_opened = 1230                             -- ID da porta aberta
storage_guild = getGlobalStorageValue(123123)  -- A 3ª storage configurada em Castle.lua

guarda_ativ = 0       -- Caso um invasor tente abrir a porta, sumonar o Monstro "Guarda"??  | (1) = SIM  (0) = NAO
guarda_cont = 2                                 -- Caso ativo: a quantidade de guardas a sumonar
guarda_pos = {x=123,y=123,y=7}                  -- Posiçao a ser sumonada os guardas!

-------------------------Fim de Config-----------------------------------------------------------


if getPlayerGuildId(cid) == storage_guild then
   doTeleportThing(cid,getThingPos(item.uid))
   doTransformItem(item.uid, door_opened)
   doPlayerSendTextMessage(cid, 22, "Seja bem vindo a vosso castelo!")   
   return TRUE
else
    if guarda_ativ == 1 then
       doPlayerSendTextMessage(cid, 22, "Guaaaardas, tirem esses invasores daqui!!")
        for i=1, guarda_cont do
            doSummonCreature("Guarda", guarda_pos)
        end
    return FALSE
    else
    doPlayerSendTextMessage(cid, 22, "So Pode Passar Quem For Da Guild Atual Dona do Castle24Horas")
    return FALSE
    end
end
end