local config = {
  mana = 850,
  seconds = 9,
  storage = 10050,
  semMana = "You do not have enough mana.",
  msg = "You must wait %d seconds before casting this spell again.",
}

local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ETHEREALSPEAR)

function onGetFormulaValues(cid, level, skill, attack, factor)
    local min = -((getPlayerSkill(cid, 4)*10) + (level * 5))
	local max = -((getPlayerSkill(cid, 4)*10) + (level * 5))
	return min, max
end
setCombatCallback(combat, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

function onCastSpell(cid, var)
  if getPlayerStorageValue(cid, 10033) == 1 then
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
  return false
end
