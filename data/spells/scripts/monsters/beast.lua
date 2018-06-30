local condition1 = createConditionObject(CONDITION_INVISIBLE)
setConditionParam(condition1, CONDITION_PARAM_TICKS, -1)

function onCastSpell(cid, var)
addEvent(doSendMagicEffect, 700, getCreaturePosition(cid), 53)
addEvent(doSendMagicEffect, 750, getCreaturePosition(cid), 33)
addEvent(doRemoveCondition, 780, cid, CONDITION_INVISIBLE)
addEvent(doAddCondition, 4500, cid, condition1)
end