function onSay(cid, words, param)
if getPlayerStorageValue(cid,10010) == 1 then
setPlayerStorageValue(cid,10010,0)
doSendMagicEffect(getPlayerPosition(cid),40)
doCreatureSay(cid, "AURA DESATIVADA!" ,19)
end
return TRUE
end 