local config = {
  mana = 2000,
  seconds = 180,
  storage = 13,
  semMana = "Você não têm mana suficiente.",
  msg = "Você precisa aguardar %d segundos para usar essa magia novamente.",
}

local function useAgain(cid)
 setPlayerStorageValue(cid, config.storage, 2)
 return TRUE
end

local combat1 = createCombatObject()
  setCombatParam(combat1, COMBAT_PARAM_EFFECT, 48)

local combat2 = createCombatObject()
  setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
  setCombatParam(combat2, COMBAT_PARAM_EFFECT, 49)
  setAttackFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, 0.5, 0.5, 10, 10)

local combat3 = createCombatObject()
  setCombatParam(combat3, COMBAT_PARAM_EFFECT, 48)

local combat4 = createCombatObject()
  setCombatParam(combat4, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
  setCombatParam(combat4, COMBAT_PARAM_EFFECT, 49)
  setAttackFormula(combat4, COMBAT_FORMULA_LEVELMAGIC, 0.5, 0.5, 10, 10)

arr1 = {
  {0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0},
  {0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0},
  {0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
  {0, 0, 1, 1, 1, 2, 1, 1, 1, 0, 0},
  {0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
  {0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0},
  {0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0},
}

arr2 = {
  {0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
  {0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
  {0, 0, 1, 1, 1, 2, 1, 1, 1, 0, 0},
  {0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
  {0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
}

arr3 = {
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0},
  {0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0},
  {0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0},
  {0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0},
  {0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
}

arr4 = {
  {0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0},
  {0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
  {0, 1, 0, 0, 1, 2, 1, 0, 0, 1, 0},
  {0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
  {0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
}


local area1 = createCombatArea(arr1)
local area2 = createCombatArea(arr2)
local area3 = createCombatArea(arr3)
local area4 = createCombatArea(arr4)
setCombatArea(combat1, area1)
setCombatArea(combat2, area2)
setCombatArea(combat3, area3)
setCombatArea(combat4, area4)

function onCastSpell(cid, var)
  if getPlayerStorageValue(cid, config.storage) == -1 then
    setPlayerStorageValue(cid, config.storage, os.time()-config.seconds)
  end
  if config.seconds-(os.time()-getPlayerStorageValue(cid, config.storage)) > 0 then
    doPlayerSendCancel(cid, string.format(config.msg, config.seconds-(os.time()-getPlayerStorageValue(cid, config.storage))))
    return true
  end
  if getPlayerMana(cid) >= config.mana then
    doPlayerAddMana(cid, -config.mana)
    setPlayerStorageValue(cid, config.storage, os.time())
    addEvent(doCombat, 000, cid, combat1, var)
    addEvent(doCombat, 000, cid, combat2, var)
    addEvent(doCombat, 000, cid, combat3, var)
    addEvent(doCombat, 400, cid, combat4, var)
  else
	doPlayerSendCancel(cid, config.semMana)
  end
  return true
end
