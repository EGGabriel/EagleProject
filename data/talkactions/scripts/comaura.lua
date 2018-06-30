function onSay(cid, words, param)
if getPlayerStorageValue(cid,10010) < 1 then
setPlayerStorageValue(cid,10010,1)
doSendMagicEffect(getPlayerPosition(cid),40)
doCreatureSay(cid, "AURA ATIVA!" ,19)
end
return TRUE
end 