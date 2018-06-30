function onSay(cid, words, param)
doCreatureSay(cid, "Paladin!" ,25)
doSendMagicEffect(getPlayerPosition(cid),12)
doPlayerSetVocation(cid,11)
return TRUE
end 