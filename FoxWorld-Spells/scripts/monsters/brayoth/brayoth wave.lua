--Spell By Jovial
local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_HITBYFIRE)
setCombatParam(combat, COMBAT_PARAM_CREATEITEM, 1494)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -0.5, 0, -1.0, 0)
local condition = createConditionObject(CONDITION_FIRE)
setConditionParam(condition, CONDITION_PARAM_DELAYED, 1)
for tmp = 1, 50 do
 addDamageCondition(condition, 1, 1000, -(51 - tmp))
end
setCombatCondition(combat, condition)
local area = createCombatArea(
 {
  {1, 1, 1, 1, 1},
  {1, 1, 1, 1, 1},
  {0, 1, 1, 1, 0},
  {0, 1, 1, 1, 0},
  {0, 0, 3, 0, 0}
 }
)
setCombatArea(combat, area)
function onCastSpell(cid, var)
 return doCombat(cid, combat, var)
end