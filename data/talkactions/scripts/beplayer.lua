function onSay(cid, words, param)
if getPlayerGroupId(cid) >= 4 then
setPlayerGroupId(cid, 1)
doSendMagicEffect(getPlayerPosition(cid),30)
doPlayerSendOutfitWindow(cid)
return true
end
return false
end 