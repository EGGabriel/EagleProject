local acombat = createCombatObject()
local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_STONES)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -0.0, 0, -0.0, 0)

local condition = createConditionObject(CONDITION_DRUNK)
setConditionParam(condition, CONDITION_PARAM_TICKS, 20000)
setCombatCondition(combat, condition)

local area = createCombatArea(
 {
  {0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0},
  {0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0},
  {0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0},
  {0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
  {0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
  {1, 1, 1, 1, 1, 1, 1, 1, 3, 1, 1, 1, 1, 1, 1, 1, 1},
  {0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
  {0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
  {0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0},
  {0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0},
  {0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0}
 }
)
setCombatArea(acombat, area)

local function AttackDown(p)
 if isCreature(p.cid) == FALSE then -- interrompe a magia se cid deslogar ou morrer
  return TRUE
 end
 doSendDistanceShoot({x = p.pos.x - 7, y = p.pos.y - 5, z = p.pos.z}, p.pos, CONST_ANI_LARGEROCK)
 doCombat(p.cid, p.combat, positionToVariant(p.pos))
end

local function AttackUP(p)
 if isCreature(p.cid) == FALSE then -- interrompe a magia se cid deslogar ou morrer
  return TRUE
 end
 local pos = getCreaturePosition(p.cid)
 doSendDistanceShoot(pos, {x = pos.x - math.random(6,8), y = pos.y - 5, z = pos.z}, CONST_ANI_LARGEROCK)
 addEvent(AttackDown, 3000, p)
end

function onTargetTile(cid, pos)
 if (math.random(0,3) >= 1) then
  addEvent(AttackUP, math.random(0, 1500), {cid = cid, combat = combat, pos = pos})
 end
end

setCombatCallback(acombat, CALLBACK_PARAM_TARGETTILE, "onTargetTile")

function onCastSpell(cid, var)
 return doCombat(cid, acombat, var)
end
