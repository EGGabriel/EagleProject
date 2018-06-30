-- Variáveis da Special Skill
local storageSkill = 30031
local auraItemID = 7415
local manaToUse = 200
local auraWeight = 10
local conjureEffect = CONST_ME_FIREWORK_RED
-- Variáveis da Special Skill

local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_NONE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, conjureEffect)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, FALSE)

local arr = {
{1, 1, 1},
{1, 2, 1},
{1, 1, 1}
}
local area = createCombatArea(arr)
setCombatArea(combat, area)

function onCastSpell(cid, var)
	-- if getPlayerStorageValue(cid,storageSkill) ~= TRUE and getPlayerVocation(cid) ~= GOD then -- testa se tem a skill ou se é o GOD
		setPlayerStorageValue(cid, storageSkill, FALSE)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
		doPlayerSendCancel(cid, "Você não possui esta habilidade especial.")
		-- return FALSE
	-- end
	
	if getPlayerFreeCap(cid) < auraWeight and getPlayerVocation(cid) ~= GOD then -- testa se tem cap para carregar o item ou se é GOD
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
		doPlayerSendCancel(cid, "Você está sem capacidade(CAP) para sumonar este objeto.")
		return FALSE
	end

	if getPlayerMana(cid) < manaToUse and getPlayerVocation(cid) ~= GOD then -- testa se tem mana pra usar a skill ou se é GOD
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
		doPlayerSendCancel(cid, "You do not have enough mana.")
		return FALSE
	end
	doPlayerAddMana(cid,-manaToUse,FALSE)
	doPlayerAddManaSpent(cid, manaToUse)
	
	conjuredItem = doPlayerAddItem(cid,auraItemID,1) -- já cria o item aqui para poder efetuar o teste abaixo
	--doDecayItem(conjuredItem)
	local maoesquerda = getPlayerSlotItem(cid, CONST_SLOT_RIGHT)
	local maodireita = getPlayerSlotItem(cid, CONST_SLOT_LEFT)
	if maoesquerda.uid ~= conjuredItem and maodireita.uid ~= conjuredItem then -- testa se o item foi conjurado corretamente na mão do jogador
		doRemoveItem(conjuredItem)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
		doPlayerSendCancel(cid, "Você precisa estar com uma das mãos vazias para conjurar uma aura weapon.")
		return FALSE
	end
	
	doCombat(cid, combat, var)
	return TRUE
end
