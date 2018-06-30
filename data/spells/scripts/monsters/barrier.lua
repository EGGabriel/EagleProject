function onCastSpell(cid, var)

local inteira = {lookType = 0, lookHead = 0, lookBody = 0, lookLegs = 0, lookFeet = 0, lookTypeEx = 3766, lookAddons = 0}
local quebrada = {lookType = 0, lookHead = 0, lookBody = 0, lookLegs = 0, lookFeet = 0, lookTypeEx = 3767, lookAddons = 0}

if (getCreatureHealth(cid) >= 25000) then
doSetCreatureOutfit(cid, inteira, 360000)
else
doSetCreatureOutfit(cid, quebrada, 360000)
end
return true
end

