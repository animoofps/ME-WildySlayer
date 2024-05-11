print("Bobi's Slayer (beta)")
local API = require("api")
local UTILS = require("utils")
local LODESTONES = require("lodestones")
local PIN = 1234
local food = "Shark"

local function hasFood()
    return API.InvItemcount_String(food) > 0
end

local itemIdsToLoot = {37227, -- congealed blood
1762, -- soft clay
31867, -- hydrix bolt tips
28547, -- Crystal triskelion fragment 1
28548, -- Crystal triskelion fragment 2
28549, -- Crystal triskelion fragment 3
35989, -- wyvern spikes
140, -- prayer pot
1249, -- Dragon spear
537, -- Dragon bones
18778, -- starved ancient effigy
18779, -- Nourished ancient effigy
18780, -- Sated ancient effigy
18781, -- Gorged ancient effigy
42893, -- Cursed amascut sand
1620, -- uncut ruby
3025, -- super restore (4)
21793, -- Ragefire boots
21790, -- Glaiven boots
6573, -- Onyx
21787, -- Steadfast boots
21776, -- Shards of Armadyl
11235, -- Dark bow
42009, -- Sealed clue scroll (elite)
39814, -- Hazelmere's signet ring
48769, -- Ciku seed
42009, -- Sealed clue scroll (elite)
52940, -- Gate key
52931, -- Abyssal scourge
42008, -- clue scroll hard
30828, -- Abyssal orb
30825, -- Abyssal wand
7979, -- Abyssal head
52926, -- Jaws of the Abyss
36001, -- raptor key part 1
36012, -- Raptor key part 2
36042, -- Raptor key part 3
36065, -- Raptor key part 4
34151, -- Wyrm spike
34153, -- Wyrm heart
1434, -- dragon mace
25689, -- Off-hand dragon mace
25740, -- offhand dragon longsword
13979, -- corrupt dragon scimi
42010, -- master clue scroll
29863, -- sirenic scale
39068, -- Adrenaline crystal noted
39065, -- wilderness hilt
39895, -- gemstone hauberk
1305, -- dragon longsword
572, -- water orb
36023, -- mammoth tusk
560, -- death rune
1618, -- uncut diamond
13902, -- Statius's warhammer
13884, -- Statius's platebody
13890, -- Statius's platelegs
13887, -- Vesta's plateskirt
13893, -- Zuriel's hood
13864, -- Zuriel's robe top
13858, -- Zuriel's robe bottom
13861, -- Corrupt Statius's warhammer
13926, -- Corrupt Vesta's longsword
13923, -- Corrupt Vesta's spear
13929, -- Corrupt Zuriel's staff
13941, -- Zamorak medallion
14885, -- Armadyl totem
14884, -- Guthixian brazier
14883, -- Ruby chalice
14882, -- Bandos statuette
14881, -- Saradomin statuette
14879, -- Zamorak statuette
14878, -- Armadyl statuette
14877, -- Seren statuette
14876, -- Ancient statuette
14875, -- Revenant Spirit
47660, -- Statius's full helm
13896, -- Morrigan's leather chaps
13873, -- Morrigan's leather body
13870, -- Morrigan's coif
13876, -- Zuriel's staff
13905, -- Vesta's spear
13899, -- Vesta's longsword
13883, -- Morrigan's throwing axe
13879, -- Morrigan's javelin
8836, -- mahogany logs
1752, -- blue dhide
11237, -- dragon arrowheads
4698, -- mud runes
238, -- unicorn horn
13845, -- brawling gloves (melee)
13846, -- Brawling gloves (Ranged)
13847, -- Brawling gloves (Magic)
13848, -- brawling gloves (prayer)
13849, -- Brawling gloves (Agility)
13850, -- brawling gloves (WC)
13851, -- Brawling gloves (FM)
13852, -- brawling gloves (mining)
13853, -- Brawling gloves (Hunter)
13854, -- Brawling gloves (Thieving)
13855, -- Brawling gloves (Smithing)
13856, -- Brawling gloves (Fishing)
13857, -- Brawling gloves (Cooking)
566, -- soul rune
4153, -- granite maul
20667, -- vecna skull
12539, -- grenwall spikes
27157, -- Demon slayer circlet
27159, -- Demon slayer skirt
27161, -- Demon slayer torso
44210, -- Adrenaline urn
27163, -- demon boots
27165, -- Demon slayer gloves
4151, -- abyssal whip
36814, -- mimic token
1988, -- grapes
6571, -- uncut onyx
1516, -- YEW LOGS   
1608, -- sapphire gem
1602, -- diamond
9144, -- rune bolts
1604, -- ruby gem
9191, -- ruby bolt tips
9194, -- onyx bolt tips
44803, -- gold spirit
1150, -- dragon helm
11232, -- dragon dart tips
9245, -- onyx bolts
2435, -- prayer potion (4)
9244, -- dragon bolts
38360, -- revenant drop enchancer
385, -- shark
2971, -- mort myre fungus
44808, -- runite stone spirit
44806, -- luminite stone spirit 
892, -- rune arrows 
41589, -- stalker essence
52937, -- abyss flesh
1514, -- magic logs
208, -- grimy rannar
7937, -- rune essence
990, -- crystal key
44812, -- phasma spirits
44811, -- necrite spirits
54019, -- catalytic anima stone
2486, -- grimy lantadyme
216, -- grimy cadantyne
21621, -- fellstalk seed
-- 210, -- grimy irit
3050, -- grimy toadflax
12175, -- spirit weed
218, -- grimy dwarf  weed
53502, -- wildy chest
41589, -- Stalker Essence
34156, -- wyrm scalp
35985, -- wyvern crossbow
11286, -- Draconic visage
36004, -- ripper claw
36008, -- offhand ripper claw
49283, -- Parasitic orb
41582, -- hexhunter bow
41581, -- Soulgazer's charm
34160, -- searing ashes
1149, -- dragon helm
44, -- rune arrow tips
53, -- headless arrows
29729, -- dark arrowheads
6816, -- wyvern bones
565, -- blood rune
563, -- law rune
1644, -- diamond ring 
1602, -- diamond 
2573, -- ring of wealth
20267, -- ACCURSED ASHES
9192, -- diamond bolt tips
1616, -- dragonstone
1632, -- uncut dragonstone
1622, -- uncut emerald
5296, -- toadflax seed
1778, -- bowstring
9193, -- dragonstone bolt tips
1392, -- staff
37952, -- BLODWEED SEED
34235, -- wild arrows
20269, -- infernal ashes
995} -- coins 
-- #endregion
local function randomizeLavaWormWalker1()
    local LavaWormWalker1 = WPOINT.new(2973 + math.random(-2, 2), 3909 + math.random(-2, 2), 0)
    return LavaWormWalker1
end
local LavaWormWalker1 = randomizeLavaWormWalker1()

local function randomizeLavaWormWalker2()
    local LavaWormWalker2 = WPOINT.new(3039 + math.random(-5, 5), 3812 + math.random(-5, 5), 0)
    return LavaWormWalker2
end
local LavaWormWalker2 = randomizeLavaWormWalker2()
local LavaWormCheck = WPOINT.new(3039, 3812, 0)

local function randomizex()
    local safex = 2960 + math.random(-2, 1)
    return safex
end
local safex = randomizex()
local safey = 3882
local safez = 0

