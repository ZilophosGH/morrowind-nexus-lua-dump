local config = require("companionLeveler.config")
local tables = require("companionLeveler.tables")
local func = require("companionLeveler.functions.common")
local logger = require("logging.logger")
local log = logger.getLogger("Companion Leveler")


local this = {}

--
----Creature Abilities------------------------------------------------------------------------------------------------------------
--
function this.creatureAbilities(cType, companionRef)
    log = logger.getLogger("Companion Leveler")
    local name = companionRef.object.name
    local modData = func.getModData(companionRef)

    if cType == "Normal" then
        if modData.typelevels[1] >= 5 then
            local ability = tables.abList[1]
            local wasAdded = tes3.addSpell({ reference = companionRef, spell = ability })
            if wasAdded == true then
                tes3.messageBox("" .. name .. " learned the Normal Type Ability Instinct!")
                log:info("" .. name .. " learned the Ability " .. tables.abList[1] .. ".")
                tes3.playSound({ sound = "alitSCRM" })
                modData.abilities[1] = true
            else
                log:debug("" .. name .. " already has the " .. ability .. " Ability.")
            end
        end
        if modData.typelevels[1] >= 10 then
            local ability = tables.abList[2]
            local wasAdded = tes3.addSpell({ reference = companionRef, spell = ability })
            if wasAdded == true then
                tes3.messageBox("" .. name .. " learned the Normal Type Ability Beast Blood!")
                log:info("" .. name .. " learned the Ability " .. tables.abList[2] .. ".")
                tes3.playSound({ sound = "alitSCRM" })
                modData.abilities[2] = true
            else
                log:debug("" .. name .. " already has the " .. ability .. " Ability.")
            end
        end
        if modData.typelevels[1] >= 15 then
            local ability = tables.abList[3]
            local wasAdded = tes3.addSpell({ reference = companionRef, spell = ability })
            if wasAdded == true then
                tes3.messageBox("" .. name .. " learned the Normal Type Ability Greater Instinct!")
                log:info("" .. name .. " learned the Ability " .. tables.abList[3] .. ".")
                tes3.playSound({ sound = "alitSCRM" })
                modData.abilities[3] = true
                modData.att_gained[8] = modData.att_gained[8] + 10
            else
                log:debug("" .. name .. " already has the " .. ability .. " Ability.")
            end
        end
        if modData.typelevels[1] >= 20 then
            local ability = tables.abList[4]
            local wasAdded = tes3.addSpell({ reference = companionRef, spell = ability })
            if wasAdded == true then
                tes3.messageBox("" .. name .. " learned the Normal Type Ability Evolutionary Stamina!")
                log:info("" .. name .. " learned the Ability " .. tables.abList[4] .. ".")
                tes3.playSound({ sound = "alitSCRM" })
                modData.abilities[4] = true
                modData.att_gained[6] = modData.att_gained[6] + 20
                modData.att_gained[5] = modData.att_gained[5] + 10
            else
                log:debug("" .. name .. " already has the " .. ability .. " Ability.")
            end
        end
    end
    if cType == "Daedra" then
        if modData.typelevels[2] >= 5 then
            local ability = tables.abList[5]
            local wasAdded = tes3.addSpell({ reference = companionRef, spell = ability })
            if wasAdded == true then
                tes3.messageBox("" .. name .. " learned the Daedra Type Ability Taste of Freedom!")
                log:info("" .. name .. " learned the Ability " .. tables.abList[5] .. ".")
                tes3.playSound({ sound = "dremora scream" })
                modData.abilities[5] = true
            else
                log:debug("" .. name .. " already has the " .. ability .. " Ability.")
            end
        end
        if modData.typelevels[2] >= 10 then
            local ability = tables.abList[6]
            local wasAdded = tes3.addSpell({ reference = companionRef, spell = ability })
            if wasAdded == true then
                tes3.messageBox("" .. name .. " learned the Daedra Type Ability Daedric Skin!")
                log:info("" .. name .. " learned the Ability " .. tables.abList[6] .. ".")
                tes3.playSound({ sound = "dremora scream" })
                modData.abilities[6] = true
            else
                log:debug("" .. name .. " already has the " .. ability .. " Ability.")
            end
        end
        if modData.typelevels[2] >= 15 then
            local ability = tables.abList[7]
            local wasAdded = tes3.addSpell({ reference = companionRef, spell = ability })
            if wasAdded == true then
                tes3.messageBox("" .. name .. " learned the Daedra Type Ability Sinful Freedom!")
                log:info("" .. name .. " learned the Ability " .. tables.abList[7] .. ".")
                tes3.playSound({ sound = "dremora scream" })
                modData.abilities[7] = true
            else
                log:debug("" .. name .. " already has the " .. ability .. " Ability.")
            end
        end
        if modData.typelevels[2] >= 20 then
            local ability = tables.abList[8]
            local wasAdded = tes3.addSpell({ reference = companionRef, spell = ability })
            if wasAdded == true then
                tes3.messageBox("" .. name .. " learned the Daedra Type Ability Dark Barrier!")
                log:info("" .. name .. " learned the Ability " .. tables.abList[8] .. ".")
                tes3.playSound({ sound = "dremora scream" })
                modData.abilities[8] = true
            else
                log:debug("" .. name .. " already has the " .. ability .. " Ability.")
            end
        end
    end
    if cType == "Undead" then
        if modData.typelevels[3] >= 5 then
            local ability = tables.abList[9]
            local wasAdded = tes3.addSpell({ reference = companionRef, spell = ability })
            if wasAdded == true then
                tes3.messageBox("" .. name .. " learned the Undead Type Ability Numbed Flesh!")
                log:info("" .. name .. " learned the Ability " .. tables.abList[9] .. ".")
                tes3.playSound({ sound = "skeleton moan" })
                modData.abilities[9] = true
                modData.hth_gained = modData.hth_gained + 10
            else
                log:debug("" .. name .. " already has the " .. ability .. " Ability.")
            end
        end
        if modData.typelevels[3] >= 10 then
            local ability = tables.abList[10]
            local wasAdded = tes3.addSpell({ reference = companionRef, spell = ability })
            if wasAdded == true then
                tes3.messageBox("" .. name .. " learned the Undead Type Ability Ancestral Memory!")
                log:info("" .. name .. " learned the Ability " .. tables.abList[10] .. ".")
                tes3.playSound({ sound = "skeleton moan" })
                modData.abilities[10] = true
                modData.att_gained[1] = modData.att_gained[1] + 5
                modData.att_gained[2] = modData.att_gained[2] + 10
                modData.att_gained[3] = modData.att_gained[3] + 10
                modData.att_gained[7] = modData.att_gained[7] + 10
            else
                log:debug("" .. name .. " already has the " .. ability .. " Ability.")
            end
        end
        if modData.typelevels[3] >= 15 then
            local ability = tables.abList[11]
            local wasAdded = tes3.addSpell({ reference = companionRef, spell = ability })
            if wasAdded == true then
                tes3.messageBox("" .. name .. " learned the Undead Type Ability Still Breath!")
                log:info("" .. name .. " learned the Ability " .. tables.abList[11] .. ".")
                tes3.playSound({ sound = "skeleton moan" })
                modData.abilities[11] = true
                modData.att_gained[6] = modData.att_gained[6] + 15
                modData.fat_gained = modData.fat_gained + 25
            else
                log:debug("" .. name .. " already has the " .. ability .. " Ability.")
            end
        end
        if modData.typelevels[3] >= 20 then
            local ability = tables.abList[12]
            local wasAdded = tes3.addSpell({ reference = companionRef, spell = ability })
            if wasAdded == true then
                tes3.messageBox("" .. name .. " learned the Undead Type Ability Total Decay!")
                log:info("" .. name .. " learned the Ability " .. tables.abList[12] .. ".")
                tes3.playSound({ sound = "skeleton moan" })
                modData.abilities[12] = true
            else
                log:debug("" .. name .. " already has the " .. ability .. " Ability.")
            end
        end
    end
    if cType == "Humanoid" then
        if modData.typelevels[4] >= 5 then
            local ability = tables.abList[13]
            local wasAdded = tes3.addSpell({ reference = companionRef, spell = ability })
            if wasAdded == true then
                tes3.messageBox("" .. name .. " learned the Humanoid Type Ability Strange Dream!")
                log:info("" .. name .. " learned the Ability " .. tables.abList[13] .. ".")
                tes3.playSound({ sound = "ash vampire moan" })
                modData.abilities[13] = true
                modData.mgk_gained = modData.mgk_gained + 20
            else
                log:debug("" .. name .. " already has the " .. ability .. " Ability.")
            end
        end
        if modData.typelevels[4] >= 10 then
            local ability = tables.abList[14]
            local wasAdded = tes3.addSpell({ reference = companionRef, spell = ability })
            if wasAdded == true then
                tes3.messageBox("" .. name .. " learned the Humanoid Type Ability Abnormal Growth!")
                log:info("" .. name .. " learned the Ability " .. tables.abList[14] .. ".")
                tes3.playSound({ sound = "ash vampire moan" })
                modData.abilities[14] = true
                modData.att_gained[1] = modData.att_gained[1] + 5
            else
                log:debug("" .. name .. " already has the " .. ability .. " Ability.")
            end
        end
        if modData.typelevels[4] >= 15 then
            local ability = tables.abList[15]
            local wasAdded = tes3.addSpell({ reference = companionRef, spell = ability })
            if wasAdded == true then
                tes3.messageBox("" .. name .. " learned the Humanoid Type Ability Painfully Awake!")
                log:info("" .. name .. " learned the Ability " .. tables.abList[15] .. ".")
                tes3.playSound({ sound = "ash vampire moan" })
                modData.abilities[15] = true
                modData.mgk_gained = (companionRef.mobile.magicka.base - companionRef.baseObject.magicka)
            else
                log:debug("" .. name .. " already has the " .. ability .. " Ability.")
            end
        end
        if modData.typelevels[4] >= 20 then
            local ability = tables.abList[16]
            local wasAdded = tes3.addSpell({ reference = companionRef, spell = ability })
            if wasAdded == true then
                tes3.messageBox("" .. name .. " learned the Humanoid Type Ability Dream Mastery!")
                log:info("" .. name .. " learned the Ability " .. tables.abList[16] .. ".")
                tes3.playSound({ sound = "ash vampire moan" })
                modData.abilities[16] = true
            else
                log:debug("" .. name .. " already has the " .. ability .. " Ability.")
            end
        end
    end
    if cType == "Centurion" then
        if modData.typelevels[5] >= 5 then
            local ability = tables.abList[17]
            local wasAdded = tes3.addSpell({ reference = companionRef, spell = ability })
            if wasAdded == true then
                tes3.messageBox("" .. name .. " learned the Centurion Type Ability Precision!")
                log:info("" .. name .. " learned the Ability " .. tables.abList[17] .. ".")
                tes3.playSound({ sound = "cent sphere scream" })
                modData.abilities[17] = true
            else
                log:debug("" .. name .. " already has the " .. ability .. " Ability.")
            end
        end
        if modData.typelevels[5] >= 10 then
            local ability = tables.abList[18]
            local wasAdded = tes3.addSpell({ reference = companionRef, spell = ability })
            if wasAdded == true then
                tes3.messageBox("" .. name .. " learned the Centurion Type Ability Insulated Exoskeleton!")
                log:info("" .. name .. " learned the Ability " .. tables.abList[18] .. ".")
                tes3.playSound({ sound = "cent sphere scream" })
                modData.abilities[18] = true
                modData.hth_gained = modData.hth_gained + 25
            else
                log:debug("" .. name .. " already has the " .. ability .. " Ability.")
            end
        end
        if modData.typelevels[5] >= 15 then
            local ability = tables.abList[19]
            local wasAdded = tes3.addSpell({ reference = companionRef, spell = ability })
            if wasAdded == true then
                tes3.messageBox("" .. name .. " learned the Centurion Type Ability Augmented Grip!")
                log:info("" .. name .. " learned the Ability " .. tables.abList[19] .. ".")
                tes3.playSound({ sound = "cent sphere scream" })
                modData.abilities[19] = true
                modData.att_gained[1] = modData.att_gained[1] + 20
            else
                log:debug("" .. name .. " already has the " .. ability .. " Ability.")
            end
        end
        if modData.typelevels[5] >= 20 then
            local ability = tables.abList[20]
            local wasAdded = tes3.addSpell({ reference = companionRef, spell = ability })
            if wasAdded == true then
                tes3.messageBox("" .. name .. " learned the Centurion Type Ability Dwemer Refractors!")
                log:info("" .. name .. " learned the Ability " .. tables.abList[20] .. ".")
                tes3.playSound({ sound = "cent sphere scream" })
                modData.abilities[20] = true
                modData.att_gained[6] = modData.att_gained[6] + 25
            else
                log:debug("" .. name .. " already has the " .. ability .. " Ability.")
            end
        end
    end
    if cType == "Spriggan" then
        if modData.typelevels[6] >= 5 then
            local ability = tables.abList[21]
            local wasAdded = tes3.addSpell({ reference = companionRef, spell = ability })
            if wasAdded == true then
                tes3.messageBox("" .. name .. " learned the Spriggan Type Ability Sap Secretion!")
                log:info("" .. name .. " learned the Ability " .. tables.abList[21] .. ".")
                tes3.playSound({ sound = "sprigganmagic" })
                modData.abilities[21] = true
            else
                log:debug("" .. name .. " already has the " .. ability .. " Ability.")
            end
        end
        if modData.typelevels[6] >= 10 then
            local ability = tables.abList[22]
            local wasAdded = tes3.addSpell({ reference = companionRef, spell = ability })
            if wasAdded == true then
                tes3.messageBox("" .. name .. " learned the Spriggan Type Ability Jade Wind!")
                log:info("" .. name .. " learned the Ability " .. tables.abList[22] .. ".")
                tes3.playSound({ sound = "sprigganmagic" })
                modData.abilities[22] = true
                modData.att_gained[8] = modData.att_gained[8] + 15
            else
                log:debug("" .. name .. " already has the " .. ability .. " Ability.")
            end
        end
        if modData.typelevels[6] >= 15 then
            local ability = tables.abList[23]
            local wasAdded = tes3.addSpell({ reference = companionRef, spell = ability })
            if wasAdded == true then
                tes3.messageBox("" .. name .. " learned the Spriggan Type Ability Synthesis!")
                log:info("" .. name .. " learned the Ability " .. tables.abList[23] .. ".")
                tes3.playSound({ sound = "sprigganmagic" })
                modData.abilities[23] = true
                modData.att_gained[6] = modData.att_gained[6] + 5
            else
                log:debug("" .. name .. " already has the " .. ability .. " Ability.")
            end
        end
        if modData.typelevels[6] >= 20 then
            local ability = tables.abList[24]
            local wasAdded = tes3.addSpell({ reference = companionRef, spell = ability })
            if wasAdded == true then
                tes3.messageBox("" .. name .. " learned the Spriggan Type Ability Overgrowth!")
                log:info("" .. name .. " learned the Ability " .. tables.abList[24] .. ".")
                tes3.playSound({ sound = "sprigganmagic" })
                modData.abilities[24] = true
            else
                log:debug("" .. name .. " already has the " .. ability .. " Ability.")
            end
        end
    end
    if cType == "Goblin" then
        if modData.typelevels[7] >= 3 then
            local ability = tables.abList[25]
            local wasAdded = tes3.addSpell({ reference = companionRef, spell = ability })
            if wasAdded == true then
                tes3.messageBox("" .. name .. " learned the Goblin Type Ability Quickness!")
                log:info("" .. name .. " learned the Ability " .. tables.abList[25] .. ".")
                tes3.playSound({ sound = "goblin scream" })
                modData.abilities[25] = true
                modData.att_gained[5] = modData.att_gained[5] + 10
            else
                log:debug("" .. name .. " already has the " .. ability .. " Ability!")
            end
        end
        if modData.typelevels[7] >= 5 then
            local ability = tables.abList[26]
            local wasAdded = tes3.addSpell({ reference = companionRef, spell = ability })
            if wasAdded == true then
                tes3.messageBox("" .. name .. " learned the Goblin Type Ability Springstep!")
                log:info("" .. name .. " learned the Ability " .. tables.abList[26] .. ".")
                tes3.playSound({ sound = "goblin scream" })
                modData.abilities[26] = true
                modData.fat_gained = modData.fat_gained + 10
            else
                log:debug("" .. name .. " already has the " .. ability .. " Ability!")
            end
        end
        if modData.typelevels[7] >= 7 then
            local ability = tables.abList[27]
            local wasAdded = tes3.addSpell({ reference = companionRef, spell = ability })
            if wasAdded == true then
                tes3.messageBox("" .. name .. " learned the Goblin Type Ability Enduring Quickness!")
                log:info("" .. name .. " learned the Ability " .. tables.abList[27] .. ".")
                tes3.playSound({ sound = "goblin scream" })
                modData.abilities[27] = true
            else
                log:debug("" .. name .. " already has the " .. ability .. " Ability!")
            end
        end
        if modData.typelevels[7] >= 10 then
            local ability = tables.abList[28]
            local wasAdded = tes3.addSpell({ reference = companionRef, spell = ability })
            if wasAdded == true then
                tes3.messageBox("" .. name .. " learned the Goblin Type Ability Feral Parrying!")
                log:info("" .. name .. " learned the Ability " .. tables.abList[28] .. ".")
                tes3.playSound({ sound = "goblin scream" })
                modData.abilities[28] = true
            else
                log:debug("" .. name .. " already has the " .. ability .. " Ability!")
            end
        end
        if modData.typelevels[7] >= 13 then
            local ability = tables.abList[29]
            local wasAdded = tes3.addSpell({ reference = companionRef, spell = ability })
            if wasAdded == true then
                tes3.messageBox("" .. name .. " learned the Goblin Type Ability Chameleon Skin!")
                log:info("" .. name .. " learned the Ability " .. tables.abList[29] .. ".")
                tes3.playSound({ sound = "goblin scream" })
                modData.abilities[29] = true
            else
                log:debug("" .. name .. " already has the " .. ability .. " Ability!")
            end
        end
        if modData.typelevels[7] >= 15 then
            local ability = tables.abList[30]
            local wasAdded = tes3.addSpell({ reference = companionRef, spell = ability })
            if wasAdded == true then
                tes3.messageBox("" .. name .. " learned the Goblin Type Ability Boon of Muluk!")
                log:info("" .. name .. " learned the Ability " .. tables.abList[30] .. ".")
                tes3.playSound({ sound = "goblin scream" })
                modData.abilities[30] = true
                modData.att_gained[1] = modData.att_gained[1] + 5
                modData.att_gained[6] = modData.att_gained[6] + 10
                modData.att_gained[8] = modData.att_gained[8] + 10
            else
                log:debug("" .. name .. " already has the " .. ability .. " Ability!")
            end
        end
        if modData.typelevels[7] >= 17 then
            local ability = tables.abList[31]
            local wasAdded = tes3.addSpell({ reference = companionRef, spell = ability })
            if wasAdded == true then
                tes3.messageBox("" .. name .. " learned the Goblin Type Ability Freedom of Movement!")
                log:info("" .. name .. " learned the Ability " .. tables.abList[31] .. ".")
                tes3.playSound({ sound = "goblin scream" })
                modData.abilities[31] = true
            else
                log:debug("" .. name .. " already has the " .. ability .. " Ability!")
            end
        end
        if modData.typelevels[7] >= 20 then
            local ability = tables.abList[32]
            local wasAdded = tes3.addSpell({ reference = companionRef, spell = ability })
            if wasAdded == true then
                tes3.messageBox("" .. name .. " learned the Goblin Type Ability Perfect Dodge!")
                log:info("" .. name .. " learned the Ability " .. tables.abList[32] .. ".")
                tes3.playSound({ sound = "goblin scream" })
                modData.abilities[32] = true
                modData.att_gained[4] = modData.att_gained[4] + 10
            else
                log:debug("" .. name .. " already has the " .. ability .. " Ability!")
            end
        end
    end
    if cType == "Domestic" then
        if math.random(1, 180) < (companionRef.mobile.personality.base + modData.domlevel) then
            local pLuck = tes3.player.mobile.luck
            local pAmount = 1
            if config.aboveMaxAtt == false then
                if pLuck.base + pAmount > 100 then
                    pAmount = math.max(100 - pLuck.base, 0)
                end
            end
            tes3.modStatistic({ attribute = 7, value = pAmount, reference = tes3.player })
            log:info("" ..
                name .. " Domestic Type bonus increased " .. tes3.player.object.name .. "'s Luck by " .. pAmount .. ".")
            tes3.messageBox("" .. name .. "'s presence made you feel lucky to have them around!")
            tes3.playSound({ sound = "guar moan" })
        end
    end
    if cType == "Spectral" then
        if modData.typelevels[9] >= 5 then
            local ability = tables.abList[33]
            local wasAdded = tes3.addSpell({ reference = companionRef, spell = ability })
            if wasAdded == true then
                tes3.messageBox("" .. name .. " learned the Spectral Type Ability Unafraid!")
                log:info("" .. name .. " learned the Ability " .. tables.abList[33] .. ".")
                tes3.playSound({ sound = "ancestor ghost scream" })
                modData.abilities[33] = true
            else
                log:debug("" .. name .. " already has the " .. ability .. " Ability.")
            end
        end
        if modData.typelevels[9] >= 10 then
            local ability = tables.abList[34]
            local wasAdded = tes3.addSpell({ reference = companionRef, spell = ability })
            if wasAdded == true then
                tes3.messageBox("" .. name .. " learned the Spectral Type Ability Spectral Will!")
                log:info("" .. name .. " learned the Ability " .. tables.abList[34] .. ".")
                tes3.playSound({ sound = "ancestor ghost scream" })
                modData.abilities[34] = true
                modData.att_gained[3] = modData.att_gained[3] + 5
            else
                log:debug("" .. name .. " already has the " .. ability .. " Ability.")
            end
        end
        if modData.typelevels[9] >= 15 then
            local ability = tables.abList[35]
            local wasAdded = tes3.addSpell({ reference = companionRef, spell = ability })
            if wasAdded == true then
                tes3.messageBox("" .. name .. " learned the Spectral Type Ability Aetherial Link!")
                log:info("" .. name .. " learned the Ability " .. tables.abList[35] .. ".")
                tes3.playSound({ sound = "ancestor ghost scream" })
                modData.abilities[35] = true
                modData.mgk_gained = (companionRef.mobile.magicka.base - companionRef.baseObject.magicka)
            else
                log:debug("" .. name .. " already has the " .. ability .. " Ability.")
            end
        end
        if modData.typelevels[9] >= 20 then
            local ability = tables.abList[36]
            local wasAdded = tes3.addSpell({ reference = companionRef, spell = ability })
            if wasAdded == true then
                tes3.messageBox("" .. name .. " learned the Spectral Type Ability Incorporeal!")
                log:info("" .. name .. " learned the Ability " .. tables.abList[36] .. ".")
                tes3.playSound({ sound = "ancestor ghost scream" })
                modData.abilities[36] = true
                modData.att_gained[4] = modData.att_gained[4] + 5
            else
                log:debug("" .. name .. " already has the " .. ability .. " Ability.")
            end
        end
    end
    if cType == "Insectile" then
        if modData.typelevels[10] >= 5 then
            local ability = tables.abList[37]
            local wasAdded = tes3.addSpell({ reference = companionRef, spell = ability })
            if wasAdded == true then
                tes3.messageBox("" .. name .. " learned the Insectile Type Ability Entomic!")
                log:info("" .. name .. " learned the Ability " .. tables.abList[37] .. ".")
                tes3.playSound({ sound = "kwamQ scream" })
                modData.abilities[37] = true
            else
                log:debug("" .. name .. " already has the " .. ability .. " Ability.")
            end
        end
        if modData.typelevels[10] >= 10 then
            local ability = tables.abList[38]
            local wasAdded = tes3.addSpell({ reference = companionRef, spell = ability })
            if wasAdded == true then
                tes3.messageBox("" .. name .. " learned the Insectile Type Ability Jointed Legs!")
                log:info("" .. name .. " learned the Ability " .. tables.abList[38] .. ".")
                tes3.playSound({ sound = "kwamQ scream" })
                modData.abilities[38] = true
                modData.att_gained[5] = modData.att_gained[5] + 10
                modData.att_gained[4] = modData.att_gained[4] + 5
            else
                log:debug("" .. name .. " already has the " .. ability .. " Ability.")
            end
        end
        if modData.typelevels[10] >= 15 then
            local ability = tables.abList[39]
            local wasAdded = tes3.addSpell({ reference = companionRef, spell = ability })
            if wasAdded == true then
                tes3.messageBox("" .. name .. " learned the Insectile Type Ability Venomous Mandibles!")
                log:info("" .. name .. " learned the Ability " .. tables.abList[39] .. ".")
                tes3.playSound({ sound = "kwamQ scream" })
                modData.abilities[39] = true
                modData.att_gained[1] = modData.att_gained[1] + 5
            else
                log:debug("" .. name .. " already has the " .. ability .. " Ability.")
            end
        end
        if modData.typelevels[10] >= 20 then
            local ability = tables.abList[40]
            local wasAdded = tes3.addSpell({ reference = companionRef, spell = ability })
            if wasAdded == true then
                tes3.messageBox("" .. name .. " learned the Insectile Type Ability Pheromone!")
                log:info("" .. name .. " learned the Ability " .. tables.abList[40] .. ".")
                tes3.playSound({ sound = "kwamQ scream" })
                modData.abilities[40] = true
            else
                log:debug("" .. name .. " already has the " .. ability .. " Ability.")
            end
        end
    end
    if cType == "Draconic" then
        if modData.typelevels[11] >= 5 then
            local ability = tables.abList[41]
            local wasAdded = tes3.addSpell({ reference = companionRef, spell = ability })
            if wasAdded == true then
                tes3.messageBox("" .. name .. " learned the Draconic Type Ability Dragon Scales!")
                log:info("" .. name .. " learned the Ability " .. tables.abList[41] .. ".")
                tes3.playSound({ soundPath = "companionLeveler\\dragon_ability.wav", volume = 0.8 })
                modData.abilities[41] = true
            else
                log:debug("" .. name .. " already has the " .. ability .. " Ability.")
            end
        end
        if modData.typelevels[11] >= 10 then
            local ability = tables.abList[42]
            local wasAdded = tes3.addSpell({ reference = companionRef, spell = ability })
            if wasAdded == true then
                tes3.messageBox("" .. name .. " learned the Draconic Type Ability Ancient Memory!")
                log:info("" .. name .. " learned the Ability " .. tables.abList[42] .. ".")
                tes3.playSound({ soundPath = "companionLeveler\\dragon_ability.wav", volume = 0.8 })
                modData.abilities[42] = true
                modData.att_gained[2] = modData.att_gained[2] + 10
                modData.att_gained[7] = modData.att_gained[7] + 10
            else
                log:debug("" .. name .. " already has the " .. ability .. " Ability.")
            end
        end
        if modData.typelevels[11] >= 15 then
            local ability = tables.abList[43]
            local wasAdded = tes3.addSpell({ reference = companionRef, spell = ability })
            if wasAdded == true then
                tes3.messageBox("" .. name .. " learned the Draconic Type Ability Burning Grip!")
                log:info("" .. name .. " learned the Ability " .. tables.abList[43] .. ".")
                tes3.playSound({ soundPath = "companionLeveler\\dragon_ability.wav", volume = 0.8 })
                modData.abilities[43] = true
                modData.att_gained[1] = modData.att_gained[1] + 10
            else
                log:debug("" .. name .. " already has the " .. ability .. " Ability.")
            end
        end
        if modData.typelevels[11] >= 20 then
            local ability = tables.abList[44]
            local wasAdded = tes3.addSpell({ reference = companionRef, spell = ability })
            if wasAdded == true then
                tes3.messageBox("" .. name .. " learned the Draconic Type Ability Dragonflight!")
                log:info("" .. name .. " learned the Ability " .. tables.abList[44] .. ".")
                tes3.playSound({ soundPath = "companionLeveler\\dragon_ability.wav", volume = 0.8 })
                modData.abilities[44] = true
                modData.att_gained[5] = modData.att_gained[5] + 10
            else
                log:debug("" .. name .. " already has the " .. ability .. " Ability.")
            end
        end
    end
    if cType == "Brute" then
        if modData.typelevels[12] >= 5 then
            local ability = tables.abList[45]
            local wasAdded = tes3.addSpell({ reference = companionRef, spell = ability })
            if wasAdded == true then
                tes3.messageBox("" .. name .. " learned the Brute Type Ability Durable!")
                log:info("" .. name .. " learned the Ability " .. tables.abList[45] .. ".")
                tes3.playSound({ sound = "ogrim moan" })
                modData.abilities[45] = true
                modData.hth_gained = modData.hth_gained + 15
                modData.fat_gained = modData.fat_gained + 15
            else
                log:debug("" .. name .. " already has the " .. ability .. " Ability.")
            end
        end
        if modData.typelevels[12] >= 10 then
            local ability = tables.abList[46]
            local wasAdded = tes3.addSpell({ reference = companionRef, spell = ability })
            if wasAdded == true then
                tes3.messageBox("" .. name .. " learned the Brute Type Ability Short Temper!")
                log:info("" .. name .. " learned the Ability " .. tables.abList[46] .. ".")
                tes3.playSound({ sound = "ogrim moan" })
                modData.abilities[46] = true
                modData.att_gained[1] = modData.att_gained[1] + 5
                modData.att_gained[6] = modData.att_gained[6] + 5
            else
                log:debug("" .. name .. " already has the " .. ability .. " Ability.")
            end
        end
        if modData.typelevels[12] >= 15 then
            local ability = tables.abList[47]
            local wasAdded = tes3.addSpell({ reference = companionRef, spell = ability })
            if wasAdded == true then
                tes3.messageBox("" .. name .. " learned the Brute Type Ability Stubborn Muscle!")
                log:info("" .. name .. " learned the Ability " .. tables.abList[47] .. ".")
                tes3.playSound({ sound = "ogrim moan" })
                modData.abilities[47] = true
            else
                log:debug("" .. name .. " already has the " .. ability .. " Ability.")
            end
        end
        if modData.typelevels[12] >= 20 then
            local ability = tables.abList[48]
            local wasAdded = tes3.addSpell({ reference = companionRef, spell = ability })
            if wasAdded == true then
                tes3.messageBox("" .. name .. " learned the Brute Type Ability Wanton Destruction!")
                log:info("" .. name .. " learned the Ability " .. tables.abList[48] .. ".")
                tes3.playSound({ sound = "ogrim moan" })
                modData.abilities[48] = true
                modData.att_gained[1] = modData.att_gained[1] + 25
                modData.hth_gained = modData.hth_gained + 30
            else
                log:debug("" .. name .. " already has the " .. ability .. " Ability.")
            end
        end
    end
