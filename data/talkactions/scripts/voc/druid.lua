function onSay(cid, words, param)
doCreatureSay(cid, "Druid!" ,25)
doSendMagicEffect(getPlayerPosition(cid),12)
doPlayerSetVocation(cid,23)
return TRUE
end 