function UTILS.surge()
    local surgeAB = UTILS.getSkillOnBar("Surge")
    if surgeAB ~= nil then
        return API.DoAction_Ability_Direct(surgeAB, 1, API.OFF_ACT_GeneralInterface_route)
    end
    return false
end

function UTILS.dive(destinationTile)
    local diveAB = UTILS.getSkillOnBar("Dive")
    if diveAB ~= nil then
        return API.DoAction_Dive_Tile(destinationTile)
    end
    return false
end

local function combo()
    API.DoAction_WalkerW(WPOINT.new(2973 + math.random(-2, 2), 3865 + math.random(-2, 2), 0))
    API.RandomSleep2(1200, 800, 600)
    UTILS.surge()
    API.DoAction_WalkerW(WPOINT.new(2973 + math.random(-2, 2), 3865 + math.random(-2, 2), 0))
    API.RandomSleep2(1200, 800, 600)
    UTILS.surge()
    API.RandomSleep2(20, 10, 20)
    UTILS.dive(WPOINT.new(safex, safey, safez))
    API.RandomSleep2(200, 200, 200)
    API.DoAction_WalkerW(WPOINT.new(safex, safey, safez))
    API.RandomSleep2(200, 300, 400)
end

local function loot()
    if not API.InvFull_() then
        API.DoAction_Loot_w(itemIdsToLoot, 5, API.PlayerCoordfloat(), 10)
        API.RandomSleep2(800, 200, 400)
        API.WaitUntilMovingEnds()
    else
        if hasFood() then
            print("Eating food for inventory space")
            API.DoAction_Ability("Eat Food", 1, API.OFF_ACT_GeneralInterface_route)
            API.RandomSleep2(800, 400, 600)
        end
    end
end

local function findNPC(npcid, distance)
    local distance = distance or 20
    local npcs = API.GetAllObjArrayInteract(type(npcid) == "table" and npcid or {npcid}, distance, {1})
    return #npcs > 0 and npcs[1] or false
end

local function hasValidTarget()
    local interacting = API.ReadLpInteracting()
    if interacting.Id ~= 0 and interacting.Life >= 0 then
        return true
    else
        return false
    end
end

local function PrayerOff()
    API.RandomSleep2(200, 400, 200)
    if UTILS.isDeflectMagic() then
        print("Turning deflect magic off")
        API.RandomSleep2(200, 400, 600)
        API.DoAction_Ability("Deflect Magic", 1, API.OFF_ACT_GeneralInterface_route)
    elseif UTILS.isDeflectMelee() then
        print("Turning deflect melee off")
        API.RandomSleep2(200, 400, 600)
        API.DoAction_Ability("Deflect Melee", 1, API.OFF_ACT_GeneralInterface_route)
    elseif UTILS.isSoulSplitting() then
        print("Turning soul split off")
        API.RandomSleep2(200, 400, 600)
        API.DoAction_Ability("Soul Split", 1, API.OFF_ACT_GeneralInterface_route)
    end
end

local function MandrithTP()
    API.RandomSleep2(1200, 800, 1000)
    API.DoAction_Ability("Hooded slayer cape", 7, API.OFF_ACT_GeneralInterface_route) -- cape tp
    API.RandomSleep2(800, 600, 1000)
    API.KeyboardPress2(0x31, 60, 100) -- key number 1 
    API.RandomSleep2(1500, 1200, 800)
    API.WaitUntilMovingandAnimEnds()
    API.RandomSleep2(1000, 600, 400)
end

local function MandrithTalk()
    API.RandomSleep2(200, 200, 400)
    API.DoAction_NPC(0x29, API.OFF_ACT_InteractNPC_route2, {6537}, 15)
    API.RandomSleep2(800, 400, 600)
    API.WaitUntilMovingandAnimEnds()
    API.RandomSleep2(300, 400, 600)
    API.DoAction_Interface(0xffffffff, 0xffffffff, 0, 1191, 15, -1, API.OFF_ACT_GeneralInterface_Choose_option)
    API.RandomSleep2(800, 400, 600)
end

local function GuildTP()
    API.RandomSleep2(800, 600, 300)
    API.DoAction_Ability("Max guild Teleport", 1, API.OFF_ACT_GeneralInterface_route)
    API.RandomSleep2(1200, 1000, 2000)
    API.WaitUntilMovingandAnimEnds()
    API.RandomSleep2(1800, 1400, 2000)
end

local function deathCheck()
    API.RandomSleep2(3500, 2500, 4000)
    print("You managed to die... do we grab your things and go back?")
    API.DoAction_NPC(0x29, API.OFF_ACT_InteractNPC_route3, {27299}, 50)
    API.RandomSleep2(1800, 1400, 2000)
    API.DoAction_Interface(0xffffffff, 0xffffffff, 1, 1626, 47, -1, API.OFF_ACT_GeneralInterface_Choose_option) -- hopefully this is correct?
    API.RandomSleep2(1800, 1400, 2000)
    API.DoAction_Interface(0xffffffff, 0xffffffff, 0, 1626, 72, -1, API.OFF_ACT_GeneralInterface_Choose_option)
    API.RandomSleep2(1800, 1400, 2000)
    GuildTP()
    print("Continuing with the task, don't die again!")
end

local function KillCountUI()
    return API.VB_FindPSettinOrder(183, 0).state
end

local function KillsLeft0()
    return KillCountUI()
end

-- try this local function KillsLeft()
--   return API.VB_FindPSettinOrder(183, 0).state == 0
-- end

local function Bank()
    API.RandomSleep2(1500, 1000, 1200)
    if (API.GetPray_() < 600) then
        print("Prayer at " .. API.GetPray_() .. ", renewing it.")
        API.RandomSleep2(400, 400, 600)
        API.DoAction_Object1(0x29, API.OFF_ACT_GeneralObject_route0, {92278}, 50)
        API.RandomSleep2(2500, 1600, 2000)
        API.WaitUntilMovingandAnimEnds()
        print("Continuing with the task after renewing prayer!")
        API.RandomSleep2(400, 400, 600)
        API.DoAction_NPC(0x5, API.OFF_ACT_InteractNPC_route, {19918}, 50)
        API.RandomSleep2(1500, 800, 1200)
        API.WaitUntilMovingEnds()
        API.DoBankPin(PIN)
        API.RandomSleep2(600, 400, 800)
    else
        API.DoAction_NPC(0x5, API.OFF_ACT_InteractNPC_route, {19918}, 50)
        API.RandomSleep2(1500, 800, 1200)
        API.WaitUntilMovingEnds()
        API.DoBankPin(PIN)
        API.RandomSleep2(600, 400, 800)
    end
end

local function NecroBloodPreset() -- necro loadout with 2 blood runes 2 law runes for Annakarl Teleport, Super prayer renewal potion (not really needed) and a wildy sword
    API.RandomSleep2(800, 400, 600)
    API.DoAction_Interface(0x24, 0xffffffff, 1, 517, 119, 2, API.OFF_ACT_GeneralInterface_route)
    API.RandomSleep2(800, 400, 600)
end

local function NecromancyBonePrayerPreset() -- necro loadout with dragontooth necklace and bonecrusher
    API.RandomSleep2(800, 400, 600)
    API.DoAction_Interface(0x24, 0xffffffff, 1, 517, 119, 4, API.OFF_ACT_GeneralInterface_route)
    API.RandomSleep2(800, 400, 600)
