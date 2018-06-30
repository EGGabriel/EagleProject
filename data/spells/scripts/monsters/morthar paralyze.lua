local combat = createCombatObject()

local meteor = createCombatObject()
setCombatParam(meteor, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 44)
setCombatFormula(meteor, COMBAT_FORMULA_LEVELMAGIC, -5.5, -550, -4.5, -400)

local stun = createConditionObject(CONDITION_PARALYZE)
setConditionParam(stun, CONDITION_PARAM_TICKS, 10000)
setConditionFormula(stun, -0.8, 0, -0.9, 0)
setCombatCondition(meteor, stun)

area1 = {
	{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
	{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
	{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
	{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
	{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
	{1, 1, 1, 1, 1, 3, 1, 1, 1, 1, 1},
	{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
	{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
	{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
	{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
	{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
}

local area1 = createCombatArea(area1)
setCombatArea(combat, area1)

local function meteorCast(p)
    doCombat(p.cid, p.combat, positionToVariant(p.pos))
end

function onTargetTile(cid, pos)
    if (math.random(0, 1) == 1) then
        local ground = getThingfromPos({x = pos.x, y = pos.y, z = pos.z, stackpos = 0})      
        local newpos = {x = pos.x - 7, y = pos.y - 6, z = pos.z}
        doSendDistanceShoot(newpos, pos, CONST_ANI_LARGEROCK)
        addEvent(meteorCast, 200, {cid = cid,pos = pos, combat = meteor})
    end
end

setCombatCallback(combat, CALLBACK_PARAM_TARGETTILE, "onTargetTile")

function onCastSpell(cid, var)
	addEvent(doCombat, 000, cid, combat, var)
	addEvent(doCombat, 500, cid, combat, var)
	addEvent(doCombat, 1000, cid, combat, var)
	addEvent(doCombat, 1500, cid, combat, var)
	addEvent(doCombat, 2000, cid, combat, var)
end