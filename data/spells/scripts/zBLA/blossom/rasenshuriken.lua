local config = {
  manapercent = 0.60,
  seconds = 10,
  storage = 10050,
  semMana = "Você não tem mana suficiente.",
  msg = "Você precisa aguardar %d segundos para usar essa magia novamente.",
}

local function useAgain(cid)
 setPlayerStorageValue(cid, config.storage, 2)
 return TRUE
end

local combat1 = createCombatObject()
  setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
  setCombatParam(combat1, COMBAT_PARAM_EFFECT, 53)
  setAttackFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, 0.16, 0.16, 7, 7)

local combat2 = createCombatObject()
  setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
  setCombatParam(combat2, COMBAT_PARAM_EFFECT, 53)
setAttackFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, 0.16, 0.16, 7, 7)

local combat3 = createCombatObject()
  setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
  setCombatParam(combat3, COMBAT_PARAM_EFFECT, 42)
setAttackFormula(combat3, COMBAT_FORMULA_LEVELMAGIC, 0.16, 0.16, 7, 7)

local combat4 = createCombatObject()
  setCombatParam(combat4, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
  setCombatParam(combat4, COMBAT_PARAM_EFFECT, 42)
setAttackFormula(combat4, COMBAT_FORMULA_LEVELMAGIC, 0.16, 0.16, 7, 7)

local combat10 = createCombatObject()
  setCombatParam(combat10, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
  setCombatParam(combat10, COMBAT_PARAM_EFFECT, 53)
setAttackFormula(combat10, COMBAT_FORMULA_LEVELMAGIC, 0.16, 0.16, 7, 7)

local combat20 = createCombatObject()
  setCombatParam(combat20, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setAttackFormula(combat20, COMBAT_FORMULA_LEVELMAGIC, 0.16, 0.16, 7, 7)

arr1 = {
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0},
  {0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0},
  {0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0},
  {0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0},
  {0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
}

arr2 = {
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
  {0, 0, 1, 1, 1, 2, 1, 1, 1, 0, 0},
  {0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
}

arr3 = {
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0},
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0},
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
}

arr4 = {
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 1, 0, 0, 0, 2, 0, 0, 0, 1, 0},
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
}

arr10 = {
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0},
  {0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0},
  {0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0},
  {0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0},
  {0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
}

arr20 = {
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
  {0, 0, 1, 1, 1, 2, 1, 1, 1, 0, 0},
  {0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
}

local area1 = createCombatArea(arr1)
local area2 = createCombatArea(arr2)
local area3 = createCombatArea(arr3)
local area4 = createCombatArea(arr4)
local area10 = createCombatArea(arr10)
local area20 = createCombatArea(arr20)

setCombatArea(combat1, area1)
setCombatArea(combat2, area2)
setCombatArea(combat3, area3)
setCombatArea(combat4, area4)
setCombatArea(combat10, area10)
setCombatArea(combat20, area20)

function onCastSpell(cid, var)
  if getPlayerStorageValue(cid, config.storage) == -1 then
    setPlayerStorageValue(cid, config.storage, os.time()-config.seconds)
  end
  if config.seconds-(os.time()-getPlayerStorageValue(cid, config.storage)) > 0 then
    doPlayerSendCancel(cid, string.format(config.msg, config.seconds-(os.time()-getPlayerStorageValue(cid, config.storage))))
    return true
  end
  if getPlayerMana(cid) >= ((config.manapercent) * (getCreatureMaxMana(cid))) then
    doPlayerAddMana(cid, -(config.manapercent * getCreatureMaxMana(cid)))
    setPlayerStorageValue(cid, config.storage, os.time())
      if getPlayerStorageValue(cid,10033) >= 1 then
        addEvent(doCombat, 000, cid, combat1, var)
        addEvent(doCombat, 500, cid, combat2, var)
        addEvent(doCombat, 000, cid, combat3, var)
        addEvent(doCombat, 500, cid, combat4, var)
      else
        addEvent(doCombat, 000, cid, combat10, var)
        addEvent(doCombat, 700, cid, combat20, var)
      end
  else
	doPlayerSendCancel(cid, config.semMana)
              doSendMagicEffect(getPlayerPosition(cid),2)
  end
  return true
end
