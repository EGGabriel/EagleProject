function onSay(cid, words, param)
doCreatureSay(cid, "Rogue!" ,25)
doSendMagicEffect(getPlayerPosition(cid),12)
doPlayerSetVocation(cid,13)
return TRUE
end 