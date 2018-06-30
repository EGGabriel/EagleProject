function onSay(cid, words, param)
local config = {
   levelsdodge = 100,  --- leveis que terão
   levelscritical = 100,
   storagedodge = 48902, -- storage que será verificado
   storagecritical = 48903
   }
local text = ""  
text = "Dodge Skill: \n [" ..getPlayerStorageValue(cid, config.storagedodge).. "/100]\n\n-----------------------------"
text = text.. "Critical Skill: \n [" ..getPlayerStorageValue(cid, config.storagecritical).. "/100]"
doShowTextDialog(cid,2175,text)
	return true
end
