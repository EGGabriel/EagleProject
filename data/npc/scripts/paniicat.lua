------------------- Npc ------------------

local focus = 0
local talk_start = 0
local target = 0
local following = false
local attacking = false

stime = 35 -- Tempo entre as falas do npc (em segundos)
time = os.clock()
function onThink()
if (time + stime) < os.clock() then
time = os.clock()
var = math.random(1,10)
if var == 1 then
selfSay("Naum sou o professor do Michael Jackson, mas eu vou ensinar a andar p/ trás, sai de perto Tarado ¬¬")
end
if var == 2 then
selfSay("Naum é que eu naum uso muita roupa, é que eu naum comprei addon :B.")
end
if var == 3 then
selfSay("Naum use BOT porque naum POD e é pra NOB! *-*")
end
if var == 4 then
selfSay("Aiihmmm Sabio... Perai... Bolinha essa não é a minha fala né? :'{(")
end
if var == 5 then
selfSay("As vezes da vontade de passear, mas fazer o que esse é o meu emprego rs' ")
end
if var == 6 then
selfSay("Antes burra do que feia né? É o que eu sempre digo :P")
end
if var == 7 then
selfSay("Naum use BOT porque naum POD e é pra NOB! *-*")
end
if var == 8 then
selfSay("Aiihmmm Sabio... Perai... Bolinha essa não é a minha fala né? :'{(")
end
if var == 9 then
selfSay("Antes burra do que feia né? É o que eu sempre digo :P")
end
if var == 10 then
selfSay("Tira esses olhos dai meniino ! Pode ter gente olhando rs' ")
end
end
end