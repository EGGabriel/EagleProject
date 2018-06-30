function onSay(cid, words, param)
doCreatureSay(cid, "Berserker!" ,25)
doSendMagicEffect(getPlayerPosition(cid),12)
setPlayerVocation(cid,31)
return TRUE
end 