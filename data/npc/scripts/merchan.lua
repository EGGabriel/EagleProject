------------------- Npc ------------------

local focus = 0
local talk_start = 0
local target = 0
local following = false
local attacking = false

stime = 10 -- Tempo entre as falas do npc (em segundos)
time = os.clock()
function onThink()
if (time + stime) < os.clock() then
time = os.clock()
var = math.random(1,3)
if var == 1 then
selfSay("Ol�, Bem vindo ao Legend's FoxWorld. Para mais informa��es digite !help")
end
if var == 2 then
selfSay("N�o pe�a itens a GM's pois eles n�o podem faze-los.")
end
if var == 3 then
selfSay("N�o use BOTs fora dos treiners, pois isso resultar� no banimento de sua conta.")
end
end
end