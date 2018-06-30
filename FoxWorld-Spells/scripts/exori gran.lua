local combat0 = createCombatObject()
setCombatParam(combat0, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat0, COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
setCombatFormula(combat0, COMBAT_FORMULA_LEVELMAGIC, -1.8, -10, -1.6, -10)

local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -1.8, -10, -1.6, -10)

local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -1.0, -5, -0.9, -5)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -1.0, -5, -0.9, -5)

local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatFormula(combat3, COMBAT_FORMULA_LEVELMAGIC, -1.0, -5, -0.9, -5)

local combat4 = createCombatObject()
setCombatParam(combat4, COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
setCombatFormula(combat4,COMBAT_FORMULA_LEVELMAGIC, -1.0, -5, -0.9, -5)

local arrA = {
{1, 1, 1},
{1, 3, 1},
{1, 1, 1}
}

local arrB = {
{0, 0, 1, 0, 0},
{0, 1, 1, 1, 0},
{1, 1, 3, 1, 1},
{0, 1, 1, 1, 0},
{0, 0, 1, 0, 0},
}

local areaA = createCombatArea(arrA)
local areaB = createCombatArea(arrB)

setCombatArea(combat0, areaA)
setCombatArea(combat, areaB)
setCombatArea(combat1, areaB)
setCombatArea(combat2, areaB)
setCombatArea(combat3, areaB)
setCombatArea(combat4, areaB)

function onCastSpell(cid, var)
local earthWeapons = {7854,7855,7856,7857,7858,7864,7865,7866,7867,7868,7859,7860,7861,7862,7863,2409,2411,7422}
local energyWeapons = {7869,7870,7871,7872,7873,7879,7880,7881,7882,7883,7874,7875,7876,7877,7878}
local fireWeapons = {7744,7745,7746,7747,7748,7754,7755,7756,7757,7758,7749,7750,7751,7752,7753,2392}
local iceWeapons = {7763,7764,7765,7766,7767,7773,7774,7775,7776,7777,7768,7769,7770,7771,7772}
    if isInArray(earthWeapons, (getPlayerSlotItem(cid, 5).itemid)) == 1 or isInArray(earthWeapons, (getPlayerSlotItem(cid, 6).itemid)) == 1 then
	  doCombat(cid, combat1, var)
	elseif isInArray(energyWeapons, (getPlayerSlotItem(cid, 5).itemid)) == 1 or isInArray(energyWeapons, (getPlayerSlotItem(cid, 6).itemid)) == 1 then
	  doCombat(cid, combat2, var)
	elseif isInArray(fireWeapons, (getPlayerSlotItem(cid, 5).itemid)) == 1 or isInArray(fireWeapons, (getPlayerSlotItem(cid, 6).itemid)) == 1 then
	  doCombat(cid, combat3, var)
	elseif isInArray(iceWeapons, (getPlayerSlotItem(cid, 5).itemid)) == 1 or isInArray(iceWeapons, (getPlayerSlotItem(cid, 6).itemid)) == 1 then
	  doCombat(cid, combat4, var)
	else
	  doCombat(cid, combat0, var)
	  return true
	end
return doCombat(cid, combat, var)
end