end

--Spectral Will #34---------------------------------------------------------------------------------------------------------------
function this.spectralWill(e)
    log = logger.getLogger("Companion Leveler")
    log:trace("Spectral Will triggered.")

    if (func.checkModData(e.reference) and e.reference.object.objectType == tes3.objectType.creature) then
        local modData = func.getModData(e.reference)

        if modData.abilities[34] == true then
            local removedCount = tes3.removeItem({ reference = tes3.player, item = "Misc_SoulGem_Grand", count = 1 })

            if removedCount > 0 then
                e.mobile:resurrect({ resetState = false })
                tes3.setAIFollow({ reference = e.reference, target = tes3.player })

                tes3.messageBox("" .. e.reference.object.name .. " regained their form through your Grand Soul Gem!")
                log:info("" .. e.reference.object.name .. " regained their form through your Grand Soul Gem!")

                for i = 0, 7 do
                    tes3.modStatistic({ attribute = i, value = -2, reference = e.reference, limit = true })
                    modData.att_gained[i + 1] = modData.att_gained[i + 1] - 2
                end

                log:info("" .. e.reference.object.name .. "'s attributes were reduced by 2 through resurrection.")
            else
                tes3.messageBox("" .. e.reference.object.name .. " could not regain their form.")
                log:info("" .. e.reference.object.name .. " could not regain their form. (No Grand Soul Gem)")
            end
        end
    end
