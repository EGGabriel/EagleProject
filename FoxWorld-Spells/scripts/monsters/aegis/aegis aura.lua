local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
local condition = createConditionObject(CONDITION_FIRE)
setConditionParam(condition, CONDITION_PARAM_DELAYED, 1)
addDamageCondition(condition, 10, 2000, -300)
setCombatCondition(combat, condition)

local area = createCombatArea(
	{
    {1, 1, 1},
    {1, 3, 1},
    {1, 1, 1}
	}
)
setCombatArea(combat, area)

local function AegisAura(p)
	if isCreature(p.cid) == FALSE then
		return FALSE
	end
	
	aegisPos = getCreaturePosition(p.cid)

	if p.auraDir == 1 then
		doSendDistanceShoot({x=aegisPos.x-1 , y=aegisPos.y+1 , z=aegisPos.z}, {x=aegisPos.x-1 , y=aegisPos.y-1 , z=aegisPos.z}, CONST_ANI_SMALLHOLY)
		auraDir = 2
		addEvent(AegisAura, 250, {cid = p.cid, auraDir = auraDir})
	elseif p.auraDir == 2 then
		doSendDistanceShoot({x=aegisPos.x-1 , y=aegisPos.y-1 , z=aegisPos.z}, {x=aegisPos.x+1 , y=aegisPos.y-1 , z=aegisPos.z}, CONST_ANI_SMALLHOLY)
		auraDir = 3
		addEvent(AegisAura, 250, {cid = p.cid, auraDir = auraDir})
	elseif p.auraDir == 3 then
		doSendDistanceShoot({x=aegisPos.x+1 , y=aegisPos.y-1 , z=aegisPos.z}, {x=aegisPos.x+1 , y=aegisPos.y+1 , z=aegisPos.z}, CONST_ANI_SMALLHOLY)
		auraDir = 4
		addEvent(AegisAura, 250, {cid = p.cid, auraDir = auraDir})
	else
		doSendDistanceShoot({x=aegisPos.x+1 , y=aegisPos.y+1 , z=aegisPos.z}, {x=aegisPos.x-1 , y=aegisPos.y+1 , z=aegisPos.z}, CONST_ANI_SMALLHOLY)
		auraDir = 1
	end
end

function onCastSpell(cid, var)
	addEvent(AegisAura, 0, {cid = cid, auraDir = 1})
	doCombat(cid, combat, var)
	return TRUE
end