end

local function MammothsSlayer() -- FULLFIX , stil a bit clunky, check out why it spams mammoths sometimes
    if findNPC(29343, 50) then
        if not UTILS.isSoulSplitting() then
            API.RandomSleep2(200, 500, 300)
            API.DoAction_Ability("Soul Split", 1, API.OFF_ACT_GeneralInterface_route)
        end
        loot()
        eatfood()
        if not hasValidTarget() then
            API.DoAction_NPC(0x2a, API.OFF_ACT_AttackNPC_route, {29343}, 50, false, 100)
            API.RandomSleep2(1400, 1000, 1500)
        end
    end
end

local function MammothsTask()
    --
    local function randomizeMammothLocation()
        local MammothLocation = WPOINT.new(3023 + math.random(-5, 5), 3921 + math.random(-5, 5), 0)
        return MammothLocation
    end
    local MammothLocation = randomizeMammothLocation()
    local MammothCheck = WPOINT.new(3023, 3921, 0)
    --
    if API.PInAreaW(MammothCheck, 25) then
        repeat
            UTILS:antiIdle()
            MammothsSlayer()
        until (KillsLeft0() == 0) or not API.Read_LoopyLoop()
    elseif not findNPC(19918, 15) then
        GuildTP()
    else
        Bank()
        if API.BankOpen2() then
            NecromancyBonePrayerPreset()
        end
        MandrithTP()
        API.DoAction_WalkerW(MammothLocation)
        API.RandomSleep2(1200, 1000, 1500)
        API.WaitUntilMovingEnds()
    end
end

local function OnyxSlayer()
    if findNPC(29347, 50) then
        if not UTILS.isDeflectMagic() then
            print("not using deflect, turning it on")
            API.RandomSleep2(200, 500, 300)
            API.DoAction_Ability("Deflect Magic", 1, API.OFF_ACT_GeneralInterface_route)
        end
        loot()
        eatfood()
        if not hasValidTarget() then
            API.DoAction_NPC(0x2a, API.OFF_ACT_AttackNPC_route, {29347}, 50, false, 100)
            API.RandomSleep2(800, 400, 600)
        end
    end
end

local function OnyxDragonsTask()
    --
    local function randomizeOnyxLocation()
        local OnyxLocation = WPOINT.new(3223 + math.random(-5, 5), 3779 + math.random(-5, 5), 0)
        return OnyxLocation
    end
    local OnyxLocation = randomizeOnyxLocation()
    local OnyxCheck = WPOINT.new(3223, 3779, 0)
    --
    if API.PInAreaW(OnyxCheck, 25) then
        repeat
            UTILS:antiIdle()
            OnyxSlayer()
        until (KillsLeft0() == 0) or not API.Read_LoopyLoop()
    elseif not findNPC(19918, 15) then
        GuildTP()
    else
        Bank()
        if API.BankOpen2() then
            NecromancyBonePrayerPreset()
        end
        LODESTONES.Wilderness()
        API.WaitUntilMovingandAnimEnds()
        API.RandomSleep2(800, 400, 600)
        API.DoAction_WalkerW(OnyxLocation)
        API.RandomSleep2(800, 400, 600)
        API.WaitUntilMovingEnds()
    end
end

local function AbyssDemonSlayer()
    if findNPC(1615, 50) then
        loot()
        eatfood()
        if not hasValidTarget() then
            if findNPC(21502, 50) then
                API.DoAction_NPC(0x2a, API.OFF_ACT_AttackNPC_route, {21502}, 50, false, 100)
                API.RandomSleep2(1200, 600, 400)
            else
                API.DoAction_NPC(0x2a, API.OFF_ACT_AttackNPC_route, {1615}, 50, false, 100)
                API.RandomSleep2(1200, 600, 400)
            end
        end
    end
end

local function AbyssDemonTask()
    --
    local function randomizeAbyssDemonsLocation()
        local AbyssDemonsLocation = WPOINT.new(3217 + math.random(-5, 5), 3649 + math.random(-5, 5), 0)
        return AbyssDemonsLocation
    end
    local AbyssDemonsLocation = randomizeAbyssDemonsLocation()
    local AbyssDemonsCheck = WPOINT.new(3217, 3649, 0)
    --
    if API.PInAreaW(AbyssDemonsCheck, 25) then
        repeat
            UTILS:antiIdle()
            AbyssDemonSlayer()
        until (KillsLeft0() == 0) or not API.Read_LoopyLoop()
    elseif not findNPC(19918, 15) then
        GuildTP()
    else
        Bank()
        if API.BankOpen2() then
            NecroBloodPreset()
        end
        LODESTONES.Wilderness()
        API.WaitUntilMovingandAnimEnds()
        API.RandomSleep2(800, 400, 600)
        API.DoAction_WalkerW(AbyssDemonsLocation)
        API.RandomSleep2(800, 400, 600)
        API.WaitUntilMovingEnds()
    end
end

local function GargoylesSlayer()
    if findNPC(29354, 50) then
        loot()
        eatfood()
        if not hasValidTarget() then
            API.DoAction_NPC(0x2a, API.OFF_ACT_AttackNPC_route, {29354}, 50, false, 100)
            API.RandomSleep2(800, 400, 600)
        end
    end
end

local function GargoylesTask()
    --
    local function randomizeGargoyleLocation()
        local GargoyleLocation = WPOINT.new(3225 + math.random(-3, 3), 3731 + math.random(-3, 3), 0)
        return GargoyleLocation
    end
    local GargoyleLocation = randomizeGargoyleLocation()
    local GargoyleCheck = WPOINT.new(3225, 3731, 0)
    --
    if API.PInAreaW(GargoyleCheck, 50) then
        repeat
            UTILS:antiIdle()
            GargoylesSlayer()
        until (KillsLeft0() == 0) or not API.Read_LoopyLoop()
    elseif not findNPC(19918, 15) then
        GuildTP()
    else
        Bank()
        if API.BankOpen2() then
            NecroBloodPreset()
        end
        LODESTONES.Wilderness()
        API.WaitUntilMovingandAnimEnds()
        API.RandomSleep2(800, 400, 600)
        API.DoAction_WalkerW(GargoyleLocation)
        API.RandomSleep2(800, 400, 600)
        API.WaitUntilMovingEnds()
    end
end

--[[ --FULLFIX worm animation
local function WyrmMove()
    local interacting = API.ReadLpInteracting()
    if interacting.Anim == 491 then
        return true
    else
        return false
    end
end]]

local function LavaWormSlayer() -- 20630 is the actual npc, animation of the special move is 491
    if findNPC(2417, 50) then -- mound
        eatfood()
        loot()
        if not hasValidTarget() and not findNPC(20630, 50) then
            API.DoAction_NPC(0x29, API.OFF_ACT_InteractNPC_route, {2417}, 50)
            API.RandomSleep2(800, 600, 1200)
        end
    end
end

local function LavaWormTask()
    if API.PInAreaW(LavaWormCheck, 50) then
        repeat
            UTILS:antiIdle()
            LavaWormSlayer()
        until (KillsLeft0() == 0) or not API.Read_LoopyLoop()
    elseif not findNPC(19918, 15) then
        GuildTP()
    else
        Bank()
        if API.BankOpen2() then
            NecroBloodPreset()
        end
        LODESTONES.Wilderness()
        API.WaitUntilMovingandAnimEnds()
        API.RandomSleep2(800, 400, 600)
        API.DoAction_WalkerW(LavaWormWalker2)
        API.RandomSleep2(800, 400, 600)
        API.WaitUntilMovingEnds()
    end
