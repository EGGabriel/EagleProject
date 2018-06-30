local water = {490, 491, 492, 493, 4608, 4609, 4610, 4611, 4612, 4613, 4614, 4615, 4616, 4617, 4618, 4619, 4620, 4621, 4622, 4623, 4624, 4625}

local combat = createCombatObject()

local meteor = createCombatObject()
setCombatParam(meteor, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(meteor, COMBAT_PARAM_USECHARGES, TRUE)
setCombatParam(meteor, COMBAT_PARAM_EFFECT, 39)
setCombatFormula(meteor, COMBAT_FORMULA_LEVELMAGIC, -5.5, -35, -3.1, -325)

local stun = createConditionObject(CONDITION_ENERGY)
setConditionParam(stun, CONDITION_PARAM_DELAYED, 1)
addDamageCondition(stun, 1, 3000, -400)
addDamageCondition(stun, 1, 3000, -400)
addDamageCondition(stun, 1, 3000, -400)
addDamageCondition(stun, 1, 3000, -400)
addDamageCondition(stun, 1, 3000, -400)
addDamageCondition(stun, 1, 3000, -400)
addDamageCondition(stun, 1, 3000, -400)
addDamageCondition(stun, 1, 3000, -400)
addDamageCondition(stun, 1, 3000, -400)
addDamageCondition(stun, 1, 3000, -400)
setCombatCondition(meteor, stun)

local meteor_water = createCombatObject()
setCombatParam(meteor_water, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(meteor_water, COMBAT_PARAM_USECHARGES, TRUE)
setCombatParam(meteor_water, COMBAT_PARAM_EFFECT, 39)
setCombatFormula(meteor_water, COMBAT_FORMULA_LEVELMAGIC, -5.5, -35, -3.1, -325)

combat_arr = {
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{1, 1, 1, 1, 1, 3, 1, 1, 1, 1, 1},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0}
}

local combat_area = createCombatArea(combat_arr)
setCombatArea(combat, combat_area)

local function meteorCast(p)
    doCombat(p.cid, p.combat, positionToVariant(p.pos))
end

local function stunEffect(cid)
    doSendMagicEffect(getThingPos(cid), CONST_ME_STUN)
end

function onTargetTile(cid, pos)
    if (math.random(0, 1) == 1) then
        local ground = getThingfromPos({x = pos.x, y = pos.y, z = pos.z, stackpos = 0})
        if (isInArray(water, ground.itemid) == TRUE) then
            local newpos = {x = pos.x - 7, y = pos.y - 6, z = pos.z}
            doSendDistanceShoot(newpos, pos, CONST_ANI_HOLY)
            addEvent(meteorCast, 200, {cid = cid, pos = pos, combat = meteor_water})
        else
            local newpos = {x = pos.x - 7, y = pos.y - 6, z = pos.z}
            doSendDistanceShoot(newpos, pos, CONST_ANI_HOLY)
            addEvent(meteorCast, 200, {cid = cid,pos = pos, combat = meteor})
        end
    end
end

setCombatCallback(combat, CALLBACK_PARAM_TARGETTILE, "onTargetTile")

function onCastSpell(cid, var)
local mana = 0.60
local cmana = getCreatureMana(cid)

if cmana >= mana then
    if getPlayerStorageValue(cid, 21202) == 1 then
      doCreatureAddMana(cid, -(mana * getCreatureMaxMana(cid)))
      doRemoveGemEffect(cid)
      setPlayerStorageValue(cid, 21202, -1)
      return doCombat(cid, combat, var)
    else
      doSendMagicEffect(getThingPos(cid), CONST_ME_POFF)
doPlayerSendCancel(cid, "Você precisa absorver uma gema espiritual para usar essa magia.")
      return FALSE
    end
  else
    doSendMagicEffect(getThingPos(cid), CONST_ME_POFF)
 doPlayerSendCancel(cid, "Você não possui mana suficiente.")
return FALSE
  end
end