function onCastSpell(cid, var)

target = getCreatureTarget(cid)
playerpos = getCreaturePosition(cid)
targetpos = getCreaturePosition(target)

if targetpos.x >= playerpos.x - 2 and targetpos.x <= playerpos.x + 2 and targetpos.y <= playerpos.y and targetpos.z == playerpos.z then
doSetItemOutfit(cid, 3741, -1)
elseif targetpos.x >= playerpos.x - 2 and targetpos.x <= playerpos.x + 2 and targetpos.y >= playerpos.y and targetpos.z == playerpos.z then
doSetItemOutfit(cid, 3739, -1)
elseif targetpos.x <= playerpos.x and targetpos.y >= playerpos.y - 2 and targetpos.y <= playerpos.y + 2 and targetpos.z == playerpos.z then
doSetItemOutfit(cid, 3742, -1)
elseif targetpos.x >= playerpos.x and targetpos.y <= playerpos.y + 2 and targetpos.y >= playerpos.y - 2 and targetpos.z == playerpos.z then
doSetItemOutfit(cid, 3740, -1)
elseif targetpos.x < playerpos.x - 2 and targetpos.y < playerpos.y - 2 and targetpos.z == playerpos.z then
doSetItemOutfit(cid, 3741, -1)
elseif targetpos.x > playerpos.x + 2 and targetpos.y < playerpos.y - 2 and targetpos.z == playerpos.z then
doSetItemOutfit(cid, 3741, -1)
elseif targetpos.x < playerpos.x - 2 and targetpos.y > playerpos.y + 2 and targetpos.z == playerpos.z then
doSetItemOutfit(cid, 3739, -1)
elseif targetpos.x > playerpos.x + 2 and targetpos.y > playerpos.y + 2 and targetpos.z == playerpos.z then
doSetItemOutfit(cid, 3739, -1)
end
return TRUE
end