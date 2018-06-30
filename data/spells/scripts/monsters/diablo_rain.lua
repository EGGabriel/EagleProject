local waves = 50 --- numero de vezes que vão cair os meteoros
local fire = {490, 491, 492, 493, 4608, 4609, 4610, 4611, 4612, 4613, 4614, 4615, 4616, 4617, 4618, 4619, 4620, 4621, 4622, 4623, 4624, 4625}

local combat = createCombatObject()
local meteor = createCombatObject()
setCombatParam(meteor, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(meteor, COMBAT_PARAM_EFFECT, 36)

local meteor_fire = createCombatObject()
setCombatParam(meteor_fire, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(meteor_fire, COMBAT_PARAM_EFFECT, 36)

combat_arr = {
{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 3, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0}
}

local combat_area = createCombatArea(combat_arr)
setCombatArea(combat, combat_area)

local function meteorCast(p)
doCombat(p.cid, p.combat, positionToVariant(p.pos))
end

function onTargetTile(cid, pos)
if isCreature(cid) == true then
if (math.random(0, 6) == 6) then
local ground = getThingfromPos({x = pos.x, y = pos.y, z = pos.z, stackpos = 0})
if (isInArray(fire, ground.itemid) == TRUE) then
local newpos = {x = pos.x - 7, y = pos.y - 6, z = pos.z}
doSendDistanceShoot(newpos, pos, CONST_ANI_FIRE)
addEvent(meteorCast, 150, {cid = cid, pos = pos, combat = meteor_fire})
doAreaCombatHealth(cid,COMBAT_FIREDAMAGE,newpos,area,-100,-200,36)
else
local newpos = {x = pos.x - 7, y = pos.y - 6, z = pos.z}
doSendDistanceShoot(newpos, pos, CONST_ANI_FIRE)
addEvent(meteorCast, 150, {cid = cid,pos = pos, combat = meteor})
doAreaCombatHealth(cid,COMBAT_FIREDAMAGE,newpos,area,-100,-200,36)
end
end
end
end
setCombatCallback(combat, CALLBACK_PARAM_TARGETTILE, "onTargetTile")

function onCastSpell(cid, var)

for i = 0, waves do
addEvent(function()
doCombat(cid, combat, var)
end, 150 * i)
end

return false
end




