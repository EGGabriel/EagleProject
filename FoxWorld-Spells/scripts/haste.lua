-- Variáveis da Special Skill
local storageSkill = 30036
-- Variáveis da Special Skill

local combat1 = createCombatObject() -- tira qualquer outro tipo de haste antes de aplicar o atual
setCombatParam(combat1, COMBAT_PARAM_AGGRESSIVE, 0)
setCombatParam(combat1, COMBAT_PARAM_DISPEL, CONDITION_HASTE)

local combat2 = createCombatObject() -- haste comum
setCombatParam(combat2, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_GREEN)
setCombatParam(combat2, COMBAT_PARAM_AGGRESSIVE, 0)

local condition2 = createConditionObject(CONDITION_HASTE) -- condição do haste comum
setConditionParam(condition2, CONDITION_PARAM_TICKS, 33000)
setConditionFormula(condition2, 0.3, -24, 0.3, -24)
setCombatCondition(combat2, condition2)

local combat3 = createCombatObject() -- haste da skill Vento Cortante
setCombatParam(combat3, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_GREEN)
setCombatParam(combat3, COMBAT_PARAM_AGGRESSIVE, 0)

local condition3 = createConditionObject(CONDITION_HASTE) -- condição do haste da skill Vento Cortante
setConditionParam(condition3, CONDITION_PARAM_TICKS, 36000)
setConditionFormula(condition3, 0.47, -34, 0.47, -34)
setCombatCondition(combat3, condition3)

function onCastSpell(cid, var)
	doCombat(cid, combat1, var)	-- combate que tira qualquer haste antes de aplicar o novo
	-- if (getPlayerStorageValue(cid,storageSkill) == TRUE and isPremium(cid) == TRUE) or getPlayerVocation(cid) == GOD then -- testa se tem a skill de aprimoramento e é Premium, ou se é GOD
		local position = getCreaturePosition(cid)
		if getPlayerLookDir(cid) == 1 then
			doSendDistanceShoot({x = position.x+1, y = position.y, z = position.z}, {x = position.x-2, y = position.y+1, z = position.z}, CONST_ANI_EXPLOSION)
			doSendDistanceShoot({x = position.x+1, y = position.y, z = position.z}, {x = position.x-2, y = position.y-1, z = position.z}, CONST_ANI_EXPLOSION)
			doSendDistanceShoot({x = position.x+1, y = position.y, z = position.z}, {x = position.x-2, y = position.y, z = position.z}, CONST_ANI_EXPLOSION)
		elseif getPlayerLookDir(cid) == 2 then
			doSendDistanceShoot({x = position.x, y = position.y+1, z = position.z}, {x = position.x+1, y = position.y-2, z = position.z}, CONST_ANI_EXPLOSION)
			doSendDistanceShoot({x = position.x, y = position.y+1, z = position.z}, {x = position.x-1, y = position.y-2, z = position.z}, CONST_ANI_EXPLOSION)
			doSendDistanceShoot({x = position.x, y = position.y+1, z = position.z}, {x = position.x, y = position.y-2, z = position.z}, CONST_ANI_EXPLOSION)
		elseif getPlayerLookDir(cid) == 3 then
			doSendDistanceShoot({x = position.x-1, y = position.y, z = position.z}, {x = position.x+2, y = position.y+1, z = position.z}, CONST_ANI_EXPLOSION)
			doSendDistanceShoot({x = position.x-1, y = position.y, z = position.z}, {x = position.x+2, y = position.y-1, z = position.z}, CONST_ANI_EXPLOSION)
			doSendDistanceShoot({x = position.x-1, y = position.y, z = position.z}, {x = position.x+2, y = position.y, z = position.z}, CONST_ANI_EXPLOSION)
		else
			doSendDistanceShoot({x = position.x, y = position.y-1, z = position.z}, {x = position.x+1, y = position.y+2, z = position.z}, CONST_ANI_EXPLOSION)
			doSendDistanceShoot({x = position.x, y = position.y-1, z = position.z}, {x = position.x-1, y = position.y+2, z = position.z}, CONST_ANI_EXPLOSION)
			doSendDistanceShoot({x = position.x, y = position.y-1, z = position.z}, {x = position.x, y = position.y+2, z = position.z}, CONST_ANI_EXPLOSION)
		end
		doCombat(cid, combat3, var)
	-- else
		-- doCombat(cid, combat2, var)
	-- end
	-- return TRUE
end
