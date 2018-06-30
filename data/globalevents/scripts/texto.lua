local positions = {
        ["Downtow"] = { x = 689, y = 699, z = 7 },
        ["HuntsVIP"] = { x = 689, y = 701, z = 7 },
        ["Welcome"] = { x = 700, y = 699, z = 7 },
        ["Teleports"] = { x = 700, y = 688, z = 6 },
		["Temple"] = { x = 359, y = 829, z = 7 },
		["Temple"] = { x = 305, y = 526, z = 7 },
		["Hunt's"] = { x = 152, y = 44, z = 7 },
		['Area VIP 1'] = {x = 170, y = 44, z = 7},
		['Area VIP 2'] = {x = 170, y = 45, z = 7},
		['Area VIP 3'] = {x = 170, y = 46, z = 7},
		['Area VIP 4'] = {x = 170, y = 47, z = 7},
		['Area VIP 5'] = {x = 170, y = 48, z = 7},
    }
	
local brilho = {
{ x = 699, y = 701, z = 7 },
{ x = 700, y = 702, z = 7 },
{ x = 701, y = 701, z = 7 },
{ x = 700, y = 701, z = 7 },
{ x = 700, y = 700, z = 7 },
}

local brilhoTemplo = {
	{x = 170, y = 44, z = 7},
	{x = 170, y = 45, z = 7},
	{x = 170, y = 46, z = 7},
	{x = 170, y = 47, z = 7},
	{x = 170, y = 48, z = 7},
}


function onThink(interval, lastExecution, thinkInterval)
    for text, pos in pairs(positions) do
        doSendAnimatedText(pos, text, math.random(3, 260))
    end
	
	for i in pairs(brilho) do
	    doSendMagicEffect(brilho[i], 14)
	end

	for i in pairs(brilho) do
	    doSendMagicEffect(brilhoTemplo[i], math.random(12, 14))
	end
    
    return TRUE
end  