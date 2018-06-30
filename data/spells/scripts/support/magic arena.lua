 local config = {
  mana = 1000,
  seconds = 60,
  storage = 10,
  semMana = "You don't have enough mana.",
  msg = "You must wait %d seconds to cast this spell again.",
}

local function useAgain(cid)
 setPlayerStorageValue(cid, config.storage, 2)
 return TRUE
end

local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 48)
setCombatParam(combat1, COMBAT_PARAM_CREATEITEM, 12344)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_CREATEITEM, 10013)

area1 = {
{0, 1, 1, 1, 1, 1, 1, 1, 0},
{0, 1, 1, 0, 0, 0, 1, 1, 0},
{1, 1, 0, 0, 1, 0, 0, 1, 1},
{1, 0, 0, 0, 0, 0, 0, 0, 1},
{1, 0, 1, 0, 3, 0, 1, 0, 1},
{1, 0, 0, 0, 0, 0, 0, 0, 1},
{1, 1, 0, 0, 1, 0, 0, 1, 1},
{0, 1, 1, 0, 0, 0, 1, 1, 0},
{0, 1, 1, 1, 1, 1, 1, 1, 0}
}

area2 = {
{0, 0, 1, 1, 1, 1, 1, 0, 0},
{0, 1, 1, 1, 1, 1, 1, 1, 0},
{1, 1, 0, 1, 1, 1, 0, 1, 1},
{1, 1, 1, 0, 1, 0, 1, 1, 1},
{1, 0, 1, 1, 1, 1, 1, 0, 1},
{1, 1, 1, 1, 3, 1, 1, 1, 1},
{1, 0, 1, 1, 1, 1, 1, 1, 1},
{1, 0, 1, 0, 1, 0, 1, 0, 1},
{1, 1, 0, 1, 1, 1, 0, 1, 1},
{0, 1, 1, 1, 1, 1, 1, 1, 0},
{0, 0, 1, 1, 1, 1, 1, 0, 0}
}

local area1 = createCombatArea(area1)
local area2 = createCombatArea(area2)
setCombatArea(combat1, area1)
setCombatArea(combat2, area2)
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
    addEvent(doCombat, 000, cid, combat1, var)
    addEvent(doCombat, 000, cid, combat2, var)
		return true
  else
	doPlayerSendCancel(cid, config.semMana)
    doSendMagicEffect(getPlayerPosition(cid),2)
  end
  return false
end
