local config = {
  mana = 1200,
  seconds = 15,
  storage = 10050,
  semMana = "You do not have enough mana.",
  msg = "You must wait %d seconds before casting this spell again.",
}

local combat1 = createCombatObject()
 setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE)
 setCombatParam(combat1, COMBAT_PARAM_EFFECT, 20)
setAttackFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, 0.24, 0.24, 10, 10)

local combat2 = createCombatObject()
 setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE)
 setCombatParam(combat2, COMBAT_PARAM_EFFECT, CONST_ME_SMALLPLANTS)
setAttackFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, 0.24, 0.24, 10, 10)

local area1 = createCombatArea(AREA_BLASTX)
local area2 = createCombatArea(AREA_BLASTY)
setCombatArea(combat1, area1)
setCombatArea(combat2, area2)

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
    addEvent(doCombat, 0, cid, combat1, var)
	addEvent(doCombat, 0, cid, combat2, var)
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