end

local function DarkBeastSlayer()
    if findNPC(29346, 50) then
        if not UTILS.isSoulSplitting() then
            API.RandomSleep2(200, 400, 600)
            API.DoAction_Ability("Soul Split", 1, API.OFF_ACT_GeneralInterface_route)
        end
        loot()
        eatfood()
        if not hasValidTarget() then
            if findNPC(21498, 50) then -- big version of the monster
                API.DoAction_NPC(0x2a, API.OFF_ACT_AttackNPC_route, {21498}, 50, false, 100)
                API.RandomSleep2(1500, 1000, 600)
            end
            API.DoAction_NPC(0x2a, API.OFF_ACT_AttackNPC_route, {29346}, 50, false, 100)
            API.RandomSleep2(800, 400, 600)
        end
    end
end

local function DarkBeastTask()
    --
    randomizeLavaWormWalker1()
    local function randomizeDarkBeastLocation()
        local DarkBeastLocation = WPOINT.new(2979 + math.random(-2, 2), 3802 + math.random(-2, 2), 0)
        return DarkBeastLocation
    end
    local DarkBeastLocation = randomizeDarkBeastLocation()
    local DarkBeastCheck = WPOINT.new(2979, 3802, 0)
    --
    if API.PInAreaW(DarkBeastCheck, 25) then
        repeat
            UTILS:antiIdle()
            DarkBeastSlayer()
        until (KillsLeft0() == 0) or not API.Read_LoopyLoop()
    elseif not findNPC(19918, 15) then
        GuildTP()
    else
        Bank()
        if API.BankOpen2() then
            NecromancyBonePrayerPreset()
        end
        MandrithTP()
        API.DoAction_WalkerW(LavaWormWalker1)
        API.RandomSleep2(200, 400, 600)
        API.WaitUntilMovingEnds()
        if not findObj(65387, 50) then
            API.DoAction_Object1(0x31, 0, {65386}, 50) -- open gates
            API.RandomSleep2(1200, 1000, 1500)
            API.WaitUntilMovingandAnimEnds()
        end
        API.DoAction_WalkerW(DarkBeastLocation)
        API.RandomSleep2(800, 400, 600)
        API.WaitUntilMovingEnds()
    end
end

local function SoulGazersSlayer()
    if findNPC(29350, 50) then
        loot()
        eatfood()
        if not hasValidTarget() then
            if findNPC(25126, 50) then -- elite version
                API.DoAction_NPC(0x2a, API.OFF_ACT_AttackNPC_route, {25126}, 50, false, 100)
                API.RandomSleep2(1200, 800, 600)
                if not UTILS.isDeflectMagic() then
                    print("Elite version spotted, turning Deflect Magic on")
                    API.RandomSleep2(200, 500, 300)
                    API.DoAction_Ability("Deflect Magic", 1, API.OFF_ACT_GeneralInterface_route)
                end
            else
                if UTILS.isDeflectMagic() then
                    print("Elite version not here, turning Deflect Magic off")
                    API.RandomSleep2(200, 500, 300)
                    API.DoAction_Ability("Deflect Magic", 1, API.OFF_ACT_GeneralInterface_route)
                end
                API.DoAction_NPC(0x2a, API.OFF_ACT_AttackNPC_route, {29350}, 50, false, 100)
                API.RandomSleep2(800, 400, 600)
            end
        end
    end
end

local function SoulGazersTask()
    --
    local function randomizeSoulGazersLocation()
        local SoulGazersLocation = WPOINT.new(3306 + math.random(-5, 5), 3729 + math.random(-5, 5), 0)
        return SoulGazersLocation
    end
    local SoulGazersLocation = randomizeSoulGazersLocation()
    local SoulGazersCheck = WPOINT.new(3306, 3729, 0)
    --
    if API.PInAreaW(SoulGazersCheck, 50) then
        repeat
            UTILS:antiIdle()
            SoulGazersSlayer()
        until (KillsLeft0() == 0) or not API.Read_LoopyLoop()
    elseif not findNPC(19918, 15) then
        GuildTP()
    else
        Bank()
        if API.BankOpen2() then
            NecroBloodPreset()
        end
        LODESTONES.Wilderness()
        API.WaitUntilMovingandAnimEnds()
        API.RandomSleep2(800, 400, 600)
        API.DoAction_WalkerW(SoulGazersLocation)
        API.RandomSleep2(800, 500, 300)
        API.WaitUntilMovingEnds()
    end
end

local function RevenantsSlayer()
    eatfood()
    loot()
    if not hasValidTarget() and not API.CheckAnim(5) then -- do apianimcheck because it was spazzing out on revenants
        if findNPC(13481, 50) then -- 1 Revenant dragon !
            API.DoAction_NPC(0x2a, API.OFF_ACT_AttackNPC_route, {13481}, 50, false, 100)
            API.RandomSleep2(800, 400, 600)
        elseif findNPC(13480, 50) then -- 2 Revenant knight
            API.DoAction_NPC(0x2a, API.OFF_ACT_AttackNPC_route, {13480}, 50, false, 100)
            API.RandomSleep2(800, 400, 600)
        elseif findNPC(13479, 50) then -- 3 Revenant dark beast !
            API.DoAction_NPC(0x2a, API.OFF_ACT_AttackNPC_route, {13479}, 50, false, 100)
            API.RandomSleep2(800, 400, 600)
        elseif findNPC(13478, 50) then -- 4Revenant ork
            API.DoAction_NPC(0x2a, API.OFF_ACT_AttackNPC_route, {13478}, 50, false, 100)
            API.RandomSleep2(800, 400, 600)
        elseif findNPC(13477, 50) then -- 5Revenant demon !
            API.DoAction_NPC(0x2a, API.OFF_ACT_AttackNPC_route, {13477}, 50, false, 100)
            API.RandomSleep2(800, 400, 600)
        elseif findNPC(13476, 50) then -- 6Revenant hellhound
            API.DoAction_NPC(0x2a, API.OFF_ACT_AttackNPC_route, {13476}, 50, false, 100)
            API.RandomSleep2(800, 400, 600)
        elseif findNPC(13475, 50) then -- 7 Revenant cyclops
            API.DoAction_NPC(0x2a, API.OFF_ACT_AttackNPC_route, {13475}, 50, false, 100)
            API.RandomSleep2(800, 400, 600)
        elseif findNPC(13474, 50) then -- 8 Revenant werewolf
            API.DoAction_NPC(0x2a, API.OFF_ACT_AttackNPC_route, {13474}, 50, false, 100)
            API.RandomSleep2(800, 400, 600)
        elseif findNPC(13473, 50) then -- 9 Revenant vampyre
            API.DoAction_NPC(0x2a, API.OFF_ACT_AttackNPC_route, {13473}, 50, false, 100)
            API.RandomSleep2(800, 400, 600)
        elseif findNPC(13472, 50) then -- 10 Revenant hobgoblin
            API.DoAction_NPC(0x2a, API.OFF_ACT_AttackNPC_route, {13472}, 50, false, 100)
            API.RandomSleep2(800, 400, 600)
        elseif findNPC(13471, 50) then -- 11 Revenant pyrefiend !
            API.DoAction_NPC(0x2a, API.OFF_ACT_AttackNPC_route, {13471}, 50, false, 100)
            API.RandomSleep2(800, 400, 600)
        elseif findNPC(13470, 50) then -- 12Revenant icefiend
            API.DoAction_NPC(0x2a, API.OFF_ACT_AttackNPC_route, {13470}, 50, false, 100)
            API.RandomSleep2(800, 400, 600)
        end
    end
