local lvlcrit = 48903
local multiplier = 2

function onStatsChange(cid, attacker, type, combat, value)
if (type == STATSCHANGE_HEALTHLOSS or type == STATSCHANGE_MANALOSS) and isPlayer(attacker) and isCreature(cid) then
if (getPlayerStorageValue(attacker, lvlcrit)*2.5) >= math.random (0,1000) then
value = math.floor(value * multiplier)
doSendAnimatedText(getCreaturePos(cid), "CRITICAL!!", 144)
doTargetCombatHealth(attacker, cid, combat, -value, -value, 255)
return false
end
end
return true
end