local function changez(cid)
doCreatureChangeOutfit(cid, {lookType = 12, lookHead = 0, lookBody = 78, lookLegs = 78, lookFeet = 114, lookTypeEx = 0, lookAddons = 0})
end
function onCastSpell(cid, var)
changez(cid)
end
