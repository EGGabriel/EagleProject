function onSay(cid, words, param)
doPlayerSendTextMessage(cid,22,"Você está no nível de Dodge Skill: ["..getPlayerStorageValue(cid, 48902).."/100].")
doPlayerSendTextMessage(cid,22,"Você está no nível de Critical Skill: ["..getPlayerStorageValue(cid, 48913).."/100].")
return TRUE
end 