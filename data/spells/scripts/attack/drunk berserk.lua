local config = {
  mana = 750,
  seconds = 12,
  storage = 10050,
  semMana = "You do not have enough mana.",
  msg = "You must wait %d seconds before casting this spell again.",
}

local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 31)
setAttackFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 0.4, 0.4, 10, 10)

local condition = createConditionObject(CONDITION_DRUNK)
setConditionParam(condition, CONDITION_PARAM_TICKS, 4000)
setCombatCondition(combat, condition)

local area = createCombatArea(AREA_CIRCLE3X3)
setCombatArea(combat, area)

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
    addEvent(doCombat, 0, cid, combat, var)
	return true
  else
	doPlayerSendCancel(cid, config.semMana)
  end
  doSendMagicEffect(getPlayerPosition(cid),2)
  return false
end
