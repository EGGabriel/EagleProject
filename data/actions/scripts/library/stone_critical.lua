local limite = 100 -- limite de dodge
local storagedodge = 48903 -- storage do dodge
 
function onUse(cid, item, fromPosition, itemEx, toPosition)
    if getPlayerStorageValue(cid, storagedodge) == -1 then
        doPlayerSetStorageValue(cid, storagedodge, (getPlayerStorageValue(cid, storagedodge)) + 2)
        doPlayerSendTextMessage(cid,22, "Critical Skill: ["..getPlayerStorageValue(cid, storagedodge).."/"..limite.."].")
    elseif getPlayerStorageValue(cid, storagedodge) >= 0  and getPlayerStorageValue(cid, storagedodge) <= limite then
        doPlayerSetStorageValue(cid, storagedodge, (getPlayerStorageValue(cid, storagedodge)) + 1)
        doPlayerSendTextMessage(cid,22, "Critical Skill: ["..getPlayerStorageValue(cid, storagedodge).."/"..limite.."].")
        doRemoveItem(item.uid, 1)
    else
        doPlayerSendTextMessage(cid,22, "Você já atingiu o nível máximo. Critical Skill: ["..getPlayerStorageValue(cid, storagedodge).."/"..limite.."]")
    end
    return true
end