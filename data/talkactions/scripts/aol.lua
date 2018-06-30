function onSay(cid, words, param)

if doPlayerRemoveMoney(cid, 20000) == TRUE then
doPlayerAddItem(cid, 2173, 1)
doCreatureSay(cid, "Amulet of Loss." ,19)
doSendMagicEffect(getCreaturePosition(cid),13)
else
doPlayerSendTextMessage(cid,22,"You do not have enough money, costs 20k.")
doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
end
end