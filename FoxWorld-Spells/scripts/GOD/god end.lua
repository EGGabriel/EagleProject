function onCastSpell(cid, var)
	local alvo = getCreatureTarget(cid)
	doCreatureAddHealth(alvo,-(getCreatureHealth(alvo)-1))
	doSendAnimatedText(getCreaturePosition(alvo),"GOD END!",TEXTCOLOR_YELLOW)
	return TRUE
end