end

local function RevenantsTask()
    --  
    local function randomizeRevenantsLocation()
        local RevenantsLocation = WPOINT.new(3115 + math.random(-5, 5), 10146 + math.random(-5, 5), 0)
        return RevenantsLocation
    end
    local RevenantsLocation = randomizeRevenantsLocation()
    local RevenantsCheck = WPOINT.new(3115, 10146, 0)
    --
    if API.PInAreaW(RevenantsCheck, 55) then
        repeat
            UTILS:antiIdle()
            RevenantsSlayer()
        until (KillsLeft0() == 0) or not API.Read_LoopyLoop()
    elseif not findNPC(19918, 15) then
        GuildTP()
    else
        Bank()
        if API.BankOpen2() then
            NecroBloodPreset()
        end
        LODESTONES.Wilderness()
        API.WaitUntilMovingandAnimEnds()
        API.DoAction_WalkerW(WPOINT.new(3088 + math.random(-3, 3), 3644 + math.random(-3, 3), 0))
        API.RandomSleep2(1200, 800, 1000)
        API.WaitUntilMovingEnds()
        API.DoAction_Object_r(0x39, 0, {20600}, 100, WPOINT.new(3072, 3648, 0), 5)
        API.RandomSleep2(1200, 800, 500)
        API.WaitUntilMovingandAnimEnds()
        API.RandomSleep2(1500, 1800, 2000)
        if findNPC(4700, 50) then -- check if we are inside
            API.DoAction_WalkerW(RevenantsLocation)
            API.RandomSleep2(1200, 800, 500)
            API.WaitUntilMovingEnds()
        end
    end
end

--[[
    local function WyvernPotCheck()
        local antifireID = (API.Buffbar_GetIDstatus(14692, false).id > 0)
        if antifireID then
            if API.DoAction_Ability("Wyrmfire potion", 1, API.OFF_ACT_GeneralInterface_route) then
                return true
            end
        end
        return false
    end
]] --

local function WyvernSpot()
    API.RandomSleep2(100, 100, 100)
    if not API.PInArea(safex, 1, safey, 1, safez) then
        API.DoAction_WalkerW(WPOINT.new(safex, safey, safez))
        API.RandomSleep2(600, 400, 800)
        API.WaitUntilMovingEnds()
    end
end

local function WyvernSlayer()
    if findNPC(29356, 50) then
        eatfood()
        loot()
        WyvernSpot()
        if not UTILS.isSoulSplitting() then
            API.RandomSleep2(400, 200, 400)
            API.DoAction_Ability("Soul Split", 1, API.OFF_ACT_GeneralInterface_route)
        end
        if not hasValidTarget() then
            if findNPC(21992, 50) then
                API.DoAction_NPC(0x2a, API.OFF_ACT_AttackNPC_route, {21992}, 15, false, 100)
                API.RandomSleep2(1800, 800, 600)
            else
                API.DoAction_NPC(0x2a, API.OFF_ACT_AttackNPC_route, {29356}, 15, false, 100)
                API.RandomSleep2(800, 400, 600)
            end
        end
    end
end

local function WyvernTask() -- check if it works properly
    --
    randomizeLavaWormWalker1()
    local WyvernCheck = WPOINT.new(2970, 3896, 0)
    --
    if API.PInAreaW(WyvernCheck, 20) then
        repeat
            UTILS:antiIdle()
            WyvernSlayer()
        until (KillsLeft0() == 0) or not API.Read_LoopyLoop()
    elseif not findNPC(19918, 15) then
        GuildTP()
    else
        Bank()
        if API.BankOpen2() then
            NecromancyBonePrayerPreset()
        end
        MandrithTP()
        API.DoAction_WalkerW(LavaWormWalker1)
        API.RandomSleep2(200, 400, 600)
        API.WaitUntilMovingEnds()
        if not findObj(65387, 50) then
            API.DoAction_Object1(0x31, 0, {65386}, 50) -- open gates
            API.RandomSleep2(1200, 1000, 1500)
            API.WaitUntilMovingandAnimEnds()
        end
        combo()
        API.WaitUntilMovingandAnimEnds()
        -- WyvernPotCheck()
    end
end

local function KalgerionSlayer()
    --
    local KalgerionCheck = WPOINT.new(3278, 3876, 0)
    local function KalgWalk()
        local KalgWalk = WPOINT.new(3278 + math.random(-2, 2), 3876 + math.random(-2, 2), 0)
        return KalgWalk
    end
    local KalgWalk = KalgWalk()
    --
    if findNPC(29345, 50) then
        if not UTILS.isDeflectMelee() then
            API.RandomSleep2(200, 400, 600)
            API.DoAction_Ability("Deflect Melee", 1, API.OFF_ACT_GeneralInterface_route)
        end
        eatfood()
        loot()
        PrayerCheck()
        if API.PInAreaW(KalgerionCheck, 10) then
            if not hasValidTarget() then
                API.DoAction_NPC(0x2a, API.OFF_ACT_AttackNPC_route, {29345}, 50, false, 100)
                API.RandomSleep2(800, 600, 1200)
            end
        else
            print("Not inside the area check, going back")
            API.DoAction_WalkerW(KalgWalk)
            API.RandomSleep2(800, 600, 1000)
        end
    end
end

local function KalgerionTask()
    --
    local KalgerionCheck = WPOINT.new(3278, 3876, 0)
    --
    if API.PInAreaW(KalgerionCheck, 50) then
        repeat
            UTILS:antiIdle()
            KalgerionSlayer()
        until (KillsLeft0() == 0) or not API.Read_LoopyLoop()
    elseif not findNPC(19918, 15) then
        GuildTP()
    else
        Bank()
        if API.BankOpen2() then
            NecroBloodPreset()
        end
        API.DoAction_Ability("Annakarl Teleport", 1, API.OFF_ACT_GeneralInterface_route)
        API.RandomSleep2(1200, 1000, 1500)
        API.WaitUntilMovingandAnimEnds()
    end
end

local function IceWyrmSlayer()
    if findNPC(9462, 50) then -- mound  --9463 bez mounda
        loot()
        eatfood()
        if not hasValidTarget() and not findNPC(9463, 50) then
            API.DoAction_NPC(0x2a, API.OFF_ACT_AttackNPC_route, {9462}, 50, false, 100)
            API.RandomSleep2(800, 400, 600)
        end
    end
end

