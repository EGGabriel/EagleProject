-- spell by grandeyang --
local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, 1)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, 0)

function onCastSpell(cid, var)
	playerLevel = getPlayerLevel(cid)
	
	if playerLevel > 500 then
		mana_bonus = (playerLevel/10)+70
	elseif playerLevel > 400 then
		mana_bonus = (playerLevel/10)+60
	elseif playerLevel > 300 then
		mana_bonus = (playerLevel/10)+50
	elseif playerLevel > 250 then
		mana_bonus = (playerLevel/10)+40
	elseif playerLevel > 200 then
		mana_bonus = (playerLevel/10)+30
	elseif playerLevel > 150 then
		mana_bonus = (playerLevel/10)+20
	elseif playerLevel > 100 then
		mana_bonus = (playerLevel/10)+10
	else
		mana_bonus = (playerLevel/10)
	end

	random_mana = math.random( (140+mana_bonus) , (240+mana_bonus) )

	doPlayerAddMana(cid,random_mana)
	pos = getPlayerPosition(cid)
	doSendAnimatedText(pos, "Aaaaah...", TEXTCOLOR_BLUE)
	return doCombat(cid, combat, var)
end
