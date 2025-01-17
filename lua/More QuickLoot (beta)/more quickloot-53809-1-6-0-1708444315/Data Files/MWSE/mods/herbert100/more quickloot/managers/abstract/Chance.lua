local Class = require("herbert100.Class")
local defns = require("herbert100.more quickloot.defns")
-- local log = require("herbert100.Logger")("More QuickLoot/Chance")

local config = require("herbert100.more quickloot.config") ---@type MQL.config

local base = require("herbert100.more quickloot.managers.abstract.base") ---@type MQL.Manager
local Chance_Item = require("herbert100.more quickloot.Item").Chance


--[[## Chance Manager
This manager is subclassed whenever creating a manager in which items have "take chances", i.e.
each item has a chance of being taken successfully, or unsuccessfully.
]]
---@class MQL.Manager.Chance : MQL.Manager
---@field cant_loot MQL.defns.cant_loot? if not `nil`, it explains why this manager cant loot
---@field items MQL.Item.Chance[] the items being managed
---@field show_chances_skill_id tes3.skill
---@field config MQL.config.Manager.Chance
local Chance = Class.new({name="Chance Manager", parents={base}}, {item_type=Chance_Item})


function Chance:_make_items()
    base._make_items(self)
    self:update_item_chances()
end


function Chance:update_item_chances()
    local cfg = self.config
    local show_chances
    if cfg.show_chances == defns.ui_show_chances.always then 
        show_chances = true
    elseif cfg.show_chances == defns.ui_show_chances.never then 
        show_chances = false
    else 
        show_chances = tes3.mobilePlayer:getSkillValue(self.show_chances_skill_id) > cfg.show_chances_lvl
    end

    for _, item in ipairs(self.items) do
        item.chance = self:calc_item_chance(item)
        -- use config settings to see if we should show item chances
        -- and, if the item chance is 100, only show chances if that setting is enabled
        item.show_chance = show_chances and (item.chance ~= 1 or cfg.show_chances_100)
    end
end

--- calculate the chance of successfully taking this item. this is called before the UI is created.
---@param item MQL.Item.Chance|tes3item
---@return integer take_chance the chance of successfully taking one copy of this item. should be a number between 0 and 100
function Chance:calc_item_chance(item) return 1 end


--- this is called whenever the player tries to take an object and fails. 
---@param item MQL.Item.Chance the item the player failed to take
---@param take_stack boolean? how many items the player tried to take
---@return boolean got_lucky if `true`, the player got lucky and they will successfully take the item. if `false`, they didn't get lucky and will fail to take the item.
function Chance:luck_override(item, take_stack)
    return tes3.mobilePlayer.luck.current >= 260 or math.random(100) <= 0.5 * (tes3.mobilePlayer.luck.current - 30)
end



--- this function is called whenever `item` is taken successfully
---@param item MQL.Item.Chance
---@param take_stack boolean are we taking the whole stack?
---@param update_stuff boolean? should we update stuff?
---@return integer num_taken the number of items taken, or `false` if no items were taken
function Chance:on_successful_take(item, take_stack, update_stuff) return 0 end


--- this function is called whenever `item` is taken not taken successfully
---@param item MQL.Item.Chance
---@param take_stack boolean are we taking the whole stack?
---@param update_stuff boolean? should we update stuff?
---@return integer num_taken the number of items taken, or `false` if no items were taken
function Chance:on_unsuccessful_take(item, take_stack, update_stuff) return 0 end

--- makes the lucky messagebox, if the config settings are appropriate
function Chance:make_lucky_msgbox()
    if config.UI.show_lucky_msg then
        tes3.messageBox "You got lucky."
    end
end


--- determine whether to take the full stack
---@param item MQL.Item.Chance the item to take
---@param modifier_pressed boolean? is the modifier key pressed?
---@return boolean take_stack should we take the whole stack?
function Chance:should_take_stack(item, modifier_pressed)

    if item.weight == 0 or item.count == 1 then return true end

    -- pull the `multiple_items` setting from the appropriate config file
    local mi    ---@type MQL.defns.mi_chance
    if modifier_pressed then
        mi = self.config.mi.mode_m ---@type MQL.defns.mi_chance
    else
        mi = self.config.mi.mode ---@type MQL.defns.mi_chance
    end

    if mi == defns.mi_chance.stack then
        return true
    elseif mi == defns.mi_chance.regular then
        return base.should_take_stack(self, item, modifier_pressed)
    end

    local chance = item:get_chance(true)

    if mi == defns.mi_chance.total_chance then
        return chance >= self.config.mi.min_chance


    -- if we do total chance and regular
    elseif mi == defns.mi_chance.total_chance_and_regular then
        return chance >= self.config.mi.min_chance and base.should_take_stack(self, item, modifier_pressed)
    end
    return false
