function onCastSpell(cid, var)
	local alvo = getCreatureTarget(cid)
	doCreatureAddHealth(alvo,(getCreatureMaxHealth(alvo)-getCreatureHealth(alvo)))
	doSendAnimatedText(getCreaturePosition(alvo),"GOD HEAL!",TEXTCOLOR_YELLOW)
	return TRUE
end
