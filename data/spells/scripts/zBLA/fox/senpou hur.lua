local config = {
  manapercent = 0.40,
  seconds = 10,
  storage = 10,
  semMana = "Você não têm mana suficiente.",
  msg = "Você precisa aguardar %d segundos para usar essa magia novamente.",
}

local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 31)
setCombatParam(combat1, COMBAT_PARAM_AGGRESSIVE, 0)

local condition1 = createConditionObject(CONDITION_HASTE)
setConditionParam(condition1, CONDITION_PARAM_TICKS, 6000)
setConditionFormula(condition1, 2.5, -56, 2.7, -56)
setCombatCondition(combat1, condition1)

arr1 = {{3}}

local area1 = createCombatArea(arr1)

setCombatArea(combat1, area1)

function onCastSpell(cid, var)
  if getPlayerStorageValue(cid, config.storage) == -1 then
    setPlayerStorageValue(cid, config.storage, os.time()-config.seconds)
  end
  if config.seconds-(os.time()-getPlayerStorageValue(cid, config.storage)) > 0 then
    doPlayerSendCancel(cid, string.format(config.msg, config.seconds-(os.time()-getPlayerStorageValue(cid, config.storage))))
    return true
  end
  if getPlayerMana(cid) >= (config.manapercent * getCreatureMaxMana(cid)) then
    doPlayerAddMana(cid, -(config.manapercent * getCreatureMaxMana(cid)))
    setPlayerStorageValue(cid, config.storage, os.time())
    addEvent(doCombat, 0, cid, combat1, var)
  else
    doPlayerSendCancel(cid, config.semMana)
    doSendMagicEffect(getPlayerPosition(cid),2)
  end
  return true
end
