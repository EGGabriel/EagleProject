local acombat = createCombatObject()
local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_FIREATTACK)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -0.0, 0, -0.0, 0)

local area = createCombatArea(
 { 
  {0, 1, 1, 1, 0},
  {1, 1, 1, 1, 1},
  {1, 1, 3, 1, 1},
  {1, 1, 1, 1, 1},
  {0, 1, 1, 1, 0}
 }
)
setCombatArea(acombat, area)

local function AttackDown(p)
	if isCreature(p.cid) == FALSE then -- interrompe a magia se cid deslogar ou morrer
		return TRUE
	end
	doSendDistanceShoot({x = p.pos.x - 7, y = p.pos.y - 5, z = p.pos.z}, p.pos, CONST_ANI_FIRE)
	doCombat(p.cid, p.combat, positionToVariant(p.pos))
end

function onTargetTile(cid, pos)
	for i=1,5 do -- roda 5 vezes a chuva a cada uso da magia
		if (math.random(1,100) <= 80) then -- 80% de chance de cair a chuva no SQM da área
			addEvent(AttackDown, math.random(0, 1100), {cid = cid, combat = combat, pos = pos})
		end
	end
end
setCombatCallback(acombat, CALLBACK_PARAM_TARGETTILE, "onTargetTile")

function onCastSpell(cid, var)
	doCombat(cid, acombat, var)
	return TRUE
end
