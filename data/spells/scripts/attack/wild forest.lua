local config = {
  mana = 1000,
  seconds = 20,
  storage = 10,
  semMana = "You do not have enough mana.",
  msg = "Você precisa aguardar %d segundos para usar a magia Wild Forest novamente.",
}

local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_CREATEITEM, 1499)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_DISTANCEEFFECT, 29)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 54)
setAttackFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, 0.16, 0.16, 7, 7)
local condition2 = createConditionObject(CONDITION_POISON)
setConditionParam(condition2, CONDITION_PARAM_DELAYED, 1)
addDamageCondition(condition2, 10, 1000, -100)
setCombatCondition(combat2, condition2)

arr1 = {
{1, 1, 1},
{1, 3, 1},
{1, 0, 1},
}

arr2 = {
{0, 1, 0},
{0, 2, 0},
{0, 0, 0},
}

local area1 = createCombatArea(arr1)
local area2 = createCombatArea(arr2)

setCombatArea(combat1, area1)
setCombatArea(combat2, area2)

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
    addEvent(doCombat, 0, cid, combat1, var)
    addEvent(doCombat, 0, cid, combat2, var)
	return true
  else
	doPlayerSendCancel(cid, config.semMana)
    doSendMagicEffect(getPlayerPosition(cid),2)
	return false
  end
  return false
end
