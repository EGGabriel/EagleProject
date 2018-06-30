local focus = 0
local talk_start = 0

function onThingMove(creature, thing, oldpos, oldstackpos)
end

function onCreatureAppear(creature)
end

function onCreatureDisappear(cid, pos)
    if focus == cid then
        selfSay('Good bye then.')
        focus = 0
        talk_start = 0
    end
end

function onCreatureTurn(creature)
end

function msgcontains(txt, str)
    return (string.find(txt, str) and not string.find(txt, '(%w+)' .. str) and not string.find(txt, str .. '(%w+)'))
end

function onCreatureSay(cid, type, msg)
    msg = string.lower(msg)

    if (msgcontains(msg, 'hi') and focus == 0) and getDistanceToCreature(cid) < 4 then
        selfSay('Hello ' .. creatureGetName(cid) .. '! Welcome to the Tibia\'s bank system.')
        focus = cid
        talk_start = os.clock()

    elseif msgcontains(msg, 'hi') and (focus ~= cid) and getDistanceToCreature(cid) < 4 then
        selfSay('Sorry, ' .. creatureGetName(cid) .. '! I talk to you in a minute.')

    elseif focus == cid then
        if msgcontains(msg, 'balance') then
            balance(cid)
            talk_state = 0
            talk_start = os.clock()

        elseif msgcontains(msg, 'deposit') and getCount(msg) > 0 then
            value = getCount(msg)
            selfSay('Would you really like to deposit '..value..' gold?')
            talk_state = 2
            talk_start = os.clock()

        elseif msgcontains(msg, 'deposit') then
            selfSay('Please tell me how much gold it is you would like to deposit.')
            talk_state = 1
            talk_start = os.clock()

        elseif talk_state == 1 then
            value = getCount(msg)
            if value > 0 then
                selfSay('Would you really like to deposit '..value..' gold?')
                talk_state = 2
            else
                talk_state = 0
            end

        elseif msgcontains(msg, 'yes') and talk_state == 2 then
            deposit(cid, value)
            talk_state = 0

        elseif msgcontains(msg, 'transfer') and getCount(msg) > 0 then
            value = getCount(msg)
            selfSay('What\'s the player name you want to transfer '..value..' gold?')
            talk_state = 5
            talk_start = os.clock()

        elseif talk_state == 5 then
            xid = getPlayerByName(msg)
            if xid == 0 then
                selfSay('Player "'..msg..'" not found!')
                talk_state = 0
            elseif xid == cid then
                selfSay('Sorry, you cannot transfer money to yourself.')
                talk_state = 0
            else
                NomeDele = getPlayerName(xid)
                selfSay('Are you sure you wish to transfer '..value..' gold from your bank to '..NomeDele..' bank?')
                talk_state = 8
            end

        elseif msgcontains(msg, 'transfer') then
            selfSay('Please tell me how much gold you would like to transfer?')
            talk_state = 7
            talk_start = os.clock()

        elseif talk_state == 7 then
            value = getCount(msg)
            if value > 0 then
                selfSay('What\'s the player name you want to transfer '..value..' gold?')
                talk_state = 5
                talk_start = os.clock()
            else
                talk_state = 0
            end

        elseif msgcontains(msg, 'yes') and talk_state == 8 then
            transfer(cid, value, xid)
            talk_state = 0

        elseif msgcontains(msg, 'withdraw') and getCount(msg) > 0 then
            value = getCount(msg)
            selfSay('Are you sure you wish to withdraw '..value..' gold from your bank account?')
            talk_state = 3
            talk_start = os.clock()

        elseif msgcontains(msg, 'withdraw') then
            talk_state = 4
            selfSay('Please tell me how much gold you would like to withdraw.')
            talk_start = os.clock()

        elseif talk_state == 4 then
            value = getCount(msg)
            if value > 0 then
                selfSay('Are you sure you wish to withdraw '..value..' gold from your bank account?')
                talk_state = 3
            else
                talk_state = 0
            end

        elseif msgcontains(msg, 'yes') and talk_state == 3 then
            withdraw(cid, value)
            talk_state = 0

        elseif msgcontains(msg, 'no') and talk_state == 2 then
            selfSay('As you wish. Is there something else I can do for you?')
            talk_state = 0

        elseif msgcontains(msg, 'no') and talk_state == 3 then
            selfSay('The custommer is king! Come back anytime you want to if you wish to withdraw your money.')
            talk_state = 0

        elseif msgcontains(msg, 'bye') and getDistanceToCreature(cid) < 4 then
            selfSay('Bye bye ' .. creatureGetName(cid) .. ', come back anytime you want talk about money.')
            focus = 0
            talk_start = 0

        elseif msg ~= "" then
            selfSay('You are in a bank! Just talk about business.')
            talk_state = 0
        end
    end
end

function onCreatureChangeOutfit(creature)
end

function onThink()
    doNpcSetCreatureFocus(focus)
    if (os.clock() - talk_start) > 30 then
        if focus > 0 then
            selfSay('Next money owner, please...')
        end
        focus = 0
        talk_start = 0
    end
    if focus ~= 0 then
        if getDistanceToCreature(focus) > 5 then
            selfSay('Good bye then. Good talk with you about money.')
            focus = 0
            talk_start = 0
        end
    end
end