end

--Pheromone #40-------------------------------------------------------------------------------------------------------------------
function this.pheromone(ref)
    log = logger.getLogger("Companion Leveler")

	if (string.startswith(ref.object.name, "Kwama") or string.endswith(ref.object.name, "Kwama") or string.startswith(ref.object.name, "Shalk") or string.endswith(ref.object.name, "Shalk")) then
		local creTable = func.creTable()
		local trigger = 0

		for i = 1, #creTable do
			local reference = creTable[i]
			local modData = func.getModData(reference)
			if modData.abilities[40] == true then
				trigger = 1
				log:debug("" .. ref.object.name .. " was warded off by " .. reference.object.name .. ".")
                break
			end
		end

		--Ward off
		if trigger == 1 then
			ref.mobile.fight = 0
		end
	end
end


--
----NPC Abilities-----------------------------------------------------------------------------------------------------------------
--

--Learn Abilities-----------------------------------------------------------------------------------------------------------------
function this.npcAbilities(class, companionRef)
    log = logger.getLogger("Companion Leveler")
    local modData = func.getModData(companionRef)

    --Add Abilities--------------------------------------------------------------------------------------------------
    if modData.level % 5 == 0 then
        for i = 1, #tables.classesSpecial do
            if class == tables.classesSpecial[i] then
                local ability = tables.abListNPC[i]
                local spellObject = tes3.getObject(ability)

                local wasAdded = tes3.addSpell({ reference = companionRef, spell = ability })

                if wasAdded == true then
                    tes3.messageBox("" ..
                        companionRef.object.name .. " learned the " .. class .. " Ability " .. spellObject.name .. "!")
                    log:info("" .. companionRef.object.name .. " learned the Ability " .. ability .. ".")

                    tes3.playSound({ soundPath = "companionLeveler\\ability.wav", volume = 0.8 })
                    modData.abilities[i] = true

                    --Potential (Commoner Class)
                    if spellObject.name == "Potential" then
                        local npcMode = require("companionLeveler.modes.npcClassMode")
                        local table = {
                            [1] = companionRef
                        }

                        timer.delayOneFrame(function()
                            timer.delayOneFrame(function()
                                timer.delayOneFrame(function()
                                    npcMode.companionLevelNPC(table)
                                    tes3.messageBox("" .. companionRef.object.name .. " unlocked their potential!")
                                end)
                            end)
                        end)
                    end

                    --Mod Data Stats
                    timer.delayOneFrame(function()
                        timer.delayOneFrame(function()
                            timer.delayOneFrame(function()
                                func.updateIdealSheet(companionRef)
                            end)
                        end)
                    end)
                else
                    log:debug("" .. companionRef.object.name .. " already has the " .. ability .. " Ability.")
                    tes3.messageBox("" ..
                        companionRef.object.name .. " already has the " .. spellObject.name .. " Ability.")
                end
            end
        end
    end
