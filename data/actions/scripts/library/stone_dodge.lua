local limite = 100 -- limite de dodge
local storagedodge = 48902 -- storage do dodge
 
function onUse(cid, item, fromPosition, itemEx, toPosition)
    if getPlayerStorageValue(cid, storagedodge) < 1 then
        doPlayerSetStorageValue(cid, storagedodge, (getPlayerStorageValue(cid, storagedodge)) + 2)
        doPlayerSendTextMessage(cid,22, " DodgeSKILL:["..getPlayerStorageValue(cid, storagedodge).."/"..limite.."].")
    elseif getPlayerStorageValue(cid, storagedodge) > 1  and getPlayerStorageValue(cid, storagedodge) <= limite then
        doPlayerSetStorageValue(cid, storagedodge, (getPlayerStorageValue(cid, storagedodge)) + 1)
        doPlayerSendTextMessage(cid,22, " DodgeSKILL:["..getPlayerStorageValue(cid, storagedodge).."/"..limite.."].")
        doRemoveItem(item.uid, 1)
    else
        doPlayerSendTextMessage(cid,22, "Voc� j� atingiu o n�vel m�ximo. DodgeSKILL:["..getPlayerStorageValue(cid, storagedodge).."/"..limite.."]")
    end
    return true
end