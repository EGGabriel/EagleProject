local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_ENERGYHIT)
setAttackFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 5, 5, 5, 12)

local area = createCombatArea(AREA_CROSS6X6)
setCombatArea(combat, area)

function onCastSpell(cid, var)
    luck = math.random(1,5)

    if luck <= 3 then
    doSummonCreature("Infected Sheep", getCreaturePosition(cid))
	doSummonCreature("Plague Blob", getCreaturePosition(cid))
	doSummonCreature("Infected Sheep", getCreaturePosition(cid))
	doSummonCreature("Hellhound", getCreaturePosition(cid))
	elseif luck == 3 then
	doSummonCreature("Hellbringer", getCreaturePosition(cid))
	doSummonCreature("Radioactive Defiler", getCreaturePosition(cid))
	doSummonCreature("Plague Blob", getCreaturePosition(cid))
	doSummonCreature("Infected Sheep", getCreaturePosition(cid))
	elseif luck == 4 then
	doSummonCreature("Hellhound", getCreaturePosition(cid))
	doSummonCreature("Banshiria", getCreaturePosition(cid))
	doSummonCreature("Banshiria", getCreaturePosition(cid))
	elseif luck == 5 then
	doSummonCreature("Plague Blob", getCreaturePosition(cid))
	doSummonCreature("Dark Torturer", getCreaturePosition(cid))
	doSummonCreature("Hellbringer", getCreaturePosition(cid))
	doSummonCreature("Infected Sheep", getCreaturePosition(cid))
	end
	
	return doCombat(cid, combat, var)
end
