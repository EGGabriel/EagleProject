--Spell By Jovial
local acombat = createCombatObject()
local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_ENERGYAREA)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGYBALL)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -0.5, 0, -1.0, 0)

local area = createCombatArea(
 {
  {0, 0, 0, 1, 1, 1, 0, 0, 0},
  {0, 0, 1, 1, 1, 1, 1, 0, 0},
  {0, 1, 1, 1, 1, 1, 1, 1, 0},
  {1, 1, 1, 1, 1, 1, 1, 1, 1},
  {1, 1, 1, 1, 1, 1, 1, 1, 1},
  {1, 1, 1, 1, 1, 1, 1, 1, 1},
  {0, 1, 1, 1, 1, 1, 1, 1, 0},
  {0, 1, 1, 1, 1, 1, 1, 1, 0},
  {0, 0, 1, 1, 1, 1, 1, 0, 0},
  {0, 0, 0, 1, 3, 1, 0, 0, 0}
 }
)
setCombatArea(acombat, area)

local function Attack(p)
 if isCreature(p.cid) == FALSE then -- interrompe a magia se cid deslogar ou morrer
  return TRUE
 end
 doCombat(p.cid, p.combat, positionToVariant(p.pos))
end

function onTargetTile(cid, pos)
 if (math.random(0,3) >= 1) then
  addEvent(Attack, math.random(0, 1000), {cid = cid, combat = combat, pos = pos})
 end
end

setCombatCallback(acombat, CALLBACK_PARAM_TARGETTILE, "onTargetTile")

function onCastSpell(cid, var)
 return doCombat(cid, acombat, var)
end