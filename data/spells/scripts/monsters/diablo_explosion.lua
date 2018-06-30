local areaA = createCombatArea(AREA_PIERCEDCIRCLE3X3A)
local areaB = createCombatArea(AREA_PIERCEDCIRCLE3X3B)

function furyAttackTarget(cid,target,pos)
if isCreature(cid) == true and isCreature(target) == true then
   doAreaCombatHealth(cid,COMBAT_FIREDAMAGE,pos,areaA,-200,-400,6)
   doAreaCombatHealth(cid,COMBAT_FIREDAMAGE,pos,areaB,-200,-400,36)
else 
return false 
end
return true
end

function onCastSpell(cid, var) 
local target = getCreatureTarget(cid)
k = 0
for k = 1, 6 do
    addEvent(furyAttackTarget,(k*500)+500,cid,target,{x = getCreaturePosition(target).x + math.random(-1,1), y = getCreaturePosition(target).y + math.random(-1,1), z = getCreaturePosition(target).z})
end
return true
end

