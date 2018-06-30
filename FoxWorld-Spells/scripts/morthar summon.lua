-- Variáveis da Special Skill
local storageSkill = 30040
local storageExhaust = 51013
local tempoExhaust = 10
-- Variáveis da Special Skill

local acombat = createCombatObject()

local area = createCombatArea(
 {
  {1, 1, 1, 1, 1},
  {1, 1, 1, 1, 1},
  {1, 1, 3, 1, 1},
  {1, 1, 1, 1, 1},
  {1, 1, 1, 1, 1}
 }
)
setCombatArea(acombat, area)

local function efeitoPedras(param)
	if isCreature(param.cid) == FALSE then -- interrompe a magia se cid deslogar ou morrer
		return TRUE
	end
	
	local playerPos = getCreaturePosition(param.cid)
	doSendDistanceShoot({x = playerPos.x - math.random(6,8), y = playerPos.y - 5, z = playerPos.z}, playerPos, CONST_ANI_LARGEROCK)
	effectPos = {x = playerPos.x + math.random(-1,1), y = playerPos.y + math.random(-1,1), z = playerPos.z}
	doSendMagicEffect(effectPos, CONST_ME_STONES)
end

function onTargetTile(cid, pos)
	addEvent(efeitoPedras, math.random(0, 1000), {cid = cid, pos = pos})
end
setCombatCallback(acombat, CALLBACK_PARAM_TARGETTILE, "onTargetTile")

function onCastSpell(cid, var)
	if (getPlayerStorageValue(cid,storageSkill) < 1 or getPlayerStorageValue(cid,storageSkill) > 3) and getPlayerVocation(cid) ~= GOD then -- testa se tem alguma carga da skill ou se é o GOD
		setPlayerStorageValue(cid, storageSkill, FALSE)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
		doPlayerSendCancel(cid, "Você não possui esta habilidade especial.")
		return FALSE
	end

	if isPlayerExhausted(cid, storageExhaust) ~= FALSE then -- testa se o jogador já pode usar a magia novamente (exhausted)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
		doPlayerSendCancel(cid, "Você precisa aguardar "..getPlayerExhaustion(cid, storageExhaust).." segundos para acumular espírito.")
		return FALSE
	end
	
	local nothingPos = {x=50,y=50,z=7} -- lugar vazio no mapa do FoxWorld
	
	local mortharin1 = doSummonCreature("mortharin", nothingPos)
	doConvinceCreature(cid, mortharin1)
	doTeleportThing(mortharin1, getCreaturePosition(cid), FALSE)

	local mortharin2 = doSummonCreature("mortharin", nothingPos)
	doConvinceCreature(cid, mortharin2)
	doTeleportThing(mortharin2, getCreaturePosition(cid), FALSE)

	local mortharin3 = doSummonCreature("mortharin", nothingPos)
	doConvinceCreature(cid, mortharin3)
	doTeleportThing(mortharin3, getCreaturePosition(cid), FALSE)

	local mortharin4 = doSummonCreature("mortharin", nothingPos)
	doConvinceCreature(cid, mortharin4)
	doTeleportThing(mortharin4, getCreaturePosition(cid), FALSE)

	doCombat(cid, acombat, var)
		
	if getPlayerVocation(cid) ~= GOD then -- se for GOD não pega exhaust e não perde carga da skill
		setPlayerExhaust(cid, storageExhaust, tempoExhaust)
		setPlayerStorageValue(cid, storageSkill, getPlayerStorageValue(cid,storageSkill)-1)
	end
	return TRUE
end
