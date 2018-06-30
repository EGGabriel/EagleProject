local config = {
  mana = 1000,
  seconds = 120,
  storage = 10022,
  semMana = "You do not have enough mana.",
  msg = "You must wait %d seconds before casting this spell again.",
}

local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, 54)
setCombatParam(combat, COMBAT_PARAM_CREATEITEM, 8313)

local condition = createConditionObject(CONDITION_POISON)
setConditionParam(condition, CONDITION_PARAM_DELAYED, 1)
addDamageCondition(condition, 5, 1000, -200)
setCombatCondition(combat, condition)

arr = {
	{0, 1, 1, 1, 0},
	{1, 1, 1, 1, 1},
	{1, 1, 0, 1, 1},
	{1, 1, 1, 1, 1},
	{0, 1, 1, 1, 0},
	{0, 0, 2, 0, 0},
}

local area = createCombatArea(arr)
setCombatArea(combat, area)

function onCastSpell(cid, var)
  if getPlayerStorageValue(cid, 10010) == 1 then
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
  else
    doPlayerSendCancel(cid, "You need to learn the spell first.")
  end
  doSendMagicEffect(getPlayerPosition(cid),2)
    return false
end
