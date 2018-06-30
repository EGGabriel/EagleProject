function onUse(cid, item, fromPosition, itemEx, toPosition)

local removeOnUse = "yes" 
local days = 1 -- coloque os dias que serão a PREMIUM!

doPlayerAddPremiumDays(cid, days)
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Foi adicionado ".. days .." dia de PREMIUM na sua account.")

local quantity = getPlayerPremiumDays(cid)

doSendMagicEffect(getPlayerPosition(cid), math.random(28,30)) 
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você tem ".. quantity .." dia(s) de PREMIUM restante(s).")

if (removeOnUse == "yes") then
doRemoveItem(item.uid, 1)
end

return TRUE
end