end

--Execute Learned Abilities-------------------------------------------------------------------------------------------------------
function this.executeAbilities(companionRef)
    local attTable = companionRef.mobile.attributes
    local modData = func.getModData(companionRef)
    local class = tes3.findClass(modData.class)

    local alchemy = companionRef.mobile:getSkillStatistic(16)
    local speechcraft = companionRef.mobile:getSkillStatistic(25)
    local enchant = companionRef.mobile:getSkillStatistic(9)
    local mercantile = companionRef.mobile:getSkillStatistic(24)
    local armorer = companionRef.mobile:getSkillStatistic(1)
    local conjuration = companionRef.mobile:getSkillStatistic(13)
    local restoration = companionRef.mobile:getSkillStatistic(15)
    local sneak = companionRef.mobile:getSkillStatistic(19)
    local marksman = companionRef.mobile:getSkillStatistic(23)
    local mysticism = companionRef.mobile:getSkillStatistic(14)
    local security = companionRef.mobile:getSkillStatistic(18)
    local acrobatics = companionRef.mobile:getSkillStatistic(20)

    --Acrobat
    if (modData.abilities[1] == true or class.name == "Acrobat") then
        local value = 1

        if modData.aboveMaxSkill == false then
            local skillStat = tes3.player.mobile:getSkillStatistic(20)
            if skillStat.base + value > 100 then
                value = math.max(100 - skillStat.base, 0)
            end
        end

        --Teach Acrobatics
        if math.random(1, 130) < (acrobatics.current + modData.level) then
            tes3.modStatistic({ skill = 20, value = value, reference = tes3.player })
            tes3.messageBox("" .. companionRef.object.name .. " showed you some new acrobatic maneuvers.")
        end
    end

    --Agent
    if (modData.abilities[2] == true or class.name == "Agent") then
        local value = 1

        if modData.aboveMaxSkill == false then
            local skillStat = tes3.player.mobile:getSkillStatistic(18)
            if skillStat.base + value > 100 then
                value = math.max(100 - skillStat.base, 0)
            end
        end

        --Teach Security
        if math.random(1, 130) < (security.current + modData.level) then
            tes3.modStatistic({ skill = 18, value = value, reference = tes3.player })
            tes3.messageBox("" .. companionRef.object.name .. " taught you a bit about security.")
        end
    end

    --Assassin accepts a contract once per level. (See this.contract) #4 Opportunist

    --Bard
    if (modData.abilities[6] == true or class.name == "Bard") then
        local party = func.partyTable()

        --Sing a song to the party
        for i = 1, #party do
            local reference = party[i]

            tes3.applyMagicSource({
                reference = reference,
                name = "Bardic Inspiration",
                bypassResistances = true,
                effects = {
                    { id = tes3.effect.fortifyAttribute, attribute = math.random(0, 7),
                        duration = (math.random(120, 180) + (speechcraft.current * 3)),
                        min = (modData.level / 2),
                        max = modData.level },
                },
            })
        end
        tes3.messageBox("" .. companionRef.object.name .. " sang an inspiring song!")
    end

    --Healer
    if (modData.abilities[9] == true or class.name == "Healer") then
        tes3.applyMagicSource({
            reference = tes3.player,
            name = "Triage",
            effects = {
                { id = tes3.effect.restoreHealth,
                    duration = (math.random(60, 120) + (restoration.current * 3)),
                    min = 1,
                    max = 1 },
            },
        })
        tes3.messageBox("" .. companionRef.object.name .. " performed preventative triage on you!")
    end

    --Scouts have a 3% chance at awarding 1 EXP when changing cells. (See this.survey) #16 Observation

    --Thief
    if (modData.abilities[19] == true or class.name == "Thief") then
        if math.random(1, 140) < (((sneak.current + security.current) / 2) + modData.level) then
            local randNum = math.random(1, 10)

            --Steal something
            tes3.addItem({ item = tables.stolenGoods[randNum], reference = companionRef })

            local spoils = tes3.getObject(tables.stolenGoods[randNum])
            tes3.messageBox("" ..
                companionRef.object.name .. " \"procured\" an item. (" .. spoils.name .. ").")
        end
    end

    --Alchemist and Apothecary
    if (
        modData.abilities[22] == true or modData.abilities[23] == true or class.name == "Alchemist" or
            class.name == "Apothecary") then
        if math.random(1, 130) < (alchemy.current + modData.level) then
            --Brew a potion
            if (alchemy.current > 0 and alchemy.current < 25) then
                local selection = math.random(1, #tables.alchemyPotionsB)
                tes3.addItem({ item = tables.alchemyPotionsB[selection], reference = tes3.player })

                local potion = tes3.getObject(tables.alchemyPotionsB[selection])
                tes3.messageBox("" ..
                    companionRef.object.name .. " brewed you a weak potion. (" .. potion.name .. ")")
            end
            if (alchemy.current >= 25 and alchemy.current < 50) then
                local selection = math.random(1, #tables.alchemyPotionsC)
                tes3.addItem({ item = tables.alchemyPotionsC[selection], reference = tes3.player })

                local potion = tes3.getObject(tables.alchemyPotionsC[selection])
                tes3.messageBox("" ..
                    companionRef.object.name .. " brewed you a cheap potion. (" .. potion.name .. ")")
            end
            if (alchemy.current >= 50 and alchemy.current < 75) then
                local selection = math.random(1, #tables.alchemyPotionsS)
                tes3.addItem({ item = tables.alchemyPotionsS[selection], reference = tes3.player })

                local potion = tes3.getObject(tables.alchemyPotionsS[selection])
                tes3.messageBox("" ..
                    companionRef.object.name .. " brewed you a decent potion. (" .. potion.name .. ")")
            end
            if (alchemy.current >= 75 and alchemy.current < 100) then
                local selection = math.random(1, #tables.alchemyPotionsQ)
                tes3.addItem({ item = tables.alchemyPotionsQ[selection], reference = tes3.player })

                local potion = tes3.getObject(tables.alchemyPotionsQ[selection])
                tes3.messageBox("" ..
                    companionRef.object.name .. " brewed you a quality potion! (" .. potion.name .. ")")
            end
            if alchemy.current >= 100 then
                local selection = math.random(1, #tables.alchemyPotionsE)
                tes3.addItem({ item = tables.alchemyPotionsE[selection], reference = tes3.player })

                local potion = tes3.getObject(tables.alchemyPotionsE[selection])
                tes3.messageBox("" ..
                    companionRef.object.name .. " brewed you an exquisite potion! (" .. potion.name .. ")")
            end
        end
    end

    --Drillmaster
    if (modData.abilities[25] == true or class.name == "Drillmaster") then
        local drillmaster = tes3.findClass("Drillmaster")
        local randNum = math.random(1, 5)
        local randNum2 = math.random(1, 5)

        --Exercise 1 Major Skill and 1 Minor Skill from Drillmaster Class
        tes3.player.mobile:exerciseSkill(drillmaster.majorSkills[randNum], (0.5 * modData.level))
        tes3.player.mobile:exerciseSkill(drillmaster.minorSkills[randNum2], (0.5 * modData.level))

        tes3.messageBox("" ..
            companionRef.object.name ..
            " instructed you in " ..
            tes3.getSkillName(drillmaster.majorSkills[randNum]) ..
            " and " .. tes3.getSkillName(drillmaster.minorSkills[randNum2]) .. ".")
    end

    --Enchanter
    if (modData.abilities[26] == true or class.name == "Enchanter") then
        if math.random(1, 130) < (enchant.current + modData.level) then
            --Fashion a soul gem
            if (enchant.current > 0 and enchant.current < 25) then
                tes3.addItem({ item = "Misc_SoulGem_Petty", reference = tes3.player })

                tes3.messageBox("" ..
                    companionRef.object.name .. " fashioned you a petty soul gem.")
            end
            if (enchant.current >= 25 and enchant.current < 50) then
                tes3.addItem({ item = "Misc_SoulGem_Lesser", reference = tes3.player })

                tes3.messageBox("" ..
                    companionRef.object.name .. " fashioned you a lesser soul gem.")
            end
            if (enchant.current >= 50 and enchant.current < 75) then
                tes3.addItem({ item = "Misc_SoulGem_Common", reference = tes3.player })

                tes3.messageBox("" ..
                    companionRef.object.name .. " fashioned you a common soul gem.")
            end
            if (enchant.current >= 75 and enchant.current < 100) then
                tes3.addItem({ item = "Misc_SoulGem_Greater", reference = tes3.player })

                tes3.messageBox("" ..
                    companionRef.object.name .. " fashioned you a greater soul gem!")
            end
            if enchant.current >= 100 then
                tes3.addItem({ item = "Misc_SoulGem_Grand", reference = tes3.player })

                tes3.messageBox("" ..
                    companionRef.object.name .. " fashioned you a grand soul gem!")
            end
        end
    end

    --Hunter and Poacher
    if (modData.abilities[28] == true or class.name == "Hunter" or modData.abilities[75] == true or class.name == "Poacher") then
        if math.random(1, 130) < (marksman.current + modData.level) then
            local randNum = math.random(1, 16)

            --Give random meat/hide
            tes3.addItem({ item = tables.huntedMeat[randNum], reference = tes3.player })

            local spoils = tes3.getObject(tables.huntedMeat[randNum])
            tes3.messageBox("" ..
                companionRef.object.name .. " shared some extra " .. spoils.name .. " with you.")
        end
    end

    --Merchant
    if (modData.abilities[29] == true or class.name == "Merchant") then
        local value = 1

        if modData.aboveMaxSkill == false then
            local skillStat = tes3.player.mobile:getSkillStatistic(24)
            if skillStat.base + value > 100 then
                value = math.max(100 - skillStat.base, 0)
            end
        end

        --Teach Mercantile
        if math.random(1, 120) < (mercantile.current + modData.level) then
            tes3.modStatistic({ skill = 24, value = value, reference = tes3.player })
            tes3.messageBox("" .. companionRef.object.name .. " taught you a bit about economics.")
        end
    end

    --Necromancer
    if (modData.abilities[30] == true or class.name == "Necromancer") then
        --Summon a free minion
        if (conjuration.current > 0 and conjuration.current < 25) then
            tes3.applyMagicSource({
                reference = companionRef,
                name = "Summoned Spirit",
                effects = {
                    { id = tes3.effect.summonAncestralGhost,
                        duration = (math.random(120, 180) + (conjuration.current * 3))
                    },
                }
            })
            tes3.messageBox("" .. companionRef.object.name .. " summoned a spectral minion.")
        end
        if (conjuration.current >= 25 and conjuration.current < 50) then
            tes3.applyMagicSource({
                reference = companionRef,
                name = "Summoned Skeleton",
                effects = {
                    { id = tes3.effect.summonSkeletalMinion,
                        duration = (math.random(120, 180) + (conjuration.current * 3))
                    },
                }
            })
            tes3.messageBox("" .. companionRef.object.name .. " summoned a skeletal minion.")
        end
        if (conjuration.current >= 50 and conjuration.current < 75) then
            tes3.applyMagicSource({
                reference = companionRef,
                name = "Summoned Bonewalker",
                effects = {
                    { id = tes3.effect.summonBonewalker,
                        duration = (math.random(120, 180) + (conjuration.current * 4))
                    },
                }
            })
            tes3.messageBox("" .. companionRef.object.name .. " summoned an undead minion.")
        end
        if (conjuration.current >= 75 and conjuration.current < 100) then
            tes3.applyMagicSource({
                reference = companionRef,
                name = "Summoned Greater Bonewalker",
                effects = {
                    { id = tes3.effect.summonGreaterBonewalker,
                        duration = (math.random(120, 180) + (conjuration.current * 4))
                    },
                }
            })
            tes3.messageBox("" .. companionRef.object.name .. " summoned a stronger undead minion.")
        end
        if conjuration.current >= 100 then
            tes3.applyMagicSource({
                reference = companionRef,
                name = "Summoned Bonelord",
                effects = {
                    { id = tes3.effect.summonBonelord,
                        duration = (math.random(120, 180) + (conjuration.current * 5))
                    },
                }
            })
            tes3.messageBox("" .. companionRef.object.name .. " summoned a powerful undead minion!")
        end
    end

    --Priest
    if (modData.abilities[31] == true or class.name == "Priest") then
        local party = func.partyTable()

        --Bless the party
        for i = 1, #party do
            local reference = party[i]

            if (restoration.current > 0 and restoration.current < 25) then
                tes3.applyMagicSource({
                    reference = reference,
                    name = "Novice Blessing",
                    effects = {
                        { id = tes3.effect.fortifyAttribute, attribute = math.random(0, 7),
                            duration = (math.random(120, 180) + (restoration.current * 3)),
                            min = (modData.level / 2),
                            max = (modData.level / 2) },
                    },
                })
            end
            if (restoration.current >= 25 and restoration.current < 50) then
                tes3.applyMagicSource({
                    reference = reference,
                    name = "Blessing of the Apprentice",
                    effects = {
                        { id = tes3.effect.fortifyAttribute, attribute = math.random(0, 7),
                            duration = (math.random(120, 180) + (restoration.current * 3)),
                            min = (modData.level / 2),
                            max = (modData.level / 2) }, { id = tes3.effect.resistCommonDisease,
                            duration = (math.random(120, 180) + (restoration.current * 3)),
                            min = (modData.level / 2),
                            max = modData.level },
                    },
                })
            end
            if (restoration.current >= 50 and restoration.current < 75) then
                tes3.applyMagicSource({
                    reference = reference,
                    name = "Blessing of the Adept",
                    effects = {
                        { id = tes3.effect.fortifyAttribute, attribute = math.random(0, 7),
                            duration = (math.random(120, 180) + (restoration.current * 3)),
                            min = (modData.level / 2),
                            max = (modData.level / 2) }, { id = tes3.effect.resistCommonDisease,
                            duration = (math.random(120, 180) + (restoration.current * 3)),
                            min = (modData.level / 2),
                            max = modData.level }, { id = tes3.effect.resistBlightDisease,
                            duration = (math.random(120, 180) + (restoration.current * 3)),
                            min = (modData.level / 2),
                            max = modData.level },
                    },
                })
            end
            if (restoration.current >= 75 and restoration.current < 100) then
                tes3.applyMagicSource({
                    reference = reference,
                    name = "Expert Blessing",
                    effects = {
                        { id = tes3.effect.fortifyAttribute, attribute = math.random(0, 7),
                            duration = (math.random(120, 180) + (restoration.current * 4)),
                            min = (modData.level / 2),
                            max = (modData.level / 2) }, { id = tes3.effect.resistCommonDisease,
                            duration = (math.random(120, 180) + (restoration.current * 4)),
                            min = (modData.level / 2),
                            max = modData.level }, { id = tes3.effect.resistBlightDisease,
                            duration = (math.random(120, 180) + (restoration.current * 4)),
                            min = (modData.level / 2),
                            max = modData.level }, { id = tes3.effect.fortifyAttack,
                            duration = (math.random(120, 180) + (restoration.current * 4)),
                            min = (modData.level / 2),
                            max = modData.level },
                    },
                })
            end
            if restoration.current >= 100 then
                tes3.applyMagicSource({
                    reference = reference,
                    name = "Blessing of the Divine",
                    effects = {
                        { id = tes3.effect.fortifyAttribute, attribute = math.random(0, 7),
                            duration = (math.random(120, 180) + (restoration.current * 5)),
                            min = (modData.level / 2),
                            max = (modData.level / 2) }, { id = tes3.effect.resistCommonDisease,
                            duration = (math.random(120, 180) + (restoration.current * 5)),
                            min = (modData.level / 2),
                            max = modData.level }, { id = tes3.effect.resistBlightDisease,
                            duration = (math.random(120, 180) + (restoration.current * 5)),
                            min = (modData.level / 2),
                            max = modData.level }, { id = tes3.effect.fortifyAttack,
                            duration = (math.random(120, 180) + (restoration.current * 5)),
                            min = (modData.level / 2),
                            max = modData.level }, { id = tes3.effect.fortifyHealth,
                            duration = (math.random(120, 180) + (restoration.current * 5)),
                            min = (modData.level / 2),
                            max = modData.level },
                    },
                })
            end
        end
        tes3.messageBox("" .. companionRef.object.name .. " conferred a blessing the party.")
    end

    --Savant
    if (modData.abilities[32] == true or class.name == "Savant") then
        local value = 1
        local randSkill = math.random(0, 26)

        if modData.aboveMaxSkill == false then
            local skillStat = tes3.player.mobile:getSkillStatistic(randSkill)
            if skillStat.base + value > 100 then
                value = math.max(100 - skillStat.base, 0)
            end
        end

        --Level random skill
        if math.random(1, 130) < (speechcraft.current + modData.level) then
            tes3.modStatistic({ skill = randSkill, value = value, reference = tes3.player })
            tes3.messageBox("" .. companionRef.object.name .. " lectured you on " .. tes3.getSkillName(randSkill) .. ".")
        end
    end

    --Smith
    if (modData.abilities[35] == true or class.name == "Smith") then
        local party = func.partyTable()

        for i = 1, #party do
            local reference = party[i]

            --Reinforce Armor
            for id, slot in pairs(tes3.armorSlot) do
                local armor = tes3.getEquippedItem {
                    actor = reference,
                    objectType = tes3.objectType.armor,
                    slot = slot
                }
                if armor then
                    armor.variables.condition = armor.variables.condition + armorer.current
                end
            end

            --Reinforce Weapon
            local weapon = tes3.getEquippedItem {
                actor = reference,
                objectType = tes3.objectType.weapon,
            }
            if weapon and weapon.variables then
                weapon.variables.condition = weapon.variables.condition + armorer.current
            end
        end

        tes3.messageBox("" ..
            companionRef.object.name .. " reinforced the party's equipment by " .. armorer.current .. ".")
    end

    --Smuggler
    if (modData.abilities[36] == true or class.name == "Smuggler") then
        local amount = math.round(((modData.level + security.current) * 2.5))

        --Generate Gold
        tes3.addItem({ reference = tes3.player, item = "Gold_001", count = amount })
        tes3.messageBox("" .. companionRef.object.name .. " shared a cut of their profits with you. (" .. amount .. " Gold)")
    end

    --Archeologist
    if (modData.abilities[41] == true or class.name == "Archeologist") then
        local randNum = math.random(1, 27)

        --Find random artifacts
        tes3.addItem({ item = tables.unearthedObjects[randNum], reference = companionRef })

        local spoils = tes3.getObject(tables.unearthedObjects[randNum])
        tes3.messageBox("" ..
            companionRef.object.name .. " dug something up. (" .. spoils.name .. ")")
    end

    --Artificer
    if (modData.abilities[42] == true or class.name == "Artificer") then
        --Summon a mechanical minion
        if (armorer.current > 0 and armorer.current < 75) then
            tes3.applyMagicSource({
                reference = companionRef,
                name = "Constructed Golem",
                effects = {
                    { id = tes3.effect.summonCenturionSphere,
                        duration = (math.random(180, 240) + (enchant.current * 3))
                    },
                }
            })
        end
        if armorer.current > 75 then
            tes3.applyMagicSource({
                reference = companionRef,
                name = "Constructed Greater Golem",
                effects = {
                    { id = tes3.effect.summonFabricant,
                        duration = (math.random(180, 240) + (enchant.current * 5))
                    },
                }
            })
        end
        tes3.messageBox("" .. companionRef.object.name .. " constructed a mechanical minion.")
    end

    --Artisan
    if (modData.abilities[43] == true or class.name == "Artisan") then
        if math.random(1, 130) < (armorer.current + modData.level) then
            --Fashion a tool
            if (armorer.current > 0 and armorer.current < 25) then
                local selection = math.random(1, #tables.artisanTools)
                tes3.addItem({ item = tables.artisanTools[selection], reference = companionRef })

                local tool = tes3.getObject(tables.artisanTools[selection])
                tes3.messageBox("" ..
                    companionRef.object.name .. " fashioned you a basic tool. (" .. tool.name .. ")")
            end
            if (armorer.current >= 25 and armorer.current < 50) then
                local selection = math.random(1, #tables.artisanTools2)
                tes3.addItem({ item = tables.artisanTools2[selection], reference = companionRef })

                local tool = tes3.getObject(tables.artisanTools2[selection])
                tes3.messageBox("" ..
                    companionRef.object.name .. " fashioned you a decent tool. (" .. tool.name .. ")")
            end
            if (armorer.current >= 50 and armorer.current < 75) then
                local selection = math.random(1, #tables.artisanTools3)
                tes3.addItem({ item = tables.artisanTools3[selection], reference = companionRef })

                local tool = tes3.getObject(tables.artisanTools3[selection])
                tes3.messageBox("" ..
                    companionRef.object.name .. " fashioned you a useful tool. (" .. tool.name .. ")")
            end
            if (armorer.current >= 75 and armorer.current < 100) then
                local selection = math.random(1, #tables.artisanTools4)
                tes3.addItem({ item = tables.artisanTools4[selection], reference = companionRef })

                local tool = tes3.getObject(tables.artisanTools4[selection])
                tes3.messageBox("" ..
                    companionRef.object.name .. " fashioned you a well-made tool. (" .. tool.name .. ")")
            end
            if armorer.current >= 100 then
                local selection = math.random(1, #tables.artisanTools5)
                tes3.addItem({ item = tables.artisanTools5[selection], reference = companionRef })

                local tool = tes3.getObject(tables.artisanTools5[selection])
                tes3.messageBox("" ..
                    companionRef.object.name .. " fashioned you an artisan tool. (" .. tool.name .. ")")
            end
        end
    end

    --Baker
    if (modData.abilities[44] == true or class.name == "Baker") then
        local randNum = math.random(1, 5)

        --Provide Baked Goods/Cooking Ingredients
        tes3.addItem({ item = tables.bakedGoods[randNum], reference = companionRef })

        local food = tes3.getObject(tables.bakedGoods[randNum])
        tes3.messageBox("" ..
            companionRef.object.name .. " provided some food. (" .. food.name .. ")")
    end

    --Barrister
    if (modData.abilities[45] == true or class.name == "Barrister") then
        local bounty = tes3.mobilePlayer.bounty

        --Do lawyer things
        if math.random(1, 130) < (speechcraft.current + modData.level) then
            if bounty > 0 then
                if bounty < 2000 then
                    tes3.mobilePlayer.bounty = (bounty / 1.5)
                else
                    tes3.mobilePlayer.bounty = (bounty - 700)
                end
                tes3.messageBox("" .. companionRef.object.name .. " reduced your bounty through a legal loophole!")
            end
        end
    end

    --Battle Alchemist
    if (modData.abilities[46] == true or class.name == "Battle Alchemist") then
        if math.random(1, 130) < (alchemy.current + modData.level) then
            --Brew a potion
            if (alchemy.current > 0 and alchemy.current < 25) then
                local selection = math.random(1, #tables.poisonsB)
                tes3.addItem({ item = tables.poisonsB[selection], reference = tes3.player })

                local potion = tes3.getObject(tables.poisonsB[selection])
                tes3.messageBox("" ..
                    companionRef.object.name .. " brewed you a weak poison. (" .. potion.name .. ")")
            end
            if (alchemy.current >= 25 and alchemy.current < 50) then
                local selection = math.random(1, #tables.poisonsC)
                tes3.addItem({ item = tables.poisonsC[selection], reference = tes3.player })

                local potion = tes3.getObject(tables.poisonsC[selection])
                tes3.messageBox("" ..
                    companionRef.object.name .. " brewed you a cheap poison. (" .. potion.name .. ")")
            end
            if (alchemy.current >= 50 and alchemy.current < 75) then
                local selection = math.random(1, #tables.poisonsS)
                tes3.addItem({ item = tables.poisonsS[selection], reference = tes3.player })

                local potion = tes3.getObject(tables.poisonsS[selection])
                tes3.messageBox("" ..
                    companionRef.object.name .. " brewed you a decent poison. (" .. potion.name .. ")")
            end
            if (alchemy.current >= 75 and alchemy.current < 100) then
                local selection = math.random(1, #tables.poisonsQ)
                tes3.addItem({ item = tables.poisonsQ[selection], reference = tes3.player })

                local potion = tes3.getObject(tables.poisonsQ[selection])
                tes3.messageBox("" ..
                    companionRef.object.name .. " brewed you a quality poison! (" .. potion.name .. ")")
            end
            if alchemy.current >= 100 then
                local selection = math.random(1, #tables.poisonsE)
                tes3.addItem({ item = tables.poisonsE[selection], reference = tes3.player })

                local potion = tes3.getObject(tables.poisonsE[selection])
                tes3.messageBox("" ..
                    companionRef.object.name .. " brewed you an exquisite poison! (" .. potion.name .. ")")
            end
        end
    end

    --Pearl Diver
    if (modData.abilities[47] == true or class.name == "Pearl Diver") then
        if math.random(1, 140) < (attTable[8].current + modData.level) then
            --Find a Pearl
            tes3.addItem({ item = "ingred_pearl_01", reference = companionRef })
            tes3.messageBox("" ..
                companionRef.object.name .. " found a Pearl.")
        end
    end

    --Beastmaster
    if (modData.abilities[48] == true or class.name == "Beastmaster") then
        if math.random(1, 130) < (attTable[3].current + modData.level) then
            local creTable = func.creTable()

            --Train allied Creatures
            for i = 1, #creTable do
                local reference = creTable[i]

                local randNum = math.random(0, 7)
                local modDataSpecial = func.getModData(reference)
                local value = 1

                if modData.aboveMaxAtt == false then
                    local attStat = reference.mobile.attributes[randNum + 1]
                    if attStat.base + value > 100 then
                        value = math.max(100 - attStat.base, 0)
                    end
                end

                tes3.modStatistic({ attribute = randNum, value = value, reference = reference })

                modDataSpecial.att_gained[randNum + 1] = modDataSpecial.att_gained[randNum + 1] + value

                tes3.messageBox("" ..
                    companionRef.object.name ..
                    " trained " .. reference.object.name .. "'s " .. tes3.getAttributeName(randNum) .. ".")
            end
        end
    end

    --Bookseller gives another skill point when you read skill books. (See this.comprehension) #49 Reading Comprehension

    --Courtesan
    if (modData.abilities[50] == true or class.name == "Courtesan") then

        --Stand there and look pretty
        tes3.applyMagicSource({
            reference = tes3.player,
            name = "Good Company",
            bypassResistances = true,
            effects = {
                { id = tes3.effect.fortifyAttribute, attribute = 6,
                    duration = (math.random(120, 180) + (attTable[7].current * 3)),
                    min = (modData.level / 2),
                    max = modData.level },
            },
        })
        tes3.messageBox("" .. companionRef.object.name .. "'s charm rubbed off on you.")
    end

    --Farmer and Gardener
    if (
        modData.abilities[52] == true or modData.abilities[53] == true or class.name == "Farmer" or
            class.name == "Gardener") then
        local randNum = math.random(1, 41)

        --Find random plants
        tes3.addItem({ item = tables.plants[randNum], reference = companionRef })

        local spoils = tes3.getObject(tables.plants[randNum])
        tes3.messageBox("" ..
            companionRef.object.name .. " gathered a plant. (" .. spoils.name .. ")")
    end

    --Journalist
    if (modData.abilities[58] == true or class.name == "Journalist") then
        if math.random(1, 140) < (speechcraft.current + modData.level) then
            --Write article
            tes3.runLegacyScript {
                reference = tes3.player,
                command = "ModReputation 1"
            }
            tes3.messageBox("" .. companionRef.object.name .. "'s article increased your reputation!")
        end
    end

    --Master-at-Arms
    if (modData.abilities[61] == true or class.name == "Master-at-Arms") then
        local master = tes3.findClass("Master-at-Arms")
        local randNum = math.random(1, 5)
        local randNum2 = math.random(1, 5)

        --Exercise 1 Major Skill and 1 Minor Skill from Master-at-Arms Class
        tes3.player.mobile:exerciseSkill(master.majorSkills[randNum], (0.5 * modData.level))
        tes3.player.mobile:exerciseSkill(master.minorSkills[randNum2], (0.5 * modData.level))

        tes3.messageBox("" ..
            companionRef.object.name ..
            " trained you in " ..
            tes3.getSkillName(master.majorSkills[randNum]) ..
            " and " .. tes3.getSkillName(master.minorSkills[randNum2]) .. ".")
    end

    --Miner/Ore Miner
    if (modData.abilities[62] == true or class.name == "Miner" or modData.abilities[74] == true or class.name == "Ore Miner") then
        if math.random(1, 180) < (attTable[6].current + modData.level) then
            local randNum = math.random(1, 2)

            --Mine something
            tes3.addItem({ item = tables.ore[randNum], reference = companionRef })

            local spoils = tes3.getObject(tables.ore[randNum])
            tes3.messageBox("" ..
                companionRef.object.name .. " seems to have found some " .. spoils.name .. ".")
        end
    end

    --Pawnbroker/Trader
    if (modData.abilities[66] == true or class.name == "Pawnbroker" or modData.abilities[69] == true or class.name == "Trader") then
        if math.random(1, 130) < (mercantile.current + modData.level) then
            --Buy from leveled lists
            local item
            repeat
                local randNum = math.random(1, 18)
                log:debug("Trade List #" .. randNum .. " chosen.")
                item = tes3.getObject(tables.tradeLists[randNum]):pickFrom()
            until (item ~= nil)
            local price = math.round(item.value * (1 - ((mercantile.current + 10) / 350)))

            local removedCount = tes3.removeItem({ reference = companionRef, item = "Gold_001", count = price, playSound = false })
            if removedCount < price then
                tes3.addItem({ reference = companionRef, item = "Gold_001", count = removedCount, playSound = false })
                tes3.messageBox("" .. companionRef.object.name .. " tried to buy " .. item.name .. " for " .. price .. ", but didn't have enough gold.")
            else
                tes3.addItem({ reference = companionRef, item = item.id, count = 1 })
                tes3.messageBox("" .. companionRef.object.name .. " bought " .. item.name .. " for " .. price .. " gold.")
            end
        end
    end

    --Publican
    if (modData.abilities[67] == true or class.name == "Publican") then
        local randNum = math.random(1, 7)

        --Serve drink
        tes3.addItem({ item = tables.drinks[randNum], reference = tes3.player })

        local drink = tes3.getObject(tables.drinks[randNum])
        tes3.messageBox("" ..
            companionRef.object.name .. " served you some " .. drink.name .. ".")
    end

    --Commoner gives an additional level once their class ability is learned. (See this.npcAbilities) #70 Potential

    --Gambler
    if (modData.abilities[71] == true or class.name == "Gambler") then
        --Gamble
        local randNum = (math.random(10, 300) + (modData.level * 20))
        local removedCount = tes3.removeItem({ reference = companionRef, item = "Gold_001", count = randNum, playSound = true })
        if removedCount > 0 then
            if math.random(10, 170) < attTable[8].current then
                --Success
                local winnings = math.round(removedCount * (((attTable[8].current + 10) / 350) + math.random()))
                tes3.addItem({ reference = companionRef, item = "Gold_001", count = (removedCount + winnings), playSound = true })
                tes3.messageBox("" .. companionRef.object.name .. " won " .. winnings .. " gold from their last gambling session.")
            else
                --Failure
                tes3.messageBox("" .. companionRef.object.name .. " lost " .. removedCount .. " gold from their last gambling session.")
            end
        else
            tes3.messageBox("" .. companionRef.object.name .. " had no gold to gamble with.")
        end
    end

    --Herders will placate most wild guars and netch, setting their fight to zero. (See this.tranquility) #72 Tranquility

    --Jesters demoralize humanoid enemies, reducing their Luck and Agility. (See this.jest) #73 Jester's Privilege

    --Thaumaturges reduce enemies' Fire, Frost, and Shock resistances. (See this.thaumaturgy) #80 Thaumaturgy

    --Shaman
    if (modData.abilities[83] == true or class.name == "Shaman") then
        --Restore Magicka
        tes3.applyMagicSource({
            reference = tes3.player,
            name = "Trance",
            effects = {
                { id = tes3.effect.restoreMagicka,
                    duration = (math.random(60, 120) + (mysticism.current * 3)),
                    min = 1,
                    max = 1 },
            },
        })
        tes3.messageBox("" .. companionRef.object.name .. " imbued you with aetherial energy!")
    end

    --Summoner
    if (modData.abilities[87] == true or class.name == "Summoner") then
        --Summon a free minion
        if (conjuration.current > 0 and conjuration.current < 25) then
            tes3.applyMagicSource({
                reference = companionRef,
                name = "Summoned Scamp",
                effects = {
                    { id = tes3.effect.summonScamp,
                        duration = (math.random(120, 180) + (conjuration.current * 3))
                    },
                }
            })
            tes3.messageBox("" .. companionRef.object.name .. " summoned a Scamp.")
        end
        if (conjuration.current >= 25 and conjuration.current < 50) then
            tes3.applyMagicSource({
                reference = companionRef,
                name = "Summoned Clannfear",
                effects = {
                    { id = tes3.effect.summonClannfear,
                        duration = (math.random(120, 180) + (conjuration.current * 3))
                    },
                }
            })
            tes3.messageBox("" .. companionRef.object.name .. " summoned a Clannfear.")
        end
        if (conjuration.current >= 50 and conjuration.current < 75) then
            local choice
            local randNum = math.random(1, 3)

            if randNum == 1 then
                choice = tes3.effect.summonFlameAtronach
            elseif (randNum == 2) then
                choice = tes3.effect.summonFrostAtronach
            elseif (randNum == 3) then
                choice = tes3.effect.summonStormAtronach
            end

            tes3.applyMagicSource({
                reference = companionRef,
                name = "Summoned Atronach",
                effects = {
                    { id = choice,
                        duration = (math.random(120, 180) + (conjuration.current * 4))
                    },
                }
            })
            tes3.messageBox("" .. companionRef.object.name .. " summoned an Atronach.")
        end
        if (conjuration.current >= 75 and conjuration.current < 100) then
            local choice
            local randNum = math.random(1, 3)

            if randNum == 1 then
                choice = tes3.effect.summonHunger
            elseif (randNum == 2) then
                choice = tes3.effect.summonDaedroth
            elseif (randNum == 3) then
                choice = tes3.effect.summonWingedTwilight
            end

            tes3.applyMagicSource({
                reference = companionRef,
                name = "Summoned Greater Daedra",
                effects = {
                    { id = choice,
                        duration = (math.random(120, 180) + (conjuration.current * 4))
                    },
                }
            })
            tes3.messageBox("" .. companionRef.object.name .. " summoned a greater Daedra.")
        end
        if conjuration.current >= 100 then
            tes3.applyMagicSource({
                reference = companionRef,
                name = "Summoned Golden Saint",
                effects = {
                    { id = tes3.effect.summonGoldenSaint,
                        duration = (math.random(120, 180) + (conjuration.current * 5))
                    },
                }
            })
            tes3.messageBox("" .. companionRef.object.name .. " summoned a Golden Saint!")
        end
    end

    --Plagueherald spreads diseases they carry to enemies. (see this.inoculate) #96 Patient Zero

    --Bounty Hunter accepts bounties once per level. (see this.bounty) #97 Citizen's Arrest

    --Scribe
    if (modData.abilities[98] == true or class.name == "Scribe") then
        if math.random(1, 130) < (enchant.current + modData.level) then
            --Compile a scroll
            if (enchant.current > 0 and enchant.current < 25) then
                local selection = math.random(1, 7)
                tes3.addItem({ item = tables.scrolls[selection], reference = companionRef })

                local scroll = tes3.getObject(tables.scrolls[selection])
                tes3.messageBox("" .. companionRef.object.name .. " compiled a " .. scroll.name .. ".")
            end
            if (enchant.current >= 25 and enchant.current < 50) then
                local selection = math.random(1, 24)
                tes3.addItem({ item = tables.scrolls[selection], reference = companionRef })

                local scroll = tes3.getObject(tables.scrolls[selection])
                tes3.messageBox("" .. companionRef.object.name .. " compiled a " .. scroll.name .. ".")
            end
            if (enchant.current >= 50 and enchant.current < 75) then
                local selection = math.random(1, 45)
                tes3.addItem({ item = tables.scrolls[selection], reference = companionRef })

                local scroll = tes3.getObject(tables.scrolls[selection])
                tes3.messageBox("" .. companionRef.object.name .. " compiled a " .. scroll.name .. ".")
            end
            if (enchant.current >= 75 and enchant.current < 100) then
                local selection = math.random(1, 76)
                tes3.addItem({ item = tables.scrolls[selection], reference = companionRef })

                local scroll = tes3.getObject(tables.scrolls[selection])
                tes3.messageBox("" .. companionRef.object.name .. " compiled a " .. scroll.name .. ".")
            end
            if enchant.current >= 100 then
                local selection = math.random(1, 91)
                tes3.addItem({ item = tables.scrolls[selection], reference = companionRef })

                local scroll = tes3.getObject(tables.scrolls[selection])
                tes3.messageBox("" .. companionRef.object.name .. " compiled a " .. scroll.name .. ".")
            end
        end
    end

    --Poet
    if (modData.abilities[100] == true or class.name == "Poet") then
        local value = 1

        if modData.aboveMaxSkill == false then
            local skillStat = tes3.player.mobile:getSkillStatistic(25)
            if skillStat.base + value > 100 then
                value = math.max(100 - skillStat.base, 0)
            end
        end

        --Teach Speechcraft
        if math.random(1, 130) < (speechcraft.current + modData.level) then
            tes3.modStatistic({ skill = 25, value = value, reference = tes3.player })
            tes3.messageBox("" .. companionRef.object.name .. " gave an epiphanic verse which taught you a bit about Speechcraft.")
        end
    end

    --Scavenger scavenges random stuff?

    --Wandering Artist?

    --diplomat?

    --diresinger is bard opposite?

    --druid does something beast/plant related?

    --juggler?

    --shadowdancer?

    --ranger does something location related?

    --Skald?

    --Sand-runner
end

--Opportunist #4---------------------------------------------------------------------------------------------------------------------
function this.contract()
    log = logger.getLogger("Companion Leveler")
    log:trace("Contract triggered.")

    local npcTable = func.npcTable()

    for i = 1, #npcTable do
        local reference = npcTable[i]
        local modData = func.getModData(reference)

        if (modData.abilities[4] == true or modData.class == "Assassin") then
            local temp = {}
            for obj in tes3.iterateObjects(tes3.objectType.npc) do
                temp[obj] = true
            end

            local list = {}
            for obj in pairs(temp) do
                list[#list+1] = obj
            end

            local choice

            repeat
                local check = true

                choice = list[math.random(1, #list)]

                if choice.name == "" then
                    check = false
                else
                    for n = 1, #tables.contractBlacklist do
                        if string.match(choice.name, tables.contractBlacklist[n]) then
                            check = false
                            break
                        end
                    end
                end
            until (check == true)

            table.insert(modData.contracts, choice.id)

            local amount = (choice.level * 100)

            if amount > 5000 then
                amount = 5000
            end

            tes3.messageBox("" .. reference.object.name .. " received a contract to kill " .. choice.name .. " for " .. amount .. " gold.")
            log:info("" .. reference.object.name .. " received a contract to kill " .. choice.name .. " for " .. amount .. " gold.")
        end
    end
end

function this.contractKill(e)
    log = logger.getLogger("Companion Leveler")
    log:trace("Contract kill check triggered.")

    local npcTable = func.npcTable()

    for i = 1, #npcTable do
        local reference = npcTable[i]
        local modData = func.getModData(reference)

        if modData.contracts then
            for n = 1, #modData.contracts do
                log:trace("" .. reference.object.name .. "'s Contract List #" .. n .. ": " .. modData.contracts[n] .. "")
                local object = tes3.getObject(modData.contracts[n])

                if object.name == e.reference.object.name then
                    table.remove(modData.contracts, n)

                    local amount = (e.reference.object.level * 100)

                    if amount > 5000 then
                        amount = 5000
                    end

                    tes3.addItem({ reference = reference, item = "Gold_001", count = amount, playSound = true })

                    tes3.messageBox("" .. reference.object.name .. " received a " .. amount .. " gold reward for " .. e.reference.object.name .. "'s death!")
                    log:info("" .. reference.object.name .. " received a " .. amount .. " gold reward for " .. e.reference.object.name .. "'s death!")
                end
            end
        end
    end
end

--Observant #16---------------------------------------------------------------------------------------------------------------------
function this.survey()
    log = logger.getLogger("Companion Leveler")
    log:trace("Survey triggered.")

    local npcTable = func.npcTable()
    local trigger = 0
    local name

    for i = 1, #npcTable do
        local reference = npcTable[i]
        local modData = func.getModData(reference)
        if (modData.abilities[16] == true or modData.class == "Scout") then
            if math.random(0, 99) < 3 then
                trigger = 1
                name = reference.object.name
                break
            end
        end
    end

    if trigger == 1 then
        log:info("" .. name .. "'s observations granted bonus experience.")
        return 1
    else
        return 0
    end
end


--Reading Comprehension #49---------------------------------------------------------------------------------------------------------
function this.comprehension(e)
    log = logger.getLogger("Companion Leveler")
    log:trace("Comprehension triggered.")

	if e.source == "book" then
		local npcTable = func.npcTable()
		local trigger = 0
        local name

		for i = 1, #npcTable do
			local reference = npcTable[i]
			local modData = func.getModData(reference)
			if (modData.abilities[49] == true or modData.class == "Bookseller") then
				if math.random(1, 120) < (reference.mobile.intelligence.current + modData.level) then
					trigger = 1
                    name = reference.object.name
				end
			end
		end

		if trigger == 1 then
			if config.aboveMaxSkill == false then
				local skill = tes3.player.mobile:getSkillStatistic(e.skill)
				if skill.base + 1 > 100 then
					--Do nothing
				else
					tes3.modStatistic({ skill = e.skill, value = 1, reference = tes3.player })
				end
			else
				tes3.modStatistic({ skill = e.skill, value = 1, reference = tes3.player })
			end
            log:debug("" .. name .. "'s literary insight enhanced your studies in " .. tes3.getSkillName(e.skill) .. ".")
            tes3.messageBox("" .. name .. "'s literary insight enhanced your studies in " .. tes3.getSkillName(e.skill) .. ".")
		end
	end
end


--Tranquility #72-------------------------------------------------------------------------------------------------------------------
function this.tranquility(ref)
    log = logger.getLogger("Companion Leveler")
    log:trace("Tranquility triggered.")

	if (ref.object.name == "Wild Guar" or ref.object.name == "Betty Netch" or ref.object.name == "Bull Netch") then
		local npcTable = func.npcTable()
		local trigger = 0

		for i = 1, #npcTable do
			local reference = npcTable[i]
			local modData = func.getModData(reference)
			if (modData.abilities[72] == true or modData.class == "Herder") then
				trigger = 1
				log:debug("" .. ref.object.name .. " was placated by " .. reference.object.name .. ".")
                break
			end
		end

		--Placate
		if trigger == 1 then
			ref.mobile.fight = 0
		end
	end
end


--Jester's Privilege #73----------------------------------------------------------------------------------------------------------
function this.jest(e)
    log = logger.getLogger("Companion Leveler")
    log:trace("Jest triggered.")

	if (e.target == tes3.mobilePlayer) then
        log:trace("Combat target is player.")
		for actor in tes3.iterate(tes3.mobilePlayer.hostileActors) do
			if actor.objectType ~= tes3.objectType.creature then
				local npcTable = func.npcTable()
				local trigger = 0
				local speechcraft
				local level
				local caster

				for i = 1, #npcTable do
					local reference = npcTable[i]
					local modData = func.getModData(reference)
					if (modData.abilities[73] == true or modData.class == "Jester") then
						trigger = 1
						caster = reference.object.name
						speechcraft = reference.mobile:getSkillStatistic(25)
						level = modData.level
						log:debug("" .. caster .. " attempted to provoke " .. actor.reference.object.name .. ".")
					end
				end

				if trigger == 1 then
					--Weakness to Normal Weapons as an effect to check for
					local affected = tes3.isAffectedBy({ reference = actor.reference, effect = 36 })
					if not affected then
						if speechcraft.current > (actor.reference.mobile.willpower.current + 10) then
							local randNum = math.random(60, 120)
							local amount = level
							if amount > 30 then
								amount = 30
							end

                            --Drain Agility and Luck
							tes3.applyMagicSource({
								reference = actor.reference,
								name = "Jest",
								bypassResistances = true,
								effects = {
									{ id = tes3.effect.weaknesstoNormalWeapons,
										duration = (randNum + (speechcraft.current * 2)),
										min = 1,
										max = 1 }, { id = tes3.effect.drainAttribute, attribute = 3,
										duration = (randNum + (speechcraft.current * 2)),
										min = (amount / 2),
										max = (amount / 2) }, { id = tes3.effect.drainAttribute, attribute = 7,
										duration = (randNum + (speechcraft.current * 2)),
										min = amount,
										max = amount },
								},
							})
                            tes3.createVisualEffect({ object = "VFX_IllusionHit", lifespan = 3, reference = actor.reference })
							log:debug("" .. actor.reference.object.name .. " was affected by " .. caster .. "'s Jest!")
                            if config.bMessages == true then
                                tes3.messageBox("" .. actor.reference.object.name .. " was affected by " .. caster .. "'s Jest!")
                            end
						else
							log:debug("" .. actor.reference.object.name .. " ignored " .. caster .. "'s Jest!")
                            if config.bMessages == true then
                                tes3.messageBox("" .. actor.reference.object.name .. " ignored " .. caster .. "'s Jest!")
                            end
						end
					else
						log:debug("" .. actor.reference.object.name .. " is already affected by Jest.")
					end
				end
			end
		end
	end
end


--Thaumaturgy #80-----------------------------------------------------------------------------------------------------------------
function this.thaumaturgy(e)
    log = logger.getLogger("Companion Leveler")
    log:trace("Thaumaturgy triggered.")

	if (e.target == tes3.mobilePlayer) then
        log:trace("Combat target is player.")
		for actor in tes3.iterate(tes3.mobilePlayer.hostileActors) do
			local npcTable = func.npcTable()
            local trigger = 0
            local willpower
            local caster

            for i = 1, #npcTable do
                local reference = npcTable[i]
                local modData = func.getModData(reference)
                if (modData.abilities[80] == true or modData.class == "Thaumaturge") then
                    trigger = 1
                    caster = reference.object.name
                    willpower = reference.mobile.attributes[3]
                    log:debug("" .. caster .. " attempted to shear " .. actor.reference.object.name .. ".")
                end
            end

            if trigger == 1 then
                --Weakness to Corprus as an effect to check for
                local affected = tes3.isAffectedBy({ reference = actor.reference, effect = 34 })
                if not affected then
                    local randNum = math.random(30, 60)

                    tes3.applyMagicSource({
                        reference = actor.reference,
                        name = "Shear",
                        bypassResistances = true,
                        effects = {
                            { id = tes3.effect.weaknesstoCorprusDisease,
                                duration = (randNum + willpower.current),
                                min = 1,
                                max = 1 }, { id = tes3.effect.weaknesstoFire,
                                duration = (randNum + willpower.current),
                                min = (willpower.current + 10) / 5,
                                max = (willpower.current + 10) / 3}, { id = tes3.effect.weaknesstoFrost,
                                duration = (randNum + willpower.current),
                                min = (willpower.current + 10) / 5,
                                max = (willpower.current + 10) / 3 }, { id = tes3.effect.weaknesstoShock,
                                duration = (randNum + willpower.current),
                                min = (willpower.current + 10) / 5,
                                max = (willpower.current + 10) / 3 },
                        },
                    })
                    tes3.createVisualEffect({ object = "VFX_DestructHit", lifespan = 3, reference = actor.reference })
                    log:debug("" .. actor.reference.object.name .. " was affected by " .. caster .. "'s Thaumaturgy!")
                    if config.bMessages == true then
                        tes3.messageBox("" .. actor.reference.object.name .. " was affected by " .. caster .. "'s Thaumaturgy!")
                    end
                else
                    log:debug("" .. actor.reference.object.name .. " is already affected by Shear.")
                end
            end
        end
	end
end


--Insight #88--------------------------------------------------------------------------------------------------------------------
function this.insight(num)
    log = logger.getLogger("Companion Leveler")
    log:trace("Insight triggered.")

    local npcTable = func.npcTable()
    local trigger = 0
    local name

    for i = 1, #npcTable do
        local reference = npcTable[i]
        local modData = func.getModData(reference)
        if (modData.abilities[88] == true or modData.class == "Sage") then
            if math.random(1, 200) < (reference.mobile.intelligence.current + modData.level) then
                trigger = 1
                name = reference.object.name
            end
        end
    end

    if trigger == 1 then
        log:debug("" .. name .. "'s insight granted bonus experience.")
        tes3.messageBox("" .. name .. "'s insight granted bonus experience.")

        return num + 1
    end
end

--Patient Zero #96--------------------------------------------------------------------------------------------------------------------
function this.inoculate(e)
    log = logger.getLogger("Companion Leveler")
    log:trace("Inoculate triggered.")

	if (e.target == tes3.mobilePlayer) then
        log:trace("Combat target is player.")
		for actor in tes3.iterate(tes3.mobilePlayer.hostileActors) do
            local npcTable = func.npcTable()
            local trigger = 0
            local destruction
            local alchemy
            local level
            local caster

            for i = 1, #npcTable do
                local reference = npcTable[i]
                local modData = func.getModData(reference)
                if (modData.abilities[96] == true or modData.class == "Plagueherald") then
                    trigger = 1
                    caster = reference
                    destruction = reference.mobile:getSkillStatistic(10)
                    alchemy = reference.mobile:getSkillStatistic(16)
                    level = modData.level
                    log:debug("" .. caster.object.name .. " attempted to inoculate " .. actor.reference.object.name .. ".")
                end
            end

            if trigger == 1 then
                local diseases = tes3.getSpells({ target = caster, spellType = 3, getRaceSpells = false, getBirthsignSpells = false })
                if #diseases > 0 then
                    for i = 1, #diseases do
                        local affected = tes3.isAffectedBy({ reference = actor.reference, object = diseases[i] })
                        if not affected then
                            if ((destruction.current * 0.3) + (alchemy.current * 0.3) + (level * 0.3)) > (actor.reference.mobile.endurance.current + math.random(1, 30)) then
                                tes3.addSpell({ reference = actor.reference, spell = diseases[i] })
                                log:debug("" .. actor.reference.object.name .. " was inflicted with " .. caster.object.name .. "'s " .. diseases[i].name .. "!")
                                tes3.createVisualEffect({ object = "VFX_PoisonHit", lifespan = 3, reference = actor.reference })
                                if config.bMessages == true then
                                    tes3.messageBox("" .. actor.reference.object.name .. " was inflicted with " .. caster.object.name .. "'s " .. diseases[i].name .. "!")
                                end
                            else
                                log:debug("" .. actor.reference.object.name .. " resisted " .. caster.object.name .. "'s " .. diseases[i].name .. "!")
                                if config.bMessages == true then
                                    tes3.messageBox("" .. actor.reference.object.name .. " resisted " .. caster.object.name .. "'s " .. diseases[i].name .. "!") 
                                end
                            end
                        else
                            log:debug("" .. actor.reference.object.name .. " is already affected by " .. diseases[i].name .. ".")
                        end
                    end
                else
                    log:debug("" .. caster.object.name .. " has no diseases to spread!")
                end
            end
		end
	end
end

--Citizen's Arrest #97--------------------------------------------------------------------------------------------------------------------
function this.bounty()
    log = logger.getLogger("Companion Leveler")
    log:trace("Bounty triggered.")

    local npcTable = func.npcTable()

    for i = 1, #npcTable do
        local reference = npcTable[i]
        local modData = func.getModData(reference)

        if (modData.abilities[97] == true or modData.class == "Bounty Hunter") then
            local temp = {}
            for _, cell in pairs(tes3.dataHandler.nonDynamicData.cells) do
                temp[cell] = true
            end

            local list = {}
            for cell in pairs(temp) do
                list[#list+1] = cell
            end

            local choice

            repeat
                local check = true

                choice = list[math.random(1, #list)]

                if (choice.displayName ~= nil) then
                    for n = 1, #tables.bountyBlacklist do
                        if string.match(choice.displayName, tables.bountyBlacklist[n]) then
                            check = false
                            break
                        end
                    end
                else
                    check = false
                end

            until (check == true)


            table.insert(modData.bounties, choice.id)

            local cellName = choice.displayName
            local unused
            if string.match(cellName, ",") then
                cellName, unused = choice.displayName:match("([^,]+),([^,]+)")
            end

            tes3.messageBox("" .. reference.object.name .. " received a bounty to kill a fugitive. They were last seen in " .. cellName .. ".")
            log:info("" .. reference.object.name .. " received a bounty to kill a fugitive. They were last seen in " .. cellName .. ".")
        end
    end
end

function this.bountyCheck()
    log = logger.getLogger("Companion Leveler")
    log:trace("Bounty check triggered.")

    local npcTable = func.npcTable()
    local modData

    for i = 1, #npcTable do
        local reference = npcTable[i]
        modData = func.getModData(reference)

        if (modData.abilities[97] == true or modData.class == "Bounty Hunter") then
            if modData.bounties then
                for n = 1, #modData.bounties do
                    log:trace("" .. reference.object.name .. "'s Bounty Cell List #" .. n .. ": " .. modData.bounties[n] .. "")

                    if tes3.player.cell.id == modData.bounties[n] then
                        local choice = math.random(1, 10)

                        tes3.createReference({ object = "kl_npc_fugitive_" .. choice .. "", position = tes3.getCameraPosition(), orientation = tes3.player.orientation:copy(), cell = modData.bounties[n] })
                        table.remove(modData.bounties, n)

                        log:info("" .. reference.object.name .. "'s Bounty #" .. n .. " was found!")
                    end
                end
            end
        end
    end
end

function this.bountyKill(e)
    log = logger.getLogger("Companion Leveler")
    log:trace("Bounty kill check triggered.")

    local npcTable = func.npcTable()

    for i = 1, #npcTable do
        local reference = npcTable[i]
        local modData = func.getModData(reference)

        if (modData.abilities[97] == true or modData.class == "Bounty Hunter") then
            if string.startswith(e.reference.object.id, "kl_npc_fugitive") then
                local amount = (e.reference.object.level * math.random(25, 75))

                if amount > 2000 then
                    amount = 2000
                end

                tes3.addItem({ reference = reference, item = "Gold_001", count = amount, playSound = true })

                tes3.messageBox("" .. reference.object.name .. " received a " .. amount .. " bounty!")
                log:info("" .. reference.object.name .. " received a " .. amount .. " bounty!")
            end
        end
    end
end

--Moonlight Requiem #99--------------------------------------------------------------------------------------------------------------------
function this.requiem(e)
    log = logger.getLogger("Companion Leveler")
    log:trace("Moonlight Requiem triggered.")

	if (e.target == tes3.mobilePlayer) then
        log:trace("Combat target is player.")
		for actor in tes3.iterate(tes3.mobilePlayer.hostileActors) do
            if string.match(actor.reference.object.id, "werewolf") then
                local npcTable = func.npcTable()

                for i = 1, #npcTable do
                    local reference = npcTable[i]
                    local modData = func.getModData(reference)

                    if (modData.abilities[99] == true or modData.class == "Silver Hand") then
                        log:debug("" .. reference.object.name .. " spotted a werewolf!")

                        local affected = tes3.isAffectedBy({ reference = reference, object = "kl_spell_requiem" })

                        if not affected then
                            tes3.cast({ reference = reference, target = reference, spell = "kl_spell_requiem", instant = true, bypassResistances = true })

                            log:debug("" .. reference.object.name .. " entered a frenzy!")
                            if config.bMessages == true then
                                tes3.messageBox("" .. reference.object.name .. " entered a frenzy!")
                            end
                        else
                            log:debug("" .. reference.object.name .. " is already affected by Moonlight Requiem.")
                        end
                    end
                end
            end
        end
	end
end


return this