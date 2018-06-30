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
selfSay("Olá, Bem vindo ao Legend's FoxWorld. Para mais informações digite !help")
end
if var == 2 then
selfSay("Não peça itens a GM's pois eles não podem faze-los.")
end
if var == 3 then
selfSay("Não use BOTs fora dos treiners, pois isso resultará no banimento de sua conta.")
end
end
end