local function IceWyrmTask()
    --
    randomizeLavaWormWalker1()
    local function randomizeIceWyrmLocation()
        local IceWyrmLocation = WPOINT.new(3061 + math.random(-5, 5), 3816 + math.random(-5, 5), 0)
        return IceWyrmLocation
    end
    local IceWyrmLocation = randomizeIceWyrmLocation()
    local IceWyrmCheck = WPOINT.new(3061, 3816, 0)

    --
    if API.PInAreaW(IceWyrmCheck, 25) then
        repeat
            UTILS:antiIdle()
            IceWyrmSlayer()
        until (KillsLeft0() == 0) or not API.Read_LoopyLoop()
    elseif not findNPC(19918, 15) then
        GuildTP()
    else
        Bank()
        if API.BankOpen2() then
            NecroBloodPreset()
        end
        MandrithTP()
        API.DoAction_WalkerW(LavaWormWalker1)
        API.RandomSleep2(200, 400, 600)
        API.WaitUntilMovingEnds()
        if not findObj(65387, 50) then
            API.DoAction_Object1(0x31, 0, {65386}, 50) -- open gates
            API.RandomSleep2(1200, 1000, 1500)
            API.WaitUntilMovingandAnimEnds()
        end
        API.DoAction_WalkerW(IceWyrmLocation)
        API.RandomSleep2(200, 400, 600)
        API.WaitUntilMovingEnds()
    end
end

local function HydrixSlayer()
    if findNPC(29348, 50) then
        if not UTILS.isDeflectMagic() then
            API.RandomSleep2(200, 500, 300)
            API.DoAction_Ability("Deflect Magic", 1, API.OFF_ACT_GeneralInterface_route)
        end
        loot()
        eatfood()
        if not hasValidTarget() then
            API.DoAction_NPC(0x2a, API.OFF_ACT_AttackNPC_route, {29348}, 50, false, 100)
            API.RandomSleep2(800, 400, 600)
        end
    end
end

local function HydrixDragonsTask()
    --
    randomizeLavaWormWalker1()
    local function randomizeHydrixDragonLocation()
        local HydrixDragonLocation = WPOINT.new(3020 + math.random(-2, 2), 3897 + math.random(-2, 2), 0)
        return HydrixDragonLocation
    end
    local HydrixDragonCheck = WPOINT.new(3020, 3897, 0)
    local HydrixRandomized = randomizeHydrixDragonLocation()
    --
    if API.PInAreaW(HydrixDragonCheck, 25) then
        repeat
            UTILS:antiIdle()
            HydrixSlayer()
        until (KillsLeft0() == 0) or not API.Read_LoopyLoop()
    elseif not findNPC(19918, 15) then
        GuildTP()
    else
        Bank()
        if API.BankOpen2() then
            NecromancyBonePrayerPreset()
        end
        MandrithTP()
        API.DoAction_WalkerW(LavaWormWalker1)
        API.RandomSleep2(200, 400, 600)
        API.WaitUntilMovingEnds()
        if not findObj(65387, 50) then
            API.DoAction_Object1(0x31, 0, {65386}, 50) -- open gates
            API.RandomSleep2(1200, 1000, 1500)
            API.WaitUntilMovingandAnimEnds()
        end
        API.DoAction_WalkerW(HydrixRandomized)
        API.RandomSleep2(1200, 600, 1000)
        API.WaitUntilMovingEnds()
    end
end

local function GreaterDemonBerserkersSlayer() -- removed need for soulsplit, added a safe spot (its a bit buggy, fix it)
    --
    local function randomizeBerserkerLocation()
        local GreaterDemonBerserkerLocation = WPOINT.new(3343 + math.random(0, 3), 3881 + math.random(-1, 2), 0)
        return GreaterDemonBerserkerLocation
    end
    local GreaterDemonBerserkerLocation = randomizeBerserkerLocation()
    local GreaterDemonBerserkerCheck = WPOINT.new(3346, 3881, 0)
    --
    if findNPC(29363, 50) then
        randomizeBerserkerLocation()
        eatfood()
        loot()
        if API.PInAreaW(GreaterDemonBerserkerCheck, 4) then
            if not hasValidTarget() then
                if findNPC(29363, 50) then
                    API.DoAction_NPC(0x2a, API.OFF_ACT_AttackNPC_route, {29363}, 50, false, 100)
                    API.RandomSleep2(1200, 800, 1600)
                    API.WaitUntilMovingEnds()
                elseif findNPC(29360, 50) then
                    API.DoAction_NPC(0x2a, API.OFF_ACT_AttackNPC_route, {29360}, 50, false, 100)
                    API.RandomSleep2(1200, 800, 1600)
                    API.WaitUntilMovingEnds()
                end
            end
        else
            API.DoAction_WalkerW(GreaterDemonBerserkerLocation)
            API.RandomSleep2(800, 600, 1200)
            API.WaitUntilMovingandAnimEnds()
        end
    end
end

local function GreaterDemonBerserkersTask()
    --
    local function randomizeBerserkerLocation()
        local GreaterDemonBerserkerLocation = WPOINT.new(3343 + math.random(0, 3), 3881 + math.random(-1, 2), 0)
        return GreaterDemonBerserkerLocation
    end
    local GreaterDemonBerserkerLocation = randomizeBerserkerLocation()
    local GreaterDemonBerserkerCheck = WPOINT.new(3346, 3881, 0)
    --
    if API.PInAreaW(GreaterDemonBerserkerCheck, 25) then
        repeat
            UTILS:antiIdle()
            GreaterDemonBerserkersSlayer()
        until (KillsLeft0() == 0) or not API.Read_LoopyLoop()
    elseif not findNPC(19918, 15) then
        GuildTP()
    else
        Bank()
        if API.BankOpen2() then
            NecroBloodPreset()
        end
        API.DoAction_Ability("Annakarl Teleport", 1, API.OFF_ACT_GeneralInterface_route)
        API.RandomSleep2(2500, 2000, 2500)
        API.WaitUntilMovingandAnimEnds()
        API.DoAction_WalkerW(GreaterDemonBerserkerLocation)
        API.RandomSleep2(1200, 1000, 800)
        API.WaitUntilMovingEnds()
    end
end

local function WildyAbyssLordTP()
    API.RandomSleep2(800, 600, 800)
    API.DoAction_Interface(0xffffffff, 0x9410, 2, 1670, 84, -1, API.OFF_ACT_GeneralInterface_route) -- wildy swrd tp
    API.RandomSleep2(1200, 600, 1500)
    API.KeyboardPress2(0x31, 60, 100) -- key number 1 
    API.RandomSleep2(1200, 600, 1500)
    API.KeyboardPress2(0x32, 60, 100) -- key number 2 
    API.RandomSleep2(1200, 600, 1500)
    API.WaitUntilMovingandAnimEnds()
    API.RandomSleep2(2600, 1200, 2000)
end

local function AbyssBeastsSlayer()
    if findNPC(29351, 50) then
        loot()
        eatfood()
        if not hasValidTarget() then

            API.DoAction_NPC(0x2a, API.OFF_ACT_AttackNPC_route, {29351}, 25, false, 100)
            API.RandomSleep2(800, 400, 600)
        end
    end
end

local function AbyssBeastsTask()
    --
    local AbyssBeastCheck = WPOINT.new(3117, 3813, 0)
    --
    if API.PInAreaW(AbyssBeastCheck, 50) then
        repeat
            UTILS:antiIdle()
            AbyssBeastsSlayer()
        until (KillsLeft0() == 0) or not API.Read_LoopyLoop()
    elseif not findNPC(19918, 15) then
        GuildTP()
    else
        Bank()
        if API.BankOpen2() then
            NecroBloodPreset()
        end
        WildyAbyssLordTP()
    end
end

