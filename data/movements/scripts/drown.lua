local condition = createConditionObject(CONDITION_DROWN)
setConditionParam(condition, CONDITION_PARAM_PERIODICDAMAGE, -150)
setConditionParam(condition, CONDITION_PARAM_TICKS, -2)
setConditionParam(condition, CONDITION_PARAM_TICKINTERVAL, 1000)

function onStepIn(cid, item, position, fromPosition)
	if(isPlayer(cid)) and getPlayerSlotItem(cid, 1).itemid ~= 5461 then
	    doAddCondition(cid, condition) 
		else
		doCreatureAddHealth(cid, 75)
		doCreatureAddMana(cid, 100)
		doSendMagicEffect(cid, CONST_ME_LOSEENERGY)
	end
	return true
end

function onStepOut(cid, item, position, fromPosition)
	if(isPlayer(cid)) and getPlayerSlotItem(cid, 1).itemid ~= 5461 then
	    doAddCondition(cid, condition)
        else
        doCreatureAddHealth(cid, 75)
		doCreatureAddMana(cid, 100)
        doSendMagicEffect(cid, CONST_ME_LOSEENERGY)		
	end
	return true
end
