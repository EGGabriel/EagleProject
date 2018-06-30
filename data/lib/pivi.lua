function doUseGem(cid, item)
gems = {
id = {2156, 2155, 2158, 2154, 2156, 2155, 2158, 2154, 2153, 2153}}

  local voc = getPlayerVocation(cid)

  if item.itemid ~= gems.id[voc] then
    return FALSE
  end

  setPlayerStorageValue(cid, 5001, 1)
  sendGemEffect(cid, 5001, 1200)
  doRemoveItem(item.uid, 1)

  return TRUE  
end

function sendGemEffect(cid, interval)

gems = {
id = {2156, 2155, 2158, 2154, 2156, 2155, 2158, 2154, 2153, 2153}}

gemMsg = {
rnd = {"+boost¤  ", "   +boost¤", "+boost¤  ", "   +boost¤"},
colorSorcerer = {154,192},
colorDruid = {35,66},
colorPaladin = {210,205},
colorKnight = {180,129},
colorMasterSorcerer = {154,192},
colorElderDruid  = {35,66},
colorRoyalPaladin = {210,205},
colorEliteKnight = {180,129},
colorPriest = {215,144},
colorShadowPriest = {215,144}
}

if isPlayer(cid) then

  local pos = getThingPos(cid)
  local voc = getPlayerVocation(cid)
  local color = 1

    if (voc == 1) or (voc == 5) then
      color = gemMsg.colorSorcerer[math.random(1,#gemMsg.colorMasterSorcerer)]
    elseif (voc == 2) or (voc == 6) then
      color = gemMsg.colorDruid[math.random(1,#gemMsg.colorElderDruid)]
    elseif (voc == 3) or (voc == 7) then
      color = gemMsg.colorPaladin[math.random(1,#gemMsg.colorRoyalPaladin)]
    elseif (voc == 4) or (voc == 8) then
      color = gemMsg.colorKnight[math.random(1,#gemMsg.colorEliteKnight)]
	elseif (voc == 9) or (voc == 10) then
	  color = gemMsg.colorPriest[math.random(1,#gemMsg.colorShadowPriest)]
    end

    doSendAnimatedText(pos, gemMsg.rnd[math.random(1,#gemMsg.rnd)], color)
	
	if (math.random(1,2) == 1) then
	doSendMagicEffect(pos, 65)
	doCreatureAddHealth(cid, 100)
	doCreatureAddMana(cid, 100)
	doPlayerAddSoul(cid, 1)
	end
	
        if getPlayerStorageValue(cid, 5001) >= 1 then 
        addEvent(sendGemEffect, 5000, cid, 5000)
        end

end
return true
end

function isGemActivated(cid)
  if (getPlayerStorageValue(cid, 5001) >= 1) and  (getPlayerStorageValue(cid,21202) >= 1) then
    return TRUE
  end
  return FALSE
end

function doRemoveGemEffect(cid)
  if getPlayerStorageValue(cid, 5001) >= 1 then
  setPlayerStorageValue(cid, 5001, 0)
  end
return TRUE
end