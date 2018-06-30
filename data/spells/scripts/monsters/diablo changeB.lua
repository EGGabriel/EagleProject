local function changey(cid)
doCreatureChangeOutfit(cid, {lookType = 12, lookHead = 0, lookBody = 77, lookLegs = 77, lookFeet = 114, lookTypeEx = 0, lookAddons = 0})
end
function onCastSpell(cid, var)
changey(cid)
end
