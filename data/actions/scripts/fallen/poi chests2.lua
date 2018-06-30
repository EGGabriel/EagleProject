function onUse(cid, item, frompos, item2, topos)

if item.uid == 7092 then
    if getPlayerStorageValue(cid,7092) == -1 then
    doPlayerSendTextMessage(cid,22,"You have found a blessed sceptre.")
    doPlayerAddItem(cid,7429,1 )
    setPlayerStorageValue(cid,7092,1)
    return true
    end
elseif item.uid == 7093 then
    if getPlayerStorageValue(cid,7092) == -1 then
    doPlayerSendTextMessage(cid,22,"You have found a flame blade.")
    doPlayerAddItem(cid,8931,1 )
    setPlayerStorageValue(cid,7092,1)
    return true
    end
elseif item.uid == 7094 then	
    if getPlayerStorageValue(cid,7092) == -1 then
    doPlayerSendTextMessage(cid,22,"You have a warsinger bow and 50 crystal coin.")
    doPlayerAddItem(cid,8854,1)
    doPlayerAddItem(cid,2160,50)
    setPlayerStorageValue(cid,7092,1)
    return true
    end
end

doPlayerSendTextMessage(cid,22,"The chest is empty.")
return false
end 