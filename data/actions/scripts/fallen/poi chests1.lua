function onUse(cid, item, frompos, item2, topos)

if item.uid == 7095 then
    if getPlayerStorageValue(cid,7095) == -1 then
    doPlayerSendTextMessage(cid,22,"You have found a frozen starlight.")
    doPlayerAddItem(cid,2361,1 )
    setPlayerStorageValue(cid,7095,1)
    return true
    end

elseif item.uid == 7096 then
    if getPlayerStorageValue(cid,7096) == -1 then
    doPlayerSendTextMessage(cid,22,"You have found a silver goblet.")
    doPlayerAddItem(cid,5806,1 )
    setPlayerStorageValue(cid,7096,1)
    return true
    end
	
elseif item.uid == 7097 then
    if getPlayerStorageValue(cid,7097) == -1 then
    doPlayerSendTextMessage(cid,22,"You have 200 crystal coins.")
    doPlayerAddItem(cid,2160,100)
    doPlayerAddItem(cid,2160,100)
    setPlayerStorageValue(cid,7097,1)
    return true
    end
	
elseif item.uid == 7098 then
    if getPlayerStorageValue(cid,7098) == -1 then
    doPlayerSendTextMessage(cid,22,"You have found a pair of soft boots.")
    doPlayerAddItem(cid,6132,1 )
    setPlayerStorageValue(cid,7098,1)
    return true
    end
end

doPlayerSendTextMessage(cid,22,"The chest is empty.")
return true
end 