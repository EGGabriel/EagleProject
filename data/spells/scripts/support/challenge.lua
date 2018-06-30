local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_RED)
local area = createCombatArea(AREA_SQUARE1X1)
setCombatArea(combat, area)
function onTargetCreature(cid, target) 
doChallengeCreature(cid, target) 
end
setCombatCallback(combat, CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature")

local combatx = createCombatObject()
setCombatParam(combatx, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_RED)
local areax = createCombatArea(AREA_CIRCLE2X2)
setCombatArea(combatx, areax)
function onTargetCreature(cid, target) 
doChallengeCreature(cid, target) 
end
setCombatCallback(combatx, CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature")

function onCastSpell(cid, var)
    if getPlayerStorageValue(cid, 10010) ~= 1 then
	return doCombat(cid, combat, var)
	else
	return doCombat(cid, combatx, var)
	end
end
