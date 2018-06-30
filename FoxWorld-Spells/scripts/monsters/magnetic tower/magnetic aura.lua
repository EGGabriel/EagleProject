local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
local condition = createConditionObject(CONDITION_ENERGY)
setConditionParam(condition, CONDITION_PARAM_DELAYED, 1)
addDamageCondition(condition, 10, 1000, -100)
setCombatCondition(combat, condition)

local area = createCombatArea(
	{
    {1, 1, 1},
    {1, 3, 1},
    {1, 1, 1}
	}
)
setCombatArea(combat, area)

local function MagneticAura(p)
	if isCreature(p.cid) == FALSE then
		return FALSE
	end
	
	towerPos = getCreaturePosition(p.cid)

	if p.auraDir == 1 then
		doSendDistanceShoot({x=towerPos.x-1 , y=towerPos.y+1 , z=towerPos.z}, {x=towerPos.x-1 , y=towerPos.y-1 , z=towerPos.z}, CONST_ANI_SNOWBALL)
		doSendDistanceShoot({x=towerPos.x+1 , y=towerPos.y-1 , z=towerPos.z}, {x=towerPos.x+1 , y=towerPos.y+1 , z=towerPos.z}, CONST_ANI_SNOWBALL)
		auraDir = 2
		addEvent(MagneticAura, 500, {cid = p.cid, auraDir = auraDir})
	else
		doSendDistanceShoot({x=towerPos.x-1 , y=towerPos.y-1 , z=towerPos.z}, {x=towerPos.x+1 , y=towerPos.y-1 , z=towerPos.z}, CONST_ANI_SNOWBALL)
		doSendDistanceShoot({x=towerPos.x+1 , y=towerPos.y+1 , z=towerPos.z}, {x=towerPos.x-1 , y=towerPos.y+1 , z=towerPos.z}, CONST_ANI_SNOWBALL)
		auraDir = 1
	end
end

function onCastSpell(cid, var)
	addEvent(MagneticAura, 0, {cid = cid, auraDir = 1})
	doCombat(cid, combat, var)
	return TRUE
end
