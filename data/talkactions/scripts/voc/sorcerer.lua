function onSay(cid, words, param)
doCreatureSay(cid, "Sorcerer!" ,25)
doSendMagicEffect(getPlayerPosition(cid),12)
doPlayerSetVocation(cid,27)
return TRUE
end 