local f = {
[0] = {2173, 2461, 2467, 2383, 2512, 2649, 2643},
[25] = {2173, 2461, 2467, 2190, 2512, 2649, 2643},
[27] = {2173, 2461, 2467, 2190, 2512, 2649, 2643},
[21] = {2173, 2461, 2467, 2182, 2512, 2649, 2643},
[23] = {2173, 2461, 2467, 2182, 2512, 2649, 2643},
[11] = {2173, 2461, 2467, 2456, 2544, 2649, 2643},
[13] = {2173, 2461, 2467, 2456, 2544, 2649, 2643},
[31] = {2173, 2461, 2467, 2383, 2512, 2649, 2643},
[33] = {2173, 2461, 2467, 2383, 2512, 2649, 2643}
}

function onLogin(cid)
  voc = getPlayerVocation(cid)
  if getPlayerStorageValue(cid, 30001) == -1 then
        for i = 1,7 do
            doPlayerAddItem(cid, f[voc][i], 1)
        end
  local bag = doPlayerAddItem(cid, 1988, 1)
  doAddContainerItem(bag, 2152, 25)
  doAddContainerItem(bag, 7618, 25)
  doAddContainerItem(bag, 7620, 25)
  doAddContainerItem(bag, 2789, 25)
  doAddContainerItem(bag, 2554, 1)
  doAddContainerItem(bag, 2120, 1)
  doAddContainerItem(bag, 2173, 1)
  doAddContainerItem(bag, 2175, 1)
        if getPlayerVocation(cid) == 11 or getPlayerVocation(cid) == 13 then
            doPlayerAddItem(cid, 2544, 100)
            doAddContainerItem(bag, 2544, 100)
        end
  setPlayerStorageValue(cid, 30001, 1)
  end
return TRUE
end