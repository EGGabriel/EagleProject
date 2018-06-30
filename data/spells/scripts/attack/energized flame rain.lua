local config = {
  mana = 2000,
  seconds = 20,
  storage = 10050,
  semMana = "You do not have enough mana.",
  msg = "You must wait %d seconds before casting this spell again.",
}

local combat1 = createCombatObject()
 setCombatParam(combat1, COMBAT_PARAM_EFFECT, CONST_ME_BIGCLOUDS)

local combat2 = createCombatObject()
 setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
 setCombatParam(combat2, COMBAT_PARAM_EFFECT, CONST_ME_FIREAREA)
 setCombatParam(combat2, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGY)
 setAttackFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, 0.2, 0.2, 10, 10)

local areax = createCombatArea(AREA_RAIN)
local areay = createCombatArea(AREA_RAIN)
setCombatArea(combat1, areax)
setCombatArea(combat2, areay)

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