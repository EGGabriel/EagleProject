local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, CONST_ME_YELLOWENERGY)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -0.0, -1500, -0.0, -2200)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_NONE)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, CONST_ME_FIREAREA)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -0.0, -0, -0.0, -0)

local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combat3, COMBAT_PARAM_EFFECT, CONST_ME_EXPLOSIONHIT)
setCombatFormula(combat3, COMBAT_FORMULA_LEVELMAGIC, -0.0, -0, -0.0, -0)

local combat4 = createCombatObject()
setCombatParam(combat4, COMBAT_PARAM_TYPE, COMBAT_NONE)
setCombatParam(combat4, COMBAT_PARAM_EFFECT, CONST_ME_EXPLOSIONHIT)
setCombatFormula(combat4, COMBAT_FORMULA_LEVELMAGIC, -0.0, -1400, -0.0, -1800)

local combat5 = createCombatObject()
setCombatParam(combat5, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat5, COMBAT_PARAM_EFFECT, CONST_ME_YELLOWENERGY)
setCombatFormula(combat5, COMBAT_FORMULA_LEVELMAGIC, -0.0, -500, -0.0, -800)

local area1 = createCombatArea(
	{
	{3}
	}
)
setCombatArea(combat1, area1)
setCombatArea(combat2, area1)

local area2 = createCombatArea(
	{
	{1, 1, 1},
	{1, 2, 1},
	{1, 1, 1}
	}
)
setCombatArea(combat3, area2)
	
local area3 = createCombatArea(
	{
	{0, 0, 1, 1, 1, 0, 0},
	{0, 1, 1, 1, 1, 1, 0},
	{1, 1, 1, 1, 1, 1, 1},
	{1, 1, 1, 2, 1, 1, 1},
	{1, 1, 1, 1, 1, 1, 1},
	{0, 1, 1, 1, 1, 1, 0},
	{0, 0, 1, 1, 1, 0, 0}
	}
)
setCombatArea(combat4, area3)

local area4 = createCombatArea(
	{
	{1, 0, 0, 0, 0, 0, 1},
	{0, 1, 0, 0, 0, 1, 0},
	{0, 0, 1, 0, 1, 0, 0},
	{0, 0, 0, 2, 0, 0, 0},
	{0, 0, 1, 0, 1, 0, 0},
	{0, 1, 0, 0, 0, 1, 0},
	{1, 0, 0, 0, 0, 0, 1}
	}
)
setCombatArea(combat5, area4)

local function onCastSpell7(p)
	if isCreature(p.cid) == FALSE then -- interrompe a magia se cid deslogar ou morrer
		return TRUE
	end
	doCombat(p.cid, p.combat1, p.var)
	doCombat(p.cid, p.combat2, p.var)
	doCombat(p.cid, p.combat5, p.var)
	doCombat(p.cid, p.combat4, p.var)
end

local function onCastSpell6(p)
	if isCreature(p.cid) == FALSE then -- interrompe a magia se cid deslogar ou morrer
		return TRUE
	end
	doCombat(p.cid, p.combat1, p.var)
	doCombat(p.cid, p.combat2, p.var)
	doCombat(p.cid, p.combat3, p.var)
	addEvent(onCastSpell7, 700, p)
end

local function onCastSpell5(p)
	if isCreature(p.cid) == FALSE then -- interrompe a magia se cid deslogar ou morrer
		return TRUE
	end
	doCombat(p.cid, p.combat1, p.var)
	doCombat(p.cid, p.combat2, p.var)
	doCombat(p.cid, p.combat3, p.var)
	doSendAnimatedText(variantToPosition(p.var), "BOMB!", TEXTCOLOR_YELLOW)
	addEvent(onCastSpell6, 700, p)
end

local function onCastSpell4(p)
	if isCreature(p.cid) == FALSE then -- interrompe a magia se cid deslogar ou morrer
		return TRUE
	end
	doCombat(p.cid, p.combat1, p.var)
	doCombat(p.cid, p.combat2, p.var)
	doCombat(p.cid, p.combat3, p.var)
	doSendAnimatedText(variantToPosition(p.var), "ENERGY", TEXTCOLOR_YELLOW)
	addEvent(onCastSpell5, 700, p)
end

local function onCastSpell3(p)
	if isCreature(p.cid) == FALSE then -- interrompe a magia se cid deslogar ou morrer
		return TRUE
	end
	doCombat(p.cid, p.combat1, p.var)
	doCombat(p.cid, p.combat2, p.var)
	addEvent(onCastSpell4, 700, p)
end

local function onCastSpell2(p)
	if isCreature(p.cid) == FALSE then -- interrompe a magia se cid deslogar ou morrer
		return TRUE
	end
	doCombat(p.cid, p.combat1, p.var)
	doCombat(p.cid, p.combat2, p.var)
	doSendAnimatedText(variantToPosition(p.var), "BOMB!", TEXTCOLOR_YELLOW)
	addEvent(onCastSpell3, 700, p)
end

local function onCastSpell1(p)
	if isCreature(p.cid) == FALSE then -- interrompe a magia se cid deslogar ou morrer
		return TRUE
	end
	doCombat(p.cid, p.combat1, p.var)
	doCombat(p.cid, p.combat2, p.var)
	doSendAnimatedText(variantToPosition(p.var), "ENERGY", TEXTCOLOR_YELLOW)
	addEvent(onCastSpell2, 700, p)
end

function onCastSpell(cid, var)
	addEvent(onCastSpell1, 0, { cid = cid, var = var, combat1 = combat1, combat2 = combat2, combat3 = combat3, combat4 = combat4, combat5 = combat5})
	return TRUE
end
