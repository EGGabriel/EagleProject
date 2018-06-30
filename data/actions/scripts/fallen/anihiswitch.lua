-- playerpos  = The position of the players before teleport.
-- player  = Get the thing from playerpos.
-- playerlevel = Get the players levels.
-- questslevel  = The level you have to be to do this quest.
-- questtatus  = Get the quest status of the players.
-- demonpos  = The position of the demons.
-- nplayerpos  = The position where the players should be teleported too.
-- trash= position to send the demons to when clearing, 1 sqm in middle of nowhere is enough
-- starting = Upper left point of the annihilator room area.
-- ending = Bottom right point of the annihilator room area.

function onUse(cid, item, frompos, item2, topos)
if getPlayerGroupId(cid) > 2 and getPlayerGroupId(cid) < 5 then return TRUE end

        if item.uid == 7010  and item.itemid == 1945 then
        player1pos = {x=342, y=1151, z=11, stackpos=253}  
        player1 = getThingfromPos(player1pos)

        player2pos = {x=343, y=1151, z=11, stackpos=253}
        player2 = getThingfromPos(player2pos)

        player3pos = {x=344, y=1151, z=11, stackpos=253}
        player3 = getThingfromPos(player3pos)

        player4pos = {x=345, y=1151, z=11, stackpos=253}
        player4 = getThingfromPos(player4pos)


                if (player1.itemid > 0) and (player2.itemid > 0) and (player3.itemid > 0) and (player4.itemid > 0) then

                player1level = getPlayerLevel(player1.uid)
                player2level = getPlayerLevel(player2.uid)
                player3level = getPlayerLevel(player3.uid)
                player4level = getPlayerLevel(player4.uid)
        
                questlevel = 140

                        if (player1level >= questlevel) and (player2level >= questlevel) and (player3level >= questlevel) and (player4level >= questlevel) then

                        queststatus1 = getPlayerStorageValue(player1.uid,7010)
                        queststatus2 = getPlayerStorageValue(player2.uid,7010)
                        queststatus3 = getPlayerStorageValue(player3.uid,7010)
                        queststatus4 = getPlayerStorageValue(player4.uid,7010)

                                if queststatus1 == -1 and queststatus2 == -1 and queststatus3 == -1 and queststatus4 == -1 then
                                        demon1pos = {x=373, y=1148, z=11}
                                        demon2pos = {x=376, y=1148, z=11}
                                        demon3pos = {x=379, y=1148, z=11}
                                        demon4pos = {x=370, y=1151, z=11}
                                        demon5pos = {x=374, y=1154, z=11}
                                        demon6pos = {x=377, y=1154, z=11}
										demon7pos = {x=380, y=1154, z=11}
										
										demon8pos = {x=377, y=1151, z=11}
										demon9pos = {x=378, y=1151, z=11}
										demon10pos = {x=379, y=1151, z=11}
										demon11pos = {x=380, y=1151, z=11}

                                        doSummonCreature("Demon", demon1pos)
                                        doSummonCreature("Demon", demon2pos)
                                        doSummonCreature("Demon", demon3pos)
                                        doSummonCreature("Demon", demon4pos)
                                        doSummonCreature("Demon", demon5pos)
                                        doSummonCreature("Demon", demon6pos)
										doSummonCreature("Demon", demon7pos)
										
										doSummonCreature("Juggernaut Demon", demon8pos)
                                        doSummonCreature("Juggernaut Demon", demon9pos)
                                        doSummonCreature("Juggernaut Demon", demon10pos)
                                        doSummonCreature("Juggernaut Demon", demon11pos)

                                        nplayer1pos = {x=373, y=1151, z=11} 
                                        nplayer2pos = {x=374, y=1151, z=11}
                                        nplayer3pos = {x=375, y=1151, z=11}
                                        nplayer4pos = {x=376, y=1151, z=11}

                                        doSendMagicEffect(player1pos,2)
                                        doSendMagicEffect(player2pos,2)
                                        doSendMagicEffect(player3pos,2)
                                        doSendMagicEffect(player4pos,2)

                                        doTeleportThing(player1.uid,nplayer1pos)
                                        doTeleportThing(player2.uid,nplayer2pos)
                                        doTeleportThing(player3.uid,nplayer3pos)
                                        doTeleportThing(player4.uid,nplayer4pos)

                                        doSendMagicEffect(nplayer1pos,10)
                                        doSendMagicEffect(nplayer2pos,10)
                                        doSendMagicEffect(nplayer3pos,10)
                                        doSendMagicEffect(nplayer4pos,10)

                                        doTransformItem(item.uid,1945)

                                else
                                doPlayerSendCancel(cid,"Algum dos 4 jogadores ja completou a quest.")
                                end
                        else
                        doPlayerSendCancel(cid,"The four players must be level 140 or higher.")
                        end
                else
                doPlayerSendCancel(cid,"Four players needed.")
                end
-- Codigo de checagem e teleporte dos monstros
                if item.itemid == 1945 then
                starting={x=370, y=1148, z=11, stackpos=253}
                checking={x=starting.x, y=starting.y, z=starting.z, stackpos=starting.stackpos}
                ending={x=381, y=1154, z=11, stackpos=253}
                players=0
                totalmonsters=0
                monster = {}
                repeat
                creature = getThingfromPos(checking)
                if creature.itemid > 0 then
                        if getPlayerAccess(creature.uid) == 0 then
                        players=players+1
                        end
                        if (getPlayerAccess(creature.uid) ~= 0) and (getPlayerAccess(creature.uid) ~= 3) then
                        totalmonsters = totalmonsters+1
                        monster[totalmonsters]=creature.uid
                        end
                end
                checking.x=checking.x+1
                if checking.x>ending.x then
                checking.x=starting.x
                checking.y=checking.y+1
                end
                until checking.y>ending.y
                if players == 0 then
                trash = {x=420, y=1153, z=11}
                current = 0
                repeat
                current = current+1
                if totalmonsters > 0 then
                doTeleportThing(monster[current],trash) 
                end
                until current >= totalmonsters
                doTransformItem(item.uid,1946)
                end
-- Codigo de checagem e teleporte dos monstros
        doTransformItem(item.uid,1946)
        end
else
doTransformItem(item.uid,1945)
end
return TRUE
end