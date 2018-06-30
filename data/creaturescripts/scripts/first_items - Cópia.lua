local f = {
[0] = {2173, 2461, 2467, 2383, 2512, 2649, 2643},
[1] = {2173, 2461, 2467, 2190, 2512, 2649, 2643},
[2] = {2173, 2461, 2467, 2182, 2512, 2649, 2643},
[3] = {2173, 2461, 2467, 2456, 2544, 2649, 2643},
[4] = {2173, 2461, 2467, 2383, 2512, 2649, 2643},
[9] = {2173, 2461, 2467, 2433, 2512, 2649, 2643},
[11] = {2173, 2461, 2467, 2383, 2512, 2649, 2643},
}

function onLogin(cid)
  voc = getPlayerVocation(cid)
  if getPlayerStorageValue(cid, 30001) == -1 then
  doPlayerAddPremiumDays(cid, 2)
  setPlayerStorageValue(cid, 10010, 1)
        for i = 1,7 do
            doPlayerAddItem(cid, f[voc][i], 1)
        end
  local bag = doPlayerAddItem(cid, 1988, 1)
  doAddContainerItem(bag, 2160, 100)
  doAddContainerItem(bag, 7618, 100)
  doAddContainerItem(bag, 7620, 100)
  doAddContainerItem(bag, 2273, 100)
  doAddContainerItem(bag, 2789, 100)
  doAddContainerItem(bag, 2554, 1)
  doAddContainerItem(bag, 2120, 1)
  doAddContainerItem(bag, 2173, 1)
  doAddContainerItem(bag, 2175, 1)
  doAddContainerItem(bag, 1988, 1)
        if getPlayerVocation(cid) == 3 then
            doPlayerAddItem(cid, 2544, 100)
            doAddContainerItem(bag, 2544, 100)
        end
  setPlayerStorageValue(cid, 30001, 1)
  end
return TRUE
end