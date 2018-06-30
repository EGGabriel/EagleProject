--Spell By Jovial
local acombat = createCombatObject()
local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_FIREAREA)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_FIRE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -0.5, 0, -1.0, 0)

local area = createCombatArea(
 {
  {1, 1, 1, 1, 1, 1, 1},
  {1, 1, 1, 1, 1, 1, 1},
  {1, 1, 1, 1, 1, 1, 1},
  {0, 1, 1, 1, 1, 1, 0},
  {0, 0, 1, 3, 1, 0, 0}
 }
)
setCombatArea(acombat, area)

local function Attack(p)
  doCombat(p.cid, p.combat, positionToVariant(p.pos))
end

function onTargetTile(cid, pos)
  if (math.random(0,2) >= 1) then
	addEvent(Attack, 1, {cid = cid, combat = combat, pos = pos})
  end
end

setCombatCallback(acombat, CALLBACK_PARAM_TARGETTILE, "onTargetTile")

function onCastSpell(cid, var)
  return doCombat(cid, acombat, var)
end
