local common = require ("mer.ashfall.common.common")
local logger = common.createLogger("Bushcrafting")
local CraftingFramework = include("CraftingFramework")
if not CraftingFramework then
    logger:error("CraftingFramework not found")
end
local config = require("mer.ashfall.config").config
local craftingConfig = require("mer.ashfall.bushcrafting.config")


do -- initialise crafting
    for _, tool in ipairs(craftingConfig.tools) do
        logger:debug("Registering Tool: %s", tool.id)
        CraftingFramework.Tool:new(tool)
    end
    for _, menuActivator in ipairs(craftingConfig.menuActivators) do
        logger:debug("Registering Menu Activator: %s", menuActivator.name)
        CraftingFramework.MenuActivator:new(menuActivator)
    end
    for _, material in ipairs(craftingConfig.materials) do
        logger:debug("Registering Material: %s", material.name)
        CraftingFramework.Material:new(material)
    end
    event.trigger("Ashfall:Bushcrafting_Initialized")
end

--Vanilla tanning racks
for _, tanningRackId in ipairs(craftingConfig.tanningRacks) do
    CraftingFramework.StaticActivator.register{
        objectId = tanningRackId,
        name = "Tanning Rack",
        onActivate = function()
            logger:debug("Tanning Rack Activated")
            event.trigger(craftingConfig.tanningEvent)
        end
    }
end

local function isMaterial(item)
    for _, conf in ipairs(craftingConfig.materials) do
        local material = CraftingFramework.Material.getMaterial(conf.id)
        if material then
            if material:itemIsMaterial(item.id) then
                return true
            end
        end
    end
    return false
end


local function onActivateMaterial(e)
    if not config.bushcraftingEnabled then
        return
    end
    --must be in menu
    if not tes3.menuMode() then return end
    if isMaterial(e.item) then
        logger:debug("Equipped material, triggering menu")
        event.trigger(craftingConfig.menuEvent)
        return true
    end
end
event.register("equip", onActivateMaterial, { filter = tes3.player, priority = -50 } )

--Chisel
---@param e equipEventData
local function onEquipChisel(e)
    --Check if equipped item is registered as a chisel Tool
    if not config.bushcraftingEnabled then
        return
    end
    if not tes3.menuMode() then return end
    local chisel = CraftingFramework.Tool.getTool("chisel")
    if chisel then
        if chisel:itemIsTool(e.item) then
            logger:debug("Equipped chisel, triggering menu")
            event.trigger(craftingConfig.carvingEvent)
            return true
        end
    end
end
event.register("equip", onEquipChisel, { filter = tes3.player, priority = -50 } )



local function createMaterialsTooltip(e)
    if not config.bushcraftingEnabled then return end

    if not e.tooltip then
        return
    end
    if not e.object then
        return
    end

    if isMaterial(e.object) then
        common.helper.addLabelToTooltip(e.tooltip, "Bushcrafting Material", {175/255, 129/255, 184/255})
    end
end
event.register('uiObjectTooltip', createMaterialsTooltip)


local function buildName(object, customName)
    return string.format("%s: %s", object.name, customName)
end
local function customNameTooltip(e)
    local name = e.itemData and e.itemData.data.customName
    if name then
        local label = e.tooltip:findChild(tes3ui.registerID('HelpMenu_name'))
        if label then
            label.text = buildName(e.object, name)
        end
    end
end
event.register("uiObjectTooltip", customNameTooltip)