end


--- do the crime
---@param crime_value integer value of the crime
---@param successful boolean? did we succeed in taking any/all items?
function Chance:do_crime(crime_value, successful)
    base.do_crime(self, crime_value)
end

--- takes the currently activated item. also checks if the item can be looted, and if we're currently in a menu.
---@param self MQL.Manager.Chance
---@param modifier_pressed boolean? is the modifier key pressed?
---@return boolean should_block `true` if we should block the event, `false` otherwise.
function Chance:take_item(modifier_pressed)
    if self.cant_loot ~= nil then return false end


    local item = self.items[self.index]
    if not item:can_take() then
        if item.status > defns.item_status.unavailable then
            item:make_unavailable_msgbox()
        end
        return true
    end
    
    -- past this point, we can loot normally. 
    
    local take_stack = self:should_take_stack(item, modifier_pressed)
    
    local chance = item:get_chance(take_stack)
    
    local num_taken
    local successful = true
    -- check if you succeed at taking the item
    if chance >= 1 or math.random() <= chance then 
        num_taken = self:on_successful_take(item, take_stack, true)

    -- if you fail, do a luck throw
    elseif self:luck_override(item) then
        self:make_lucky_msgbox()
        num_taken = self:on_successful_take(item, take_stack, true)
    else
        -- you failed and got unlucky, time to pay the price.
        num_taken = self:on_unsuccessful_take(item, take_stack, true)
        successful = false
    end

    if num_taken > 0 then
        if item.status == defns.item_status.empty then 
            self.num_items = self.num_items - 1
        end
        local item_value = item.value * num_taken
        self:award_xp(item_value, successful)
        self:do_crime(item_value, successful)
    end
    

    self.gui:update_item_name_label(self.index)
    self:update_index()
    self.inventory_outdated = true
    return true
end


function Chance:award_xp(item_value, take_successful) end

-- Takes all items from the current target.
---@param modifier_pressed boolean? is the modifier key pressed?
---@return boolean looted_successfully `true` if the container was looted successfully, false otherwise
function Chance:take_all_items(modifier_pressed)
    if self.cant_loot then return false end

    -- play the sound once

    local take_stack, chance, num_taken, take_successful
    local took_an_item = false
    for _, item in ipairs(self.items) do
        
        -- skip this item if it's minimum chance is too low.
        -- log:trace("checking if we should take %s", item)
        if not item:can_take() then goto next_item end

        take_stack = self:should_take_stack(item, modifier_pressed)

        chance = item:get_chance(take_stack)

        if chance < self.config.take_all_min_chance then goto next_item end

        -- check if you succeed at taking the item or got lucky (dont show messages when taking all)
        if chance >= 1 or math.random() <= chance or self:luck_override(item, take_stack) then 
            num_taken = self:on_successful_take(item, take_stack, false)
            take_successful = true
        else
            -- you failed and got unlucky, time to pay the price.
            num_taken = self:on_unsuccessful_take(item, take_stack, false)
            take_successful = false
        end

        if num_taken > 0 then
            took_an_item = true
            if item.count == 0 then
                self.num_items = self.num_items - 1
            end
            local item_value = item.value * num_taken
            self:award_xp(item_value, take_successful)
            self:do_crime(item_value, take_successful)
        end

        ::next_item::
    end

    if took_an_item then
        tes3.playSound{sound="Item Misc Up", reference = tes3.player}

        -- force the players inventory to update 
        self.inventory_outdated = false
        tes3ui.forcePlayerInventoryUpdate()

        -- update GUI and the current index
        self.gui:update_all_item_labels(true)
        if not self:update_index() then
            self.gui:update_visible_items(self.index)
        end
        self:make_take_all_msgbox()
    else
        self:none_taken_msgbox()
    end
    return true
end


return Chance