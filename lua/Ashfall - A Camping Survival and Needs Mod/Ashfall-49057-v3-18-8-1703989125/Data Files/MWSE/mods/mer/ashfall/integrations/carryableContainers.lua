local CraftingFramework = require("CraftingFramework")
local CarryableContainer = CraftingFramework.CarryableContainer
local Backpack = require("mer.ashfall.items.backpack")
local common = require("mer.ashfall.common.common")
local logger = common.createLogger("carryableContainers")


---@param self CarryableContainer
local function doEquip(self)
    local item = self.item --[[@as tes3clothing]]
    logger:debug("Equipping backpack `%s`", item.id)
    local didEquip = tes3.mobilePlayer:equip{ item = item }
    if not didEquip then
        logger:error("Failed to equip backpack")
    end
    self:updateStats()
end

---@param self CarryableContainer
local function doOpen(self)
    logger:debug("Opening backpack `%s`", self.item.id)
    self:openFromInventory()
end

local callbacks = {
    ---@param self CarryableContainer
    openFromInventory = function(self)
        logger:debug("Opening from inventory")
        if CraftingFramework.Util.isQuickModifierDown() then
            doOpen(self)
        else
            doEquip(self)
        end
    end,
    ---@param self CarryableContainer
    _openFromInventory = function(self)
        if CraftingFramework.Util.isQuickModifierDown() then
            doOpen(self)
        else
            tes3ui.showMessageMenu{
                message = self.item.name,
                buttons = {
                    {
                        text = "Open",
                        callback = function()
                            timer.delayOneFrame(function() doOpen(self) end)
                        end
                    },
                    { text = "Equip", callback = function() doEquip(self) end },
                },
                cancels = true
            }
        end
    end,
    ---@param self CarryableContainer
    getWeightModifier = function(self)
        logger:trace("getWeightModifier()")
        --Set weight modifier to 0.1 if the backpack is equipped,
        --otherwise set it to 1.0
        local equippedStack = tes3.getEquippedItem{
            actor = tes3.player,
            objectType = tes3.objectType.clothing,
            slot = 11
        }
        local isEquipped = equippedStack and equippedStack.object == self.item
        if isEquipped then
            logger:trace("- Updating weight for equipped backpack")
            return self.containerConfig.weightModifier
        end
        logger:trace("- Updating weight for unequipped backpack")
        return 1
    end,
    ---@param self CarryableContainer
    getWeightModifierText = function(self)
        return string.format("Weight Modifier: %.1fx When Equipped", self.containerConfig.weightModifier)
    end,
}



---@type CarryableContainer.containerConfig[]
local containers = {
    {
        -- Brown fur
        itemId = "ashfall_pack_01",
        capacity = 120,
        hasCollision = true,
        openFromInventory = callbacks.openFromInventory,
        getWeightModifier = callbacks.getWeightModifier,
        getWeightModifierText = callbacks.getWeightModifierText,
        weightModifier = 0.3,
    },
    {
        -- White fur
        itemId = "ashfall_pack_02",
        capacity = 120,
        hasCollision = true,
        openFromInventory = callbacks.openFromInventory,
        getWeightModifier = callbacks.getWeightModifier,
        getWeightModifierText = callbacks.getWeightModifierText,
        weightModifier = 0.3,
    },
    {
        -- Netch leather
        itemId = "ashfall_pack_03",
        capacity = 120,
        hasCollision = true,
        openFromInventory = callbacks.openFromInventory,
        getWeightModifier = callbacks.getWeightModifier,
        getWeightModifierText = callbacks.getWeightModifierText,
        weightModifier = 0.5,
    },
    {
        -- Survivalist (bushcrafted)
        itemId = "ashfall_pack_04",
        capacity = 100,
        hasCollision = true,
        openFromInventory = callbacks.openFromInventory,
        getWeightModifier = callbacks.getWeightModifier,
        getWeightModifierText = callbacks.getWeightModifierText,
        weightModifier = 0.5,
    },
    {
        -- Traveller (large with cover)
        itemId = "ashfall_pack_05",
        capacity = 150,
        hasCollision = true,
        openFromInventory = callbacks.openFromInventory,
        getWeightModifier = callbacks.getWeightModifier,
        getWeightModifierText = callbacks.getWeightModifierText,
        weightModifier = 0.5,
    },
    {
        -- Nordic
        itemId = "ashfall_pack_06",
        capacity = 120,
        hasCollision = true,
        openFromInventory = callbacks.openFromInventory,
        getWeightModifier = callbacks.getWeightModifier,
        getWeightModifierText = callbacks.getWeightModifierText,
        weightModifier = 0.3,
    },
    {
        --- Wicker
        itemId = "ashfall_pack_07",
        capacity = 100,
        hasCollision = true,
        openFromInventory = callbacks.openFromInventory,
        getWeightModifier = callbacks.getWeightModifier,
        getWeightModifierText = callbacks.getWeightModifierText,
        weightModifier = 0.7,
    },
}

for _, container in ipairs(containers) do
    CarryableContainer.register(container)
end

---@param e unequippedEventData
event.register("unequipped", function(e)
    logger:info("unequipped %s", e.item)
    local isBackpack = Backpack.isBackpack(e.item)
    if not isBackpack then
        logger:info("not a backpack")
        return
    end
    local container = CarryableContainer:new{ item = e.item, itemData = e.itemData }
    if not container then
        logger:info("not a carryable container")
        return
    end
    logger:info("- updating stats on unequip")
    container:updateStats()
end)

event.register("loaded", function()
    for backpack in pairs(common.data.backpacks) do
        Backpack.registerBackpack(backpack)
    end
end)