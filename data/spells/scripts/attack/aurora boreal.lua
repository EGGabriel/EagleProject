local areaA = createCombatArea(AREA_PIERCEDCIRCLE3X3A)
local areaB = createCombatArea(AREA_PIERCEDCIRCLE3X3B)
local areaC = createCombatArea(AREA_CROSS1X1)

function furyAttackcid(cid,pos)
p = {11, 47, 48}
A = math.random(1, 3)
B = math.random(1, 3)
C = math.random(1, 3)
min = (getPlayerLevel(cid) * 2.5)
max = (getPlayerLevel(cid) * 3)
if isCreature(cid) == true then
   doAreaCombatHealth(cid,COMBAT_AIRDAMAGE,pos,areaA,-min,-max,p[A])   
   doAreaCombatHealth(cid,COMBAT_AIRDAMAGE,pos,areaB,-min,-max,p[B])
   doAreaCombatHealth(cid,COMBAT_AIRDAMAGE,pos,areaC,-min,-max,p[C])
else 
return false 
end
return true
end

function onCastSpell(cid, var) 
k = 0
furyAttackcid(cid, {x = getCreaturePosition(cid).x + math.random(-1,1), y = getCreaturePosition(cid).y + math.random(-1,1), z = getCreaturePosition(cid).z})
for k = 1, 4 do   
    addEvent(furyAttackcid,(k*800),cid,{x = getCreaturePosition(cid).x + math.random(-1,1), y = getCreaturePosition(cid).y + math.random(-1,1), z = getCreaturePosition(cid).z})
end
return true
end

