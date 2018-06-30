local useWorms = TRUE
local waterIds = {493, 4608, 4609, 4610, 4611, 4612, 4613, 4614, 4615, 4616, 4617, 4618, 4619, 4620, 4621, 4622, 4623, 4624, 4625}
function onUse(cid, item, fromPosition, itemEx, toPosition)
	if isInArray(waterIds, itemEx.itemid) == TRUE then
			if getPlayerItemCount(cid, ITEM_WORM) > 0 then
			doPlayerRemoveItem(cid, ITEM_WORM, 1)
			doPlayerAddSkillTry(cid, SKILL_FISHING, 1)
			local pesca = getPlayerSkill(cid, SKILL_FISHING)
			    if math.random(1, 100) <= (pesca) then
						if (pesca >= 50) then
						doPlayerAddItem(cid, 2670, 1)
						    if math.random(1,20) == 1 then
							    if (pesca >= 100) then 
							    doPlayerAddItem(cid, 7158, 1)
							    elseif (pesca >= 80) then 
							    doPlayerAddItem(cid, 7159, 1)
							    elseif (pesca >= 70) then 
							    doPlayerAddItem(cid, 2669, 1)
							   end
							end
						else
					    doPlayerAddItem(cid, ITEM_FISH, 1)
						end
			    end				
			else
			doCreatureSay(cid, "Para atrair os peixes tenha worms para pescar!", TALKTYPE_ORANGE_1)
            doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
            return FALSE
            end
	doSendMagicEffect(toPosition, CONST_ME_LOSEENERGY)
	return TRUE
	end
end