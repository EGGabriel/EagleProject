function onUse(cid, item, frompos, item2, topos)
if item.uid == 7021 then
queststatus = getPlayerStorageValue(cid,7021)
if queststatus == -1 then
doPlayerSendTextMessage(cid,22,"You have found demon items, 10 crystal coins and a backpack.")
doPlayerAddItem(cid,2493,1 )
doPlayerAddItem(cid,2520,1 )
doPlayerAddItem(cid,2160,10 )
doPlayerAddItem(cid,10518,1 )
setPlayerStorageValue(cid,7021,1)
else
doPlayerSendTextMessage(cid,22,"The chest is empty.")
end
else
return 0
end
return 1
end 