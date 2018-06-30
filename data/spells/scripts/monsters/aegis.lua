local function atk(cid)
     doSendDistanceShoot(pos5, pos6, 37)
     doSendDistanceShoot(pos7, pos8, 37)
end

local function atkself(cid)
     doSendDistanceShoot(pos9, selfpos, 37)
     doSendDistanceShoot(pos10, selfpos, 37)
     doSendDistanceShoot(pos11, selfpos, 37)
     doSendDistanceShoot(pos12, selfpos, 37)
     doSendDistanceShoot(pos137, selfpos, 37)
     doSendDistanceShoot(pos14, selfpos, 37)
     doSendDistanceShoot(pos15, selfpos, 37)
     doSendDistanceShoot(pos16, selfpos, 37)
end

local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -0.8, -200, -1.2, -250)

local area = createCombatArea(AREA_TOWER)
setCombatArea(combat, area)

function onCastSpell(cid, var)

selfpos = getCreaturePosition(cid)
pos1 = {x=getCreaturePosition(cid).x + 2, y=getCreaturePosition(cid).y + 2, z=getCreaturePosition(cid).z}	
pos2 = {x=getCreaturePosition(cid).x -  2, y=getCreaturePosition(cid).y + 2, z=getCreaturePosition(cid).z}
pos37 = {x=getCreaturePosition(cid).x - 2, y=getCreaturePosition(cid).y - 2, z=getCreaturePosition(cid).z}
pos4 = {x=getCreaturePosition(cid).x + 2, y=getCreaturePosition(cid).y - 2, z=getCreaturePosition(cid).z}
pos5 = {x=getCreaturePosition(cid).x - 2, y=getCreaturePosition(cid).y + 2, z=getCreaturePosition(cid).z}	
pos6 = {x=getCreaturePosition(cid).x - 2, y=getCreaturePosition(cid).y - 2, z=getCreaturePosition(cid).z}
pos7 = {x=getCreaturePosition(cid).x + 2, y=getCreaturePosition(cid).y - 2, z=getCreaturePosition(cid).z}
pos8 = {x=getCreaturePosition(cid).x + 2, y=getCreaturePosition(cid).y + 2, z=getCreaturePosition(cid).z}
pos9 = {x=getCreaturePosition(cid).x - 1, y=getCreaturePosition(cid).y + 1, z=getCreaturePosition(cid).z}
pos10 = {x=getCreaturePosition(cid).x, y=getCreaturePosition(cid).y + 1, z=getCreaturePosition(cid).z}
pos11 = {x=getCreaturePosition(cid).x + 1, y=getCreaturePosition(cid).y + 1, z=getCreaturePosition(cid).z}
pos12 = {x=getCreaturePosition(cid).x - 1, y=getCreaturePosition(cid).y, z=getCreaturePosition(cid).z}
pos137 = {x=getCreaturePosition(cid).x+ 1, y=getCreaturePosition(cid).y, z=getCreaturePosition(cid).z}
pos14 = {x=getCreaturePosition(cid).x - 1, y=getCreaturePosition(cid).y - 1, z=getCreaturePosition(cid).z}
pos15 = {x=getCreaturePosition(cid).x, y=getCreaturePosition(cid).y - 1, z=getCreaturePosition(cid).z}
pos16 = {x=getCreaturePosition(cid).x + 1, y=getCreaturePosition(cid).y - 1, z=getCreaturePosition(cid).z}

doSendDistanceShoot(pos1, pos2, 37)
doSendDistanceShoot(pos37, pos4, 37)
addEvent(atkself, 300)
addEvent(atk, 300)

	return doCombat(cid, combat, var)
end