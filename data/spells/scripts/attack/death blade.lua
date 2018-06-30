local config = {
seconds = 2,
storage = 111310,
msg = "Você precisa aguardar %d segundos para acumular o espírito.",
manaPercentage = 20,
semMana = "Voc\ê n\ão t\êm mana suficiente."
}

local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 9)
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setAttackFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, 0.20, 0.20, 1, 1)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 0)
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setAttackFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, 0.19, 0.19, 1, 1)

local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_EFFECT, 9)
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setAttackFormula(combat3, COMBAT_FORMULA_LEVELMAGIC, 0.18, 0.18, 1, 1)

local combat4 = createCombatObject()
setCombatParam(combat4, COMBAT_PARAM_EFFECT, 0)
setCombatParam(combat4, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setAttackFormula(combat4, COMBAT_FORMULA_LEVELMAGIC, 0.17, 0.17, 1, 1)

local combat5 = createCombatObject()
setCombatParam(combat5, COMBAT_PARAM_EFFECT, 9)
setCombatParam(combat5, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setAttackFormula(combat5, COMBAT_FORMULA_LEVELMAGIC, 0.16, 0.16, 1, 1)

local combat6 = createCombatObject()
setCombatParam(combat6, COMBAT_PARAM_EFFECT, 0)
setCombatParam(combat6, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setAttackFormula(combat6, COMBAT_FORMULA_LEVELMAGIC, 0.15, 0.15, 1, 1)

local combat7 = createCombatObject()
setCombatParam(combat7, COMBAT_PARAM_EFFECT, 9)
setCombatParam(combat7, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setAttackFormula(combat7, COMBAT_FORMULA_LEVELMAGIC, 0.15, 0.15, 1, 1)

local combat8 = createCombatObject()
setCombatParam(combat8, COMBAT_PARAM_EFFECT, 0)
setCombatParam(combat8, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setAttackFormula(combat8, COMBAT_FORMULA_LEVELMAGIC, 0.15, 0.15, 1, 1)

arr1 = {
{1, 2},
{1, 0}}

arr2 = {
{1, 0},
{1, 2}}

arr3 = {
{1, 1},
{0, 2}}

arr4 = {
{1, 1},
{2, 0}}

arr5 = {
{0, 1},
{2, 1}}

arr6 = {
{2, 1},
{0, 1}}

arr7 = {
{2, 0},
{1, 1}}

arr8 = {
{0, 2},
{1, 1}}

local area1 = createCombatArea(arr1)
local area2 = createCombatArea(arr2)
local area3 = createCombatArea(arr3)
local area4 = createCombatArea(arr4)
local area5 = createCombatArea(arr5)
local area6 = createCombatArea(arr6)
local area7 = createCombatArea(arr7)
local area8 = createCombatArea(arr8)
setCombatArea(combat1, area1)
setCombatArea(combat2, area2)
setCombatArea(combat3, area3)
setCombatArea(combat4, area4)
setCombatArea(combat5, area5)
setCombatArea(combat6, area6)
setCombatArea(combat7, area7)
setCombatArea(combat8, area8)

function onCastSpell(cid, var)
local manaConsumption = getCreatureMaxMana(cid)*config.manaPercentage/100
	if config.seconds-(os.time()-getPlayerStorageValue(cid, config.storage)) > 0 then
		doPlayerSendCancel(cid, string.format(config.msg, config.seconds-(os.time()-getPlayerStorageValue(cid, config.storage))))
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
		return false
	end
	if getCreatureMana(cid) < manaConsumption then
	doPlayerSendCancel(cid, config.semMana)
	doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
	return false
	end
setPlayerStorageValue(cid, config.storage, os.time())
doPlayerAddMana(cid, -manaConsumption)	
local self = getCreaturePosition(cid)
pos1 = {x=self.x + 1, y=self.y - 1, z=self.z}	
pos2 = {x=self.x + 1, y=self.y + 1, z=self.z}
pos3 = {x=self.x + 1, y=self.y + 1, z=self.z}	
pos4 = {x=self.x - 1, y=self.y + 1, z=self.z}
pos5 = {x=self.x - 1, y=self.y + 1, z=self.z}	
pos6 = {x=self.x - 1, y=self.y - 1, z=self.z}
pos7 = {x=self.x - 1, y=self.y - 1, z=self.z}	
pos8 = {x=self.x + 1, y=self.y - 1, z=self.z}
addEvent(doSendDistanceShoot, 0, pos1, pos2, 24)
addEvent(doCombat, 0, cid, combat1, var)
addEvent(doCombat, 150, cid, combat2, var)
addEvent(doSendDistanceShoot, 300, pos2, pos4, 24)
addEvent(doCombat, 300, cid, combat3, var)
addEvent(doCombat, 450, cid, combat4, var)
addEvent(doSendDistanceShoot, 600, pos5, pos6, 24)
addEvent(doCombat, 600, cid, combat5, var)
addEvent(doCombat, 750, cid, combat6, var)
addEvent(doSendDistanceShoot, 900, pos7, pos8, 24)
addEvent(doCombat, 900, cid, combat7, var)
addEvent(doCombat, 1050, cid, combat8, var)
return true
end