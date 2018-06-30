local combat1 = createCombatObject()

local condition1 = createConditionObject(CONDITION_FIRE)
setConditionParam(condition1, CONDITION_PARAM_DELAYED, 1)
addDamageCondition(condition1, 8, 1500, -250)
setCombatCondition(combat1, condition1)

local combat2 = createCombatObject()

local condition2 = createConditionObject(CONDITION_ENERGY)
setConditionParam(condition2, CONDITION_PARAM_DELAYED, 1)
addDamageCondition(condition2, 8, 1300, -300)
setCombatCondition(combat2, condition2)

local combat3 = createCombatObject()

local condition3 = createConditionObject(CONDITION_POISON)
setConditionParam(condition3, CONDITION_PARAM_DELAYED, 1)
addDamageCondition(condition3, 8, 1300, -350)
setCombatCondition(combat3, condition3)

local condition4 = createConditionObject(CONDITION_DRUNK)
setConditionParam(condition4, CONDITION_PARAM_TICKS, 15000)
setCombatCondition(combat3, condition4)

local combat4 = createCombatObject()

local condition5 = createConditionObject(CONDITION_PARALYZE)
setConditionParam(condition5, CONDITION_PARAM_TICKS, 20000)
setConditionFormula(condition5, -0.9, 0, -0.9, 0)
setCombatCondition(combat4, condition5)

function onTargetTile1(cid, pos)

target = getCreatureTarget(cid)
targetpos = getCreaturePosition(target)

doSendDistanceShoot(getCreaturePosition(cid), targetpos, 33)
doTargetCombatHealth(cid, target, 8, -50, -200, 5)
doAddCondition(150, target, condition1)
end

setCombatCallback(combat1, CALLBACK_PARAM_TARGETTILE, "onTargetTile1")

function onTargetTile2(cid, pos)

target = getCreatureTarget(cid)
targetpos = getCreaturePosition(target)

doSendDistanceShoot(getCreaturePosition(cid), targetpos, 32)
doTargetCombatHealth(cid, target, 2, -100, -200, 37)
doAddCondition(target, condition2)
end

setCombatCallback(combat2, CALLBACK_PARAM_TARGETTILE, "onTargetTile2")

function onTargetTile3(cid, pos)

target = getCreatureTarget(cid)
targetpos = getCreaturePosition(target)

doSendDistanceShoot(getCreaturePosition(cid), targetpos, 39)
doTargetCombatHealth(cid, target, 4, -100, -250, 20)
doAddCondition(target, condition3)
doAddCondition(target, condition4)
end

setCombatCallback(combat3, CALLBACK_PARAM_TARGETTILE, "onTargetTile3")

function onTargetTile4(cid, pos)

target = getCreatureTarget(cid)
targetpos = getCreaturePosition(target)

doSendDistanceShoot(getCreaturePosition(cid), targetpos, 21)
doTargetCombatHealth(cid, target, 1, -100, -200, 13)
doAddCondition(target, condition5)
end

setCombatCallback(combat4, CALLBACK_PARAM_TARGETTILE, "onTargetTile4")

function onCastSpell(cid, var)
n = math.random(1, 8)
if n == 1 then
	return doCombat(cid, combat1, var)
elseif n == 2 then
	return doCombat(cid, combat2, var)
elseif n == 3 then
	return doCombat(cid, combat3, var)
elseif n == 4 then
	return doCombat(cid, combat4, var)
end
end