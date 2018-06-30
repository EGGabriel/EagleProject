local config = {
  mana = 600,
  seconds = 10,
  storage = 10022,
  semMana = "Você não tem mana suficiente.",
  msg = "Você precisa aguardar %d segundos para usar essa magia novamente.",
}

local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_DISPEL, CONDITION_POISON)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_POISONDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 54)
setAttackFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, 0.22, 0.22, 7, 7)

local condition2 = createConditionObject(CONDITION_POISON)
setConditionParam(condition2, CONDITION_PARAM_DELAYED, 1)
addDamageCondition(condition2, 5, 2500, -600)
setCombatCondition(combat2, condition2)

local condition2 = createConditionObject(CONDITION_PARALYZE)
setConditionParam(condition2, CONDITION_PARAM_TICKS, 10000)
setConditionFormula(condition2, -0.8, 0, -0.8, 0)
setCombatCondition(combat2, condition2)

local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_DISPEL, CONDITION_POISON)

local combat4 = createCombatObject()
setCombatParam(combat4, COMBAT_PARAM_TYPE, COMBAT_POISONDAMAGE)
setCombatParam(combat4, COMBAT_PARAM_EFFECT, 54)
 setAttackFormula(combat4, COMBAT_FORMULA_LEVELMAGIC, 0.22, 0.22, 7, 7)

local condition4 = createConditionObject(CONDITION_POISON)
setConditionParam(condition4, CONDITION_PARAM_DELAYED, 1)
addDamageCondition(condition4, 5, 2500, -600)
setCombatCondition(combat4, condition4)

local condition4 = createConditionObject(CONDITION_PARALYZE)
setConditionParam(condition4, CONDITION_PARAM_TICKS, 10000)
setConditionFormula(condition4, -0.8, 0, -0.8, 0)
setCombatCondition(combat4, condition4)

local combat10 = createCombatObject()
setCombatParam(combat10, COMBAT_PARAM_DISPEL, CONDITION_POISON)

local combat20 = createCombatObject()
setCombatParam(combat20, COMBAT_PARAM_TYPE, COMBAT_POISONDAMAGE)
setCombatParam(combat20, COMBAT_PARAM_EFFECT, 54)
setAttackFormula(combat20, COMBAT_FORMULA_LEVELMAGIC, 0.3, 0.3, 7, 7)

local condition20 = createConditionObject(CONDITION_POISON)
setConditionParam(condition20, CONDITION_PARAM_DELAYED, 1)
addDamageCondition(condition20, 5, 2500, -500)
setCombatCondition(combat20, condition20)

local condition20 = createConditionObject(CONDITION_PARALYZE)
setConditionParam(condition20, CONDITION_PARAM_TICKS, 10000)
setConditionFormula(condition20, -0.8, 0, -0.8, 0)
setCombatCondition(combat20, condition20)

local combat30 = createCombatObject()
setCombatParam(combat30, COMBAT_PARAM_DISPEL, CONDITION_POISON)

local combat40 = createCombatObject()
setCombatParam(combat40, COMBAT_PARAM_TYPE, COMBAT_POISONDAMAGE)
setCombatParam(combat40, COMBAT_PARAM_EFFECT, 54)
 setAttackFormula(combat40, COMBAT_FORMULA_LEVELMAGIC, 0.3, 0.3, 7, 7)

local condition40 = createConditionObject(CONDITION_POISON)
setConditionParam(condition40, CONDITION_PARAM_DELAYED, 1)
addDamageCondition(condition40, 5, 2500, -500)
setCombatCondition(combat40, condition40)

local condition40 = createConditionObject(CONDITION_PARALYZE)
setConditionParam(condition40, CONDITION_PARAM_TICKS, 10000)
setConditionFormula(condition40, -0.8, 0, -0.8, 0)
setCombatCondition(combat40, condition40)


arr1 = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0},
}

arr2 = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0},
}

arr3 = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0},
}

arr4 = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0},
}

arr10 = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0},
}

arr20 = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0},
}

arr30 = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0},
}

arr40 = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0},
}

local area1 = createCombatArea(arr1)
local area2 = createCombatArea(arr2)
local area3 = createCombatArea(arr3)
local area4 = createCombatArea(arr4)
local area10 = createCombatArea(arr10)
local area20 = createCombatArea(arr20)
local area30 = createCombatArea(arr30)
local area40 = createCombatArea(arr40)

setCombatArea(combat1, area1)
setCombatArea(combat2, area2)
setCombatArea(combat3, area3)
setCombatArea(combat4, area4)
setCombatArea(combat10, area10)
setCombatArea(combat20, area20)
setCombatArea(combat30, area30)
setCombatArea(combat40, area40)

function onCastSpell(cid, var)
  if getPlayerStorageValue(cid, config.storage) == -1 then
    setPlayerStorageValue(cid, config.storage, os.time()-config.seconds)
  end
  if config.seconds-(os.time()-getPlayerStorageValue(cid, config.storage)) > 0 then
    doPlayerSendCancel(cid, string.format(config.msg, config.seconds-(os.time()-getPlayerStorageValue(cid, config.storage))))
    return false
  end
  if getPlayerMana(cid) >= config.mana then
    doPlayerAddMana(cid, -config.mana)
    setPlayerStorageValue(cid, config.storage, os.time())
      if getPlayerStorageValue(cid,10033) >= 1 then
        addEvent(doCombat, 049, cid, combat3, var)
        addEvent(doCombat, 050, cid, combat4, var)
        addEvent(doCombat, 349, cid, combat1, var)
        addEvent(doCombat, 350, cid, combat2, var)
      else
        addEvent(doCombat, 049, cid, combat30, var)
        addEvent(doCombat, 050, cid, combat40, var)
        addEvent(doCombat, 349, cid, combat10, var)
        addEvent(doCombat, 350, cid, combat20, var)
      end
	return true
  else
	doPlayerSendCancel(cid, config.semMana)
              doSendMagicEffect(getPlayerPosition(cid),2)
  end
  return false
end
