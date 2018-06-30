local config = {
  seconds = 40,
  storage = 20,
  msg = "You must wait %d seconds before casting this spell again.",
}

local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HEALING)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)
setCombatParam(combat, COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)
setHealingFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 0.08, 0.08, 0, 0)

function onCastSpell(cid, var)
  if getPlayerStorageValue(cid, 10022) == 1 then
    if getPlayerStorageValue(cid, config.storage) == -1 then
    setPlayerStorageValue(cid, config.storage, os.time()-config.seconds)
    end
    if config.seconds-(os.time()-getPlayerStorageValue(cid, config.storage)) > 0 then
    doPlayerSendCancel(cid, string.format(config.msg, config.seconds-(os.time()-getPlayerStorageValue(cid, config.storage))))
    return false
    end
  setPlayerStorageValue(cid, config.storage, os.time())
  return doCombat(cid, combat, var)
  else
    doPlayerSendCancel(cid, "You need to learn the spell first.")
  end
  return false
end
