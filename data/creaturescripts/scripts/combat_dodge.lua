local storagedodge = 48902 -- storage do dodge
local cor = 20 -- cor do texto
local effect = 30 -- id do magic effect 
local msg = "DODGE" -- msg
 
local dodge = { 
    {min = 1, max = 20, chance = 5}, -- se o dodge tiver entre 1 e 2 tem 10% de chance de da dodge.
    {min = 21, max = 40, chance = 10}, -- podem ser configurada portanto que não passe do limite
    {min = 41, max = 60, chance = 15}, -- vocês pode adicionar mas se quiserem
    {min = 61, max = 80, chance = 20},
    {min = 81, max = 100, chance = 25}
}
 
function onStatsChange(cid, attacker, type, combat, value)
    if not isCreature(cid) then
        return false
    end
    for _, tudo in pairs(dodge) do
        if getPlayerStorageValue(cid, storagedodge) >= tudo.min and getPlayerStorageValue(cid, storagedodge) <= tudo.max then
            local chancex = math.random(1, 100)
            if chancex <= tudo.chance then
                if combat ~= COMBAT_HEALING then
                    doSendMagicEffect(getCreaturePosition(cid), effect)
                    doSendAnimatedText(getCreaturePosition(cid), msg, cor)
                    return false
                end
            end
        end
    end
    return true
end