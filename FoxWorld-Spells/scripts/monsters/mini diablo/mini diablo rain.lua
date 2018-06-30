local acombat = createCombatObject()
local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_FIREATTACK)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -0.0, 0, -0.0, 0)

local area = createCombatArea(
 { 
  {1, 1, 1},
  {1, 3, 1},
  {1, 1, 1}
 }
)
setCombatArea(acombat, area)

local function AttackDown(param)
	if isCreature(param.cid) == FALSE then -- interrompe a magia se cid deslogar ou morrer
		return TRUE
	end
	doSendDistanceShoot({x = param.pos.x - 7, y = param.pos.y - 5, z = param.pos.z}, param.pos, CONST_ANI_FIRE)
	doCombat(param.cid, param.combat, positionToVariant(param.pos))
end

function onTargetTile(cid, pos)
	if (math.random(1,100) <= 80) then -- 80% de chance de cair a chuva no SQM da área
		addEvent(AttackDown, math.random(0, 1100), {cid = cid, combat = combat, pos = pos})
	end
end
setCombatCallback(acombat, CALLBACK_PARAM_TARGETTILE, "onTargetTile")

function onCastSpell(cid, var)
	doCombat(cid, acombat, var)
	return TRUE
end
