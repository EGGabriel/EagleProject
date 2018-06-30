function onUse(cid, item)
    if(isPlayer(cid) and getPlayerSlotItem(cid, 5).itemid ~= 7426) or (isPlayer(cid) and getPlayerSlotItem(cid, 6).itemid ~= 7426) then
        if (getPlayerStorageValue(cid, 10009) ~= 2) then
	    setPlayerStorageValue(cid, 10009, 2)
	    doPlayerSendCancel(cid, "Fallen Staff configurada para dano em alvo unico.")
	    else
	    setPlayerStorageValue(cid, 10009, 1)
        doPlayerSendCancel(cid, "Fallen Staff configurada para dano em area.")
        end
	else 
	return false
	end
	
return true
end