-- explosão no alvo e em arredores do alvo
local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, CONST_ME_EXPLOSIONAREA)
setCombatParam(combat1, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGY)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, 0, -1100, 0, -1600)
local area = createCombatArea(
	{
	{0, 0, 1, 0, 0},
	{0, 1, 1, 1, 0},
	{1, 1, 3, 1, 1},
	{0, 1, 1, 1, 0},
	{0, 0, 1, 0, 0}
	}
)
setCombatArea(combat1, area)

-- status de energy com 800 de dano por 15 vezes
local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_EFFECT, CONST_ME_ENERGYHIT)
setCombatParam(combat2, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_FLASHARROW)
local condition1 = createConditionObject(CONDITION_ENERGY)
setConditionParam(condition1, CONDITION_PARAM_DELAYED, 1)
addDamageCondition(condition1, 20, 1000, -400)
setCombatCondition(combat2, condition1)

-- status de poison com 1000 de dano por 10 vezes
local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_EFFECT, CONST_ME_SMALLPLANTS)
setCombatParam(combat3, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_EARTHARROW)
local condition2 = createConditionObject(CONDITION_POISON)
setConditionParam(condition2, CONDITION_PARAM_DELAYED, 1)
addDamageCondition(condition2, 15, 1300, -700)
setCombatCondition(combat3, condition2)

-- faz o alvo dormir por um curto período de tempo
local combat4 = createCombatObject()
setCombatParam(combat4, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SMALLEARTH)
local function doTargetSleep(param)
	if param.contador <= 15 then -- o teste é feito 1x a cada 100 milissegundos
		if isCreature(param.alvo) == FALSE then -- interrompe a magia se o alvo morrer
			return FALSE
		end
		doSendMagicEffect(param.alvoPos, CONST_ME_SLEEP)
		doTeleportThing(param.alvo, param.alvoPos, 1) -- teleporta o jogador para o lugar que ele estava quando levou a magia hypnosis
		addEvent(doTargetSleep, 100, {alvo = param.alvo, alvoPos = param.alvoPos, contador = param.contador+1})
	end
end

function onCastSpell(cid, var)
	local random_attack = math.random(1,4)
	if random_attack == 1 then
		doCombat(cid, combat1, var)
	elseif random_attack == 2 then
		doCombat(cid, combat2, var)
	elseif random_attack == 3 then
		doCombat(cid, combat3, var)
	elseif random_attack == 4 then
		local alvo = getCreatureTarget(cid)
		local alvoPos = getCreaturePosition(alvo)
		addEvent(doTargetSleep, 0, {alvo = alvo, alvoPos = alvoPos, contador = 0})
		doCombat(cid, combat4, var)
	end
	
	return TRUE
end
