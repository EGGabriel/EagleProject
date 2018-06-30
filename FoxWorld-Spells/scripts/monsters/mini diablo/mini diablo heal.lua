function onCastSpell(cid, var)
	if getCreatureHealth(cid) < (getCreatureMaxHealth(cid)*0.3) then -- se a vida dele for menor que 30% do total de vida que ele tem
		doCreatureAddHealth(cid, ( (getCreatureMaxHealth(cid)-getCreatureHealth(cid))*0.5 ) )
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_BLUE)
	end
end