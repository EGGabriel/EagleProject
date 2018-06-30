local function changex(cid)
doCreatureChangeOutfit(cid, {lookType = 12, lookHead = 0, lookBody = 132, lookLegs = 132, lookFeet = 114, lookTypeEx = 0, lookAddons = 0})
end
function onCastSpell(cid, var)
changex(cid)
end
