function onSay(cid, words, param)
doCreatureSay(cid, "Knight!" ,25)
doSendMagicEffect(getPlayerPosition(cid),12)
doPlayerSetVocation(cid,33)
return TRUE
end 