local function GlacorsSlayer()
    if findNPC(29355, 15) then
        eatfood()
        loot()
        if not hasValidTarget() then
            API.DoAction_NPC(0x2a, API.OFF_ACT_AttackNPC_route, {29355}, 50, false, 100)
            API.RandomSleep2(800, 400, 600)
        elseif findNPC(14302, 15) then
            API.DoAction_NPC(0x2a, API.OFF_ACT_AttackNPC_route, {14302}, 50, false, 100)
            API.RandomSleep2(800, 400, 600)
        elseif findNPC(14304, 15) then -- enduring
            API.DoAction_NPC(0x2a, API.OFF_ACT_AttackNPC_route, {14304}, 50, false, 100)
            API.RandomSleep2(800, 400, 600)
        elseif findNPC(14303, 15) then
            API.DoAction_NPC(0x2a, API.OFF_ACT_AttackNPC_route, {29355}, 50, false, 100)
            API.RandomSleep2(800, 400, 600)
        end
    end
end

local function GlacorsTask()
    --
    randomizeLavaWormWalker1()
    local function randomizeGlacorsLocation()
        local GlacorsLocation = WPOINT.new(2974 + math.random(-5, 5), 3905 + math.random(-5, 5), 0)
        return GlacorsLocation
    end
    local GlacorsLocation = randomizeGlacorsLocation()
    local GlacorsCheck = WPOINT.new(2974, 3905, 0)
    --
    if API.PInAreaW(GlacorsCheck, 35) then
        repeat
            UTILS:antiIdle()
            GlacorsSlayer()
        until (KillsLeft0() == 0) or not API.Read_LoopyLoop()
    elseif not findNPC(19918, 15) then
        GuildTP()
    else
        Bank()
        if API.BankOpen2() then
            NecroBloodPreset()
        end
        MandrithTP()
        API.DoAction_WalkerW(LavaWormWalker1)
        API.RandomSleep2(200, 400, 600)
        API.WaitUntilMovingEnds()
        if not findObj(65387, 50) then
            API.DoAction_Object1(0x31, 0, {65386}, 50) -- open gates
            API.RandomSleep2(1200, 1000, 1500)
            API.WaitUntilMovingandAnimEnds()
        end
        API.DoAction_WalkerW(GlacorsLocation)
        API.RandomSleep2(800, 400, 600)
        API.WaitUntilMovingEnds()
    end
end

local function BlackDemonsSlayer()
    if findNPC(29349, 50) then
        loot()
        eatfood()
        if not hasValidTarget() then
            API.DoAction_NPC(0x2a, API.OFF_ACT_AttackNPC_route, {29349}, 50, false, 100)
            API.RandomSleep2(800, 400, 600)
        end

    end
end

local function BlackDemonsTask()
    --
    local function randomizeBlackDemonsLocation()
        local BlackDemonsLocation = WPOINT.new(3300 + math.random(-5, 5), 3798 + math.random(-5, 5), 0)
        return BlackDemonsLocation
    end
    local BlackDemonsLocation = randomizeBlackDemonsLocation()
    local BlackDemonsCheck = WPOINT.new(3300, 3798, 0)
    --
    if API.PInAreaW(BlackDemonsCheck, 50) then
        repeat
            UTILS:antiIdle()
            BlackDemonsSlayer()
        until (KillsLeft0() == 0) or not API.Read_LoopyLoop()
    elseif not findNPC(19918, 15) then
        GuildTP()
    else
        Bank()
        if API.BankOpen2() then
            NecroBloodPreset()
        end
        LODESTONES.Wilderness()
        API.WaitUntilMovingandAnimEnds()
        API.RandomSleep2(800, 400, 600)
        API.DoAction_WalkerW(BlackDemonsLocation)
        API.RandomSleep2(800, 400, 600)
        API.WaitUntilMovingEnds()
    end
end

local function AbyssSavageSlayer()
    if findNPC(29352, 50) then
        loot()
        eatfood()
        if not hasValidTarget() then
            API.DoAction_NPC(0x2a, API.OFF_ACT_AttackNPC_route, {29352}, 50, false, 100)
            API.RandomSleep2(800, 400, 600)
        end
    end
end

local function AbyssSavageTask()
    --
    local function randomizeAbyssSavageLocation()
        local AbyssSavageLocation = WPOINT.new(3050 + math.random(-5, 5), 3723 + math.random(-5, 5), 0)
        return AbyssSavageLocation
    end
    local AbyssSavageLocation = randomizeAbyssSavageLocation()
    local AbyssSavageCheck = WPOINT.new(3050, 3723, 0)
    --
    if API.PInAreaW(AbyssSavageCheck, 50) then
        repeat
            UTILS:antiIdle()
            AbyssSavageSlayer()
        until (KillsLeft0() == 0) or not API.Read_LoopyLoop()
    elseif not findNPC(19918, 15) then
        GuildTP()
    else
        Bank()
        if API.BankOpen2() then
            NecroBloodPreset()
        end
        LODESTONES.Wilderness()
        API.WaitUntilMovingandAnimEnds()
        API.RandomSleep2(800, 400, 600)
        API.DoAction_WalkerW(AbyssSavageLocation)
        API.RandomSleep2(700, 500, 300)
        API.WaitUntilMovingEnds()
    end
end

local function AbLordSpot()
    API.RandomSleep2(100, 100, 100)
    if not API.PInArea(3173, 1, 3884, 1, 0) then
        API.DoAction_WalkerW(WPOINT.new(3173, 3884, 0))
        API.RandomSleep2(600, 400, 800)
        API.WaitUntilMovingEnds()
    end
end

local function AbyssLordSlayer()
    if findNPC(29353, 50) then
        loot()
        eatfood()
        PrayerCheck()
        AbLordSpot()
        if not hasValidTarget() then
            if UTILS.isDeflectMagic() then
                API.RandomSleep2(200, 500, 300)
                API.DoAction_Ability("Deflect Magic", 1, API.OFF_ACT_GeneralInterface_route)
            end
            if findNPC(28784, 10) then -- 28784 TENTACLES
                API.DoAction_NPC(0x2a, API.OFF_ACT_AttackNPC_route, {28784}, 10, false, 100)
                API.RandomSleep2(800, 400, 600)
            else
                API.DoAction_NPC(0x2a, API.OFF_ACT_AttackNPC_route, {29353}, 10, false, 100)
                API.RandomSleep2(800, 400, 600)
            end
        else
            if not UTILS.isDeflectMagic() then
                API.RandomSleep2(200, 500, 300)
                API.DoAction_Ability("Deflect Magic", 1, API.OFF_ACT_GeneralInterface_route)
            end
        end
    end
end

local function AbyssLordTask()
    --
    local function randomizeAbyssLordLocation()
        local AbyssLordLocation = WPOINT.new(3173 + math.random(-2, 2), 3884 + math.random(-2, 2), 0)
        return AbyssLordLocation
    end
    local AbyssLordLocation = randomizeAbyssLordLocation()
    local AbyssLordCheck = WPOINT.new(3173, 3884, 0)
    --
    if API.PInAreaW(AbyssLordCheck, 50) then
        repeat
            UTILS:antiIdle()
            AbyssLordSlayer()
        until (KillsLeft0() == 0) or not API.Read_LoopyLoop()
    elseif not findNPC(19918, 15) then
        GuildTP()
    else
        Bank()
        if API.BankOpen2() then
            NecroBloodPreset()
        end
        WildyAbyssLordTP()
        API.DoAction_WalkerW(AbyssLordLocation)
        API.RandomSleep2(700, 500, 800)
        API.WaitUntilMovingEnds()
    end
