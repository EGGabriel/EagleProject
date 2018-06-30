local acombat = createCombatObject()
local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 44)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -3.8, -60, -3.8, 2)
local area = createCombatArea(
{
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{1, 1, 1, 1, 1, 3, 1, 1, 1, 1, 1},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0}
}
)
setCombatArea(acombat, area)
local function AttackDown(p)
doSendDistanceShoot({x = p.pos.x - 7, y = p.pos.y - 5, z = p.pos.z}, p.pos, 11)
doCombat(p.cid, p.combat, positionToVariant(p.pos))
end
local function AttackUP(p)
local pos = getCreaturePosition(p.cid)
doSendDistanceShoot(pos, {x = pos.x - math.random(6,8), y = pos.y - 5, z = pos.z}, 44)
addEvent(AttackDown, 10, p)
end
function onTargetTile(cid, pos)
if (math.random(0,2) >= 1) then
addEvent(AttackUP, math.random(0, 500), {cid = cid, combat = combat, pos = pos})
end
end
setCombatCallback(acombat, CALLBACK_PARAM_TARGETTILE, "onTargetTile")
function onCastSpell(cid, var)
return doCombat(cid, acombat, var)
end