function onSay(cid, words, param)
doCreatureSay(cid, "Bard!" ,25)
doSendMagicEffect(getPlayerPosition(cid),12)
doPlayerSetVocation(cid,21)
return TRUE
end 