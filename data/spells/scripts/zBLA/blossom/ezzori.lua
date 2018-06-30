local config = {
  manapercent = 0.90,
  seconds = 14,
  storage = 10022,
  semMana = "Você não tem mana suficiente.",
  msg = "Você precisa aguardar %d segundos para usar essa magia novamente.",
}

local function useAgain(cid)
 setPlayerStorageValue(cid, config.storage, 2)
 return TRUE
end

local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, CONST_ME_EXPLOSIONAREA)
setAttackFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, 0.18, 0.18, 7, 7)

local condition1 = createConditionObject(CONDITION_PARALYZE)
setConditionParam(condition1, CONDITION_PARAM_TICKS, 20000)
setConditionFormula(condition1, -0.9, 0, -0.9, 0)
setCombatCondition(combat1, condition1)

local arr1 = {
{0, 0, 1, 1, 0, 0, 1, 0, 0, 1, 1, 0, 0},
{0, 0, 1, 0, 0, 1, 1, 1, 0, 0, 1, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0},
{0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{1, 1, 1, 1, 1, 1, 3, 1, 1, 1, 1, 1, 1},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0},
{0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 1, 0, 0, 1, 1, 1, 0, 0, 1, 0, 0},
{0, 0, 1, 1, 0, 0, 1, 0, 0, 1, 1, 0, 0},
}

local area1 = createCombatArea(arr1)
setCombatArea(combat1, area1)

local combat0 = createCombatObject()
setCombatParam(combat0, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat0, COMBAT_PARAM_EFFECT, CONST_ME_EXPLOSIONAREA)
setAttackFormula(combat0, COMBAT_FORMULA_LEVELMAGIC, 0.22, 0.22, 7, 7)

local condition0 = createConditionObject(CONDITION_PARALYZE)
setConditionParam(condition0, CONDITION_PARAM_TICKS, 20000)
setConditionFormula(condition0, -0.9, 0, -0.9, 0)
setCombatCondition(combat0, condition0)

local arr0 = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 1, 1, 1, 1, 3, 1, 1, 1, 1, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
}

local area0 = createCombatArea(arr0)
setCombatArea(combat0, area0)

function onCastSpell(cid, var)
  if getPlayerStorageValue(cid, config.storage) == -1 then
    setPlayerStorageValue(cid, config.storage, os.time()-config.seconds)
  end
  if config.seconds-(os.time()-getPlayerStorageValue(cid, config.storage)) > 0 then
    doPlayerSendCancel(cid, string.format(config.msg, config.seconds-(os.time()-getPlayerStorageValue(cid, config.storage))))
    return false
  end
  if getPlayerMana(cid) >= (config.manapercent * getCreatureMaxMana(cid)) then
    doPlayerAddMana(cid, -(config.manapercent * getCreatureMaxMana(cid)))
    setPlayerStorageValue(cid, config.storage, os.time())
        if getPlayerStorageValue(cid, 10033) == 1 then
        addEvent(doCombat, 0, cid, combat1, var)
        else
        addEvent(doCombat, 0, cid, combat0, var)
        end
	return true
  else
	doPlayerSendCancel(cid, config.semMana)
    doSendMagicEffect(getPlayerPosition(cid),2)
  end
  return false
end
