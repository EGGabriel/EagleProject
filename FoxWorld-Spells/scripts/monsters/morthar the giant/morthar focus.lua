local acombat = createCombatObject()
local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_EXPLOSIONHIT)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -0.0, -100, -0.0, -1000)

local area = createCombatArea(
{
{0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 1},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{1, 0, 0, 1, 0, 2, 0, 1, 0, 0, 1},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 1},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0},
}
)
setCombatArea(acombat, area)

local function AttackDown(p)
	if isCreature(p.cid) == FALSE then -- interrompe a magia se cid deslogar ou morrer
		return TRUE
	end
	
	if isCreature(p.alvo) == FALSE or getCreatureTarget(p.cid) ~= p.alvo then -- se o alvo morrer ou cid trocar de alvo, a magia é cancelada
		return TRUE
	end
	
	alvoPos = getCreaturePosition(p.alvo)
	doSendDistanceShoot({x = p.pos.x - 7, y = p.pos.y - 5, z = p.pos.z}, alvoPos, CONST_ANI_WHIRLWINDCLUB)
	doCombat(p.cid, p.combat, positionToVariant(alvoPos))
end

local function AttackUP(p)
	if isCreature(p.cid) == FALSE then -- interrompe a magia se cid deslogar ou morrer
		return TRUE
	end
	local pos = getCreaturePosition(p.cid)
	doSendDistanceShoot(pos, {x = pos.x - math.random(6,8), y = pos.y - 5, z = pos.z}, CONST_ANI_WHIRLWINDCLUB)
	addEvent(AttackDown, math.random(0, 6000), p)
end

function onTargetTile(cid, pos)
	addEvent(AttackUP, math.random(0, 6000), {cid = cid, combat = combat, pos = pos, alvo = getCreatureTarget(cid)})
end

setCombatCallback(acombat, CALLBACK_PARAM_TARGETTILE, "onTargetTile")

function onCastSpell(cid, var)
	return doCombat(cid, acombat, var)
end
