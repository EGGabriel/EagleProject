function onCastSpell(cid, var)
	target = getCreatureTarget(cid)
	min = getCreatureHealth(target)/100*10+getCreatureMana(target)/100*5
	max = getCreatureHealth(target)/100*20+getCreatureMana(target)/100*10

	if isPlayer(target) == TRUE and getCreatureHealth(target) >= 50 then
		doTargetCombatHealth(cid, target, 1, -min, -max, 0)
	end
end