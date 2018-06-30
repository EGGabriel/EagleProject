function onSay(cid, words, param)
doCreatureSay(cid, "Priest!" ,25)
doSendMagicEffect(getPlayerPosition(cid),12)
doPlayerSetVocation(cid,25)
return TRUE
end 