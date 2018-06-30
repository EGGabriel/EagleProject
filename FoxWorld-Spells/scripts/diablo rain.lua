-- Variáveis da Special Skill
local storageSkill = 30044
local storageExhaust = 51015
local storageDuracao = 51016
local tempoExhaust = 15
local duracaoChuva = 10
-- Variáveis da Special Skill

local acombat = createCombatObject()
local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_FIREATTACK)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -0.0, -100, -0.0, -299)

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
			addEvent(AttackDown, math.random(0, 1000), {cid = cid, combat = combat, pos = pos})
		end
	end
	
end
setCombatCallback(acombat, CALLBACK_PARAM_TARGETTILE, "onTargetTile")

local function startDiabloRain(p)
	if isCreature(p.cid) == FALSE then -- interrompe a magia se cid deslogar ou morrer
		return TRUE
	end

	if isPlayerExhausted(p.cid, storageDuracao) ~= FALSE then
		doCombat(p.cid, p.acombat, positionToVariant(getCreaturePosition(p.cid)))
		addEvent(startDiabloRain, 1000, p)
	end
end

function onCastSpell(cid, var)
	if (getPlayerStorageValue(cid,storageSkill) < 1 or getPlayerStorageValue(cid,storageSkill) > 3) and getPlayerVocation(cid) ~= GOD then -- testa se tem alguma carga da skill ou se é o GOD
		setPlayerStorageValue(cid, storageSkill, FALSE)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
		doPlayerSendCancel(cid, "Você não possui esta habilidade especial.")
		return FALSE
	end

	if isPlayerExhausted(cid, storageExhaust) ~= FALSE then -- testa se o jogador já pode usar a magia novamente (exhausted)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
		doPlayerSendCancel(cid, "Você ainda está com a Diablo Rain ativa.") -- nesta skill, o tempo de ehxaust é o mesmo tempo que ela dura
		return FALSE
	end

	if getPlayerVocation(cid) ~= GOD then -- se for GOD não perde carga da skill
		setPlayerStorageValue(cid, storageSkill, getPlayerStorageValue(cid,storageSkill)-1)
	end
	
	setPlayerExhaust(cid, storageExhaust, tempoExhaust) -- o tempo para usar a magia novamente
	setPlayerExhaust(cid, storageDuracao, duracaoChuva) -- o tempo que ela dura ao ser usada
	addEvent(startDiabloRain, 0, {cid = cid, acombat = acombat, var = var})
	return TRUE
end
