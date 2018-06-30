local config =
 {
  seconds = 15,
   storage = 10050,
  msg = "Você precisa aguardar %d segundos para usar essa magia novamente.",
  mana = 2400,
  semMana = "Você não tem mana suficiente.",
}

local function useAgain(cid)
 setPlayerStorageValue(cid, config.storage, 2)
 return TRUE
end

local combat1 = createCombatObject()
 setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
 setCombatParam(combat1, COMBAT_PARAM_EFFECT, 52)
setAttackFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, 0.15, 0.15, 7, 7)

local combat2 = createCombatObject()
 setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
 setCombatParam(combat2, COMBAT_PARAM_EFFECT, 52)
setAttackFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, 0.15, 0.15, 7, 7)

local combat10 = createCombatObject()
 setCombatParam(combat10, COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
 setCombatParam(combat10, COMBAT_PARAM_EFFECT, 52)
setAttackFormula(combat10, COMBAT_FORMULA_LEVELMAGIC, 0.21, 0.21, 7, 7)

local combat20 = createCombatObject()
 setCombatParam(combat20, COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
 setCombatParam(combat20, COMBAT_PARAM_EFFECT, 43)
setAttackFormula(combat20, COMBAT_FORMULA_LEVELMAGIC, 0.21, 0.21, 7, 7)

arr1 = {
{0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
}
arr2 = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0},
}

arr10 = {
{0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
}
arr20 = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0},
}

local area1 = createCombatArea(arr1)
local area2 = createCombatArea(arr2)
local area10 = createCombatArea(arr10)
local area20 = createCombatArea(arr20)

setCombatArea(combat1, area1)
setCombatArea(combat2, area2)
setCombatArea(combat10, area10)
setCombatArea(combat20, area20)

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
      if getPlayerStorageValue(cid, 10033) >= 1 then
        addEvent(doCombat, 000, cid, combat1, var)
        addEvent(doCombat, 600, cid, combat2, var)
      else
        addEvent(doCombat, 000, cid, combat10, var)
        addEvent(doCombat, 700, cid, combat20, var)
      end
	return true
  else
	doPlayerSendCancel(cid, config.semMana)
              doSendMagicEffect(getPlayerPosition(cid),2)
  end
  return false
end