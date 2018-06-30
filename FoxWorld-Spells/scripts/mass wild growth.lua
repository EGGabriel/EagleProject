-- spell by grandeyang --
local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_EARTH)
setCombatParam(combat, COMBAT_PARAM_CREATEITEM, 1499)

arr = {
{0, 0, 0, 0, 0},
{0, 1, 1, 1, 0},
{0, 1, 3, 1, 0},
{0, 1, 0, 1, 0}
}

local area = createCombatArea(arr)
setCombatArea(combat, area)

function onCastSpell(cid, var)
	-- if getPlayerStorageValue(cid,30025) == 1 or getPlayerVocation(cid) == 10 then -- testa se tem a skill Chamada do Outono ou se é god
		if getPlayerVocation(cid) == 10 then
			playerMana = 0 -- GOD
		else
			playerMana = 800 -- outras vocações
		end
		
		if getPlayerMana(cid) >= playerMana then
			if isPlayerExhausted(cid, 51002) == FALSE then
				doPlayerAddMana(cid,-playerMana,0)
				doPlayerAddManaSpent(cid, playerMana)
				doCombat(cid, combat, var)
				if getPlayerVocation(cid) ~= 10 then
					setPlayerExhaust(cid, 51002, 20)
				end
			else
				doPlayerSendCancel(cid, "Você precisa aguardar "..getPlayerExhaustion(cid, 51002).." segundos para acumular espírito.")
			end
		else
			doPlayerSendCancel(cid, "You do not have enough mana.")
		end
	-- else
		-- doPlayerSendCancel(cid, "Você não possui esta habilidade especial.")
	-- end
	return TRUE
end
