local config = {
   effectonuse = 14, -- efeito que sai
   levelsdodge = 100,  --- leveis que ter�o
   levelscritical = 100,
   storagedodge = 48902, -- storage que ser� verificado
   storagecritical = 48903
   }
   
function onUse(cid, item, frompos, item2, topos)
if getPlayerStorageValue(cid, config.storagedodge) < config.levelsdodge then
doRemoveItem(item.uid, 1)
doSendMagicEffect(topos,config.effectonuse)
doPlayerSendTextMessage(cid,22,"Voc� est� no n�vel de Dodge Skill: ["..(getPlayerStorageValue(cid, config.storagedodge)+1).."/100].")
setPlayerStorageValue(cid, config.storagedodge, getPlayerStorageValue(cid, config.storagedodge)+1)
elseif getPlayerStorageValue(cid, config.storagedodge) >= config.levelsdodge then
doPlayerSendTextMessage(cid,22,"Voc� est� no n�vel m�ximo de Dodge Skill.")
end
if getPlayerStorageValue(cid, config.storagecritical) < config.levelscritical then
doPlayerSendTextMessage(cid,22,"Voc� est� no n�vel de Critical Skill: ["..(getPlayerStorageValue(cid, config.storagecritical)+1).."/100].")
setPlayerStorageValue(cid, config.storagecritical, getPlayerStorageValue(cid, config.storagecritical)+1)
elseif getPlayerStorageValue(cid, config.storagecritical) >= config.levelscritical then
doPlayerSendTextMessage(cid,22,"Voc� est� no n�vel m�ximo de Critical Skill.")
end
return 1
end