end

local interface2 = API.ScanForInterfaceTest2Get(false, {{1639, 3, -1, -1, 0}, {1639, 5, -1, 3, 0}, {1639, 8, -1, 5, 0},
                                                        {1639, 11, -1, 8, 0}})
local slayerTask = interface2[1].textids

local TaskLocalization = {
    ["Greater demon berserkers and ash lords (Wilderness)"] = GreaterDemonBerserkersTask,
    ["Greater demon berserkers (Wilderness)"] = GreaterDemonBerserkersTask,
    ["Lava strykewyrms (Wilderness)"] = LavaWormTask,
    ["Ice strykewyrms (Wilderness)"] = IceWyrmTask,
    ["Hydrix dragons (Wilderness)"] = HydrixDragonsTask,
    ["Acheron mammoths (Wilderness)"] = MammothsTask,
    ["Onyx dragons (Wilderness)"] = OnyxDragonsTask,
    ["Abyssal Demons (Wilderness)"] = AbyssDemonTask,
    ["Abyssal savages (Wilderness)"] = AbyssSavageTask,
    ["Abyssal beasts (Wilderness)"] = AbyssBeastsTask,
    ["Soulgazers (Wilderness)"] = SoulGazersTask,
    ["Kal'gerion demons (Wilderness)"] = KalgerionTask,
    ["Black demons (Wilderness)"] = BlackDemonsTask,
    ["Revenants (Wilderness)"] = RevenantsTask,
    ["Dark beasts (Wilderness)"] = DarkBeastTask,
    ["Living wyverns (Wilderness)"] = WyvernTask,
    ["Abyssal lords (Wilderness)"] = AbyssLordTask,
    ["Gargoyles (Wilderness)"] = GargoylesTask,
    ["Glacors (Wilderness)"] = GlacorsTask
}

local function TaskPicker() -- it picks by order
    API.RandomSleep2(800, 600, 1000)
    if API.Select_Option("Abyssal lords") then
        slayerTask = "Abyssal lords (Wilderness)"
    elseif API.Select_Option("greater demon berserkers and ash lords") then -- these two are here because there was a bug while ago, could possibly remove one
        slayerTask = "Greater demon berserkers and ash lords (Wilderness)"
    elseif API.Select_Option("greater demon berserkers") then -- these two are here because there was a bug while ago, could possibly remove one
        slayerTask = "Greater demon berserkers (Wilderness)"
    elseif API.Select_Option("hydrix dragons") then
        slayerTask = "Hydrix dragons (Wilderness)"
    elseif API.Select_Option("acheron mammoths") then
        slayerTask = "Acheron mammoths (Wilderness)"
    elseif API.Select_Option("soulgazers") then
        slayerTask = "Soulgazers (Wilderness)"
    elseif API.Select_Option("lava strykewyrms") then
        slayerTask = "Lava strykewyrms (Wilderness)"
    elseif API.Select_Option("onyx dragons") then
        slayerTask = "Onyx dragons (Wilderness)"
    elseif API.Select_Option("Abyssal beasts") then
        slayerTask = "Abyssal beasts (Wilderness)"
    elseif API.Select_Option("Kal'gerion demons") then
        slayerTask = "Kal'gerion demons (Wilderness)"
    elseif API.Select_Option("ice strikewyrms") then
        slayerTask = "Ice strykewyrms (Wilderness)"
    elseif API.Select_Option("Abyssal savages") then
        slayerTask = "Abyssal savages (Wilderness)"
    elseif API.Select_Option("Abyssal demons") then
        slayerTask = "Abyssal Demons (Wilderness)"
    elseif API.Select_Option("black demons") then
        slayerTask = "Black demons (Wilderness)"
    elseif API.Select_Option("revenant ghosts") then
        slayerTask = "Revenants (Wilderness)"
    elseif API.Select_Option("living wyverns") then
        slayerTask = "Living wyverns (Wilderness)"
    elseif API.Select_Option("dark beasts") then
        slayerTask = "Dark beasts (Wilderness)"
    elseif API.Select_Option("gargoyles") then
        slayerTask = "Gargoyles (Wilderness)"
    elseif API.Select_Option("glacors") then
        slayerTask = "Glacors (Wilderness)"
    end
    API.RandomSleep2(400, 600, 800)
end

local function TaskDoer()
    API.RandomSleep2(200, 200, 200)
    if slayerTask then
        API.RandomSleep2(800, 400, 600)
        if findNPC(27299, 50) then
            deathCheck()
        end
        print("Your current task is: " .. slayerTask)
        local taskFunction = TaskLocalization[slayerTask]
        taskFunction()
    end
end

function PrayerCheck()
    if (API.GetPray_() < 100) and (API.InvItemcount_String("Super prayer renewal potion") >= 1) then
        print("Not much prayer left, drinking a prayer renewal")
        API.RandomSleep2(400, 300, 500)
        API.DoAction_Ability("Super prayer renewal potion", 1, API.OFF_ACT_GeneralInterface_route)
        API.RandomSleep2(400, 200, 300)
    elseif (API.GetPray_() == 0) and (API.InvItemcount_String("Super prayer renewal potion") == 0) then
        print("No more prayer renewals, teleporting out")
        GuildTP()
        print("Renewing prayer at the altar")
        API.RandomSleep2(400, 400, 600)
        API.DoAction_Object1(0x29, 0, {92278}, 50)
        API.RandomSleep2(1200, 800, 600)
        API.WaitUntilMovingandAnimEnds()
        print("Continuing with the task after renewing prayer!")
        TaskDoer()
    end
end

function eatfood()
    local hp = API.GetHPrecent()
    local eatFoodAB = API.GetABs_name1("Eat Food")

    if hp < 65 then
        if eatFoodAB.id ~= 0 and eatFoodAB.enabled then
            API.DoAction_Ability_Direct(eatFoodAB, 1, API.OFF_ACT_GeneralInterface_route)
            API.RandomSleep2(800, 600, 1000)
        end
    end
    if hp < 35 then
        print("Teleporting out")
        GuildTP()
        print("Your hp was " .. hp .. "%, teleported you back to Max guild")
        PrayerOff()
        TaskDoer()
    end
end

local function Mandrith() -- Here we prioritize teleporting to the guild first because we can't really teleport out with the cape during a fight.
    if not findNPC(6537, 15) then -- mandrith id
        if not findNPC(19918, 15) then -- banker npc (indicator that we are not at max guild)
            GuildTP()
            PrayerOff()
        else
            MandrithTP()
        end
    else
        MandrithTalk()
        TaskPicker()
    end
end

API.SetDrawTrackedSkills(true)
while API.Read_LoopyLoop() do
    UTILS:antiIdle()
    eatfood()

    if (KillsLeft0() == 0) then
        Mandrith()
    else
        TaskDoer()
    end
end

--[[
 BUGS
1. spams "Your current task is: ", find out why

2. --fix worm special attack animation (no need but just in case)          --FULLFIX search it

3. Onyx dragons doesn't pick items up

4. did something with DeadCheck() could be broken (it is broken, find a way to fix it[died because of travel error on kalgerion task (fixed already))

5. combo() too slow

6. GreaterDemonBerserkersSlayer() safespot is a bit buggy, find a better way of doing it 

7. Acheron Mammoths special attack melts, do something about it 

--]]
