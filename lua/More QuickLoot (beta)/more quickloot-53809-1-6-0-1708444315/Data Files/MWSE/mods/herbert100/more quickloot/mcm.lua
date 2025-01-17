local defns = require("herbert100.more quickloot.defns")
local log = require("herbert100.Logger")("More QuickLoot/MCM") ---@type herbert.Logger
local config = require("herbert100.more quickloot.config") ---@type MQL.config
local i18n = mwse.loadTranslations("herbert100.more quickloot")


local mcm = { update = function() end, }

-- take from the original QuickLoot mod, and very slightly altered
local function get_containers()
    local added = {}
    for obj in tes3.iterateObjects(tes3.objectType.container) do
        ---@diagnostic disable-next-line: undefined-field
        if obj.script ~= nil then
            added[obj.id:lower()] = true
        end
    end
    return table.keys(added, function(a, b) return a:lower() < b:lower() end)
end

local DistanceSlider



-- run while you still can. it's all downhill from here

---@enum MQL.MCM.type
local mt = {
    btn = 1,
    slider = 2,
    dslider = 3,
    dropdown = 4,
    keybind = 5,
    cb_btn = 6,
    textfield = 7,
    page = 8,
    blpage = 9,
    category = 10,
    dist_slider = 11,
    cycle_btn = 12,
}

-- the type of component to add. 
-- -@alias MQL.MCM.type
---|`mt.btn`        button
---|`mt.slider`     slider
---|`mt.dslider`    decimal slider
---|`mt.dropdown`   dropdown settings. the options can be given either directly, or via the `options` key.
---|`mt.keybind`   
---|`mt.cb_btn`     callback button
---|`mt.textfield`       textfield
---|`mt.page`       
---|`mt.blpage`        blacklist page
---|`mt.category`   

-- an entry in the `layout` that we're going to define below
---@class MQL.MCM.entry : {[integer]: MQL.MCM.entry}
---@field id string
---@field add_log boolean?
---@field type MQL.MCM.type the type of mcm component this is
---@field config table?     the config table to use for this entry and all child entries
---@field config_key string?    the key that holds the config setting. defaults to `id` if not provided
---@field leftListLabel string?
---@field rightListLabel string?
---@field filters table?
---@field allowCombinations boolean?
---@field callback fun(self:mwseMCMSetting)?
---@field converter nil|fun(new_value:unknown):unknown converter for variable
---@field min integer?
---@field max integer?
---@field step integer?
---@field jump integer?
---@field buttonText string?
---@field numbersOnly boolean?
---@field allowMouse boolean?
---@field dp integer? decimal places
---@field options {[integer]: mwseMCMDropdownOption|tes3uiCycleButtonOption|{[1]: string, [2]:string|integer|boolean}}


---@class MQL.MCM.dropdown_entry : MQL.MCM.entry, {[integer] : (mwseMCMDropdownOption|{[1]: string, [2]: any})}



-- these tables are used by multiple settings, so they're defined up here
local mi_options = {
    {"1) Always take 1.", defns.mi.one },
    {"2) Always take Stack.", defns.mi.stack },
    {"3) Decide by gold/weight ratio.", defns.mi.ratio },
    {"4) Decide by total weight.", defns.mi.total_weight },
    {"5) Decide by total weight AND gold/weight ratio.", defns.mi.ratio_and_total_weight },
    {"6) Decide by total weight OR gold/weight ratio.", defns.mi.ratio_or_total_weight },
}
local mi_chance_options = {
    {"1) Always take 1.", defns.mi_chance.one },
    {"2) always take stack.", defns.mi_chance.stack },
    {"3) Decide by total chance.", defns.mi_chance.total_chance },
    {"4) Decide using settings for Regular containers.", defns.mi_chance.regular },
    {"5) Decide by total chance AND Regular container setting.", defns.mi_chance.total_chance_and_regular },
}
local default = require("herbert100.more quickloot.config.default")

---@param default_value mwseKeyMouseCombo
local function make_mousekey_converter(default_value)
    ---@param value mwseKeyMouseCombo
    return function(value)

        if value.mouseWheel then 
            tes3.messageBox("[More QuickLoot] Error: You can't bind this to the mousewheel.")
            return table.copy(default_value)
        end
        return value
    end
end

---@param default_value mwseKeyMouseCombo
local function make_mousekey_callback(default_value)
    ---@param self mwseMCMKeyBinder
    return function(self)
        if self.variable.value.mouseWheel then 
            tes3.messageBox("[More QuickLoot] Error: You can't bind this to the mousewheel.")
            table.copy(default_value, self.variable.value)
        end
    end
end

-- this is the layout of the MCM. it will be built into the ingame MCM via the `build` function.
-- the `config` key indicates that all subentries of a page/category should use that config when calling `createTableVariable`
-- the labels and descriptions can be found in the `i18n` file. (its structure exactly matches the MCM layout)
-- the `id` key corresponds to both the key in the `config` table as well as the key to call `i18n` with
---@type MQL.MCM.entry[]
local layout = {
    -- =========================================================================
    -- MAIN PAGE
    -- =========================================================================
    {id="main", type=mt.page, add_log = true,
        { id="show_scripted", type=mt.dropdown, options={
            {"1) Disable QuickLoot for scripted containers",            defns.show_scripted.dont},
            {"2) Enable QuickLoot, but prefix container names.",        defns.show_scripted.prefix},
            {"3) Enable QuickLoot, and don't prefix container names.",  defns.show_scripted.no_prefix},
        }},
        { id = "take_nearby", type=mt.category,
            { id = "take_nearby_dist",          type=mt.dist_slider,  min=0, max=22.1*40, step=22.1, dp=1,},
            { id = "take_nearby_allow_theft",   type=mt.btn},
        },
        
        { id = "keys", type=mt.category, config=config.keys,
            { id = "use_activate_btn",  type=mt.btn,},
            { id = "custom",            type=mt.keybind, allowCombinations=false, allowMouse=true,
                converter=make_mousekey_converter(default.keys.custom),
                callback=make_mousekey_callback(default.keys.custom),
            },
            { id = "take_all",          type=mt.keybind, allowCombinations=false, allowMouse=true,
                converter=make_mousekey_converter(default.keys.take_all),
                callback=make_mousekey_callback(default.keys.take_all),
            },
            { id = "modifier",          type=mt.keybind, allowCombinations=false},
            { id = "undo",              type=mt.keybind, allowCombinations=true},
        },
        -- blacklist settings on the main page
        { id = "blacklist", type=mt.category,
            { id="reset_containers", type=mt.cb_btn, buttonText="Reset",
                callback=function() 
                    table.empty(config.blacklist.containers)
                    table.copy(default.blacklist.containers, config.blacklist.containers)
                end
            },
            { id="import_organic", type=mt.cb_btn, buttonText="Import",
                callback=function() 
                    table.copy(config.blacklist.organic, config.blacklist.containers) 
                end,
            },
            { id="reset_organic", type=mt.cb_btn, buttonText="Reset",
                callback=function() 
                    table.empty(config.blacklist.organic)
                    table.copy(default.blacklist.organic, config.blacklist.organic)
                end
            },
            { id="import_containers", type=mt.cb_btn, buttonText= "Import",
                callback = function () 
                    table.copy(config.blacklist.containers, config.blacklist.organic) 
                end
            },
        },

    },
    -- =========================================================================
    -- UI PAGE
    -- =========================================================================
    { id="UI", type=mt.page, config=config.UI, 
        { id="size_and_positioning", type=mt.category,
            { id="menu_x_pos", type=mt.pslider},
            { id="menu_y_pos", type=mt.pslider},
        },

        {id="misc", type=mt.category,
            {id="show_tooltips",        type=mt.dropdown, options={
                {"Don't show tooltips", defns.show_tooltips.dont},
                {"Show item tooltips", defns.show_tooltips.item},
                {"Show container tooltips", defns.show_tooltips.container},
            }},
            {id="show_msgbox",          type=mt.btn},
            {id="play_switch_sounds",   type=mt.dropdown, options = {
                -- {"Default menu sound", "Fx\\menu_click.wav"},
                -- {"Page turned", "Fx\\item\\bookpag1.wav"},
                {"Default menu sound", "menu click"},
                {"Page turned", "book page"},
                {"None", false},
            }, callback=function(self)
                local sound = self.variable and self.variable.value
                log("in %q callback with sound = %q", self.variable and self.variable.id, sound)
                if sound and sound ~= "menu click" then 
                    timer.start{duration=0.1, type=timer.real, callback=function() tes3.playSound{sound=sound} end} 
                end
            end},
            {id="show_lucky_msg",       type=mt.btn},
            {id="sort_items",           type=mt.dropdown, options={
                {"Don't sort items", defns.sort_items.dont}, 
                {"Sort by item value/weight ratio",   defns.sort_items.value_weight_ratio}, 
                {"Sort by item value", defns.sort_items.value}, 
                {"Sort by item weight", defns.sort_items.weight}, 
            }},
            {id="sort_by_obj_type",     type=mt.btn},
            {id="update_inv_on_close",  type=mt.btn},
        },

        { id="toggle", type=mt.category,
            {id="show_name",               type=mt.btn},
            {id="show_controls",           type=mt.btn},
            {id="show_modified_controls",  type=mt.btn},
            {id="enable_status_bar",       type=mt.btn},
        },
        -- make `ttip` settings visible only when the mod is installed
        config.compat.ttip and 
        {id="ttip", type=mt.category,
            {id="ttip_collected_str",      type=mt.textfield},
            {id="ttip_mark_selected",      type=mt.btn},
        } or nil,
    },
    -- =========================================================================
    -- REGULAR CONTAINERS PAGE
    -- =========================================================================
    { id = "reg", type=mt.page, config=config.reg,
        { id="sn_dist",     type=mt.dist_slider,  min=0, max=22.1*40, step=22.1, dp=1,},
        { id="take_all_min_ratio",      type=mt.dslider,    min=0, max=50,dp=1, step=0.2, jump=1,},

        { id = "mi", type=mt.category, config=config.reg.mi,
            {id="mode",       type=mt.dropdown,   options = mi_options},
            {id="mode_m",     type=mt.dropdown,    options = mi_options},
            {id="inv_take_all",      type=mt.btn     },
            -- {id="min_value",             type=mt.dslider,    dp=1, max=100, step=1, jump=5,},
            {id="min_ratio",             type=mt.dslider,    dp=1, max=100, step=1, jump=5,},
            {id="max_total_weight",           type=mt.dslider,    dp=1, max=150, step=1, jump=5,},
        },
        
        -- ---------------------------------------------------------------------
        -- DEAD SETTINGS
        -- ---------------------------------------------------------------------
        {id = "dead",      type=mt.category, config=config.dead,
            {id="enable",   type=mt.btn},
            {id="dispose",  type=mt.dropdown, options={
                {"1) Don't do anything", defns.dispose.none},
                {"2) Use 'Take All' to dispose of empty creatures.", defns.dispose.take_all},
                {"3) Dispose dead creatures on sight.", defns.dispose.on_sight},
            }},
        },
        -- ---------------------------------------------------------------------
        -- INANIMATE SETTINGS
        -- ---------------------------------------------------------------------
        {id="inanimate", type=mt.category, config=config.inanimate,
            {id="enable", type=mt.btn},
            {id="ac", type=mt.category, config=config.inanimate.ac,
                {id="open", type=mt.dropdown, options={
                    {"Never", defns.misc.ac.open.never},
                    {"After taking an item", defns.misc.ac.open.item_taken},
                    {"When the menu appears", defns.misc.ac.open.on_sight},
                }},
                {id="close", type=mt.dropdown, options={
                    {"Never play close animations", defns.misc.ac.close.never},
                    {"Use Animated Containers settings", defns.misc.ac.close.use_ac_cfg},
                    {"Always play close animations", defns.misc.ac.close.always},
                }},
                {id="open_empty_on_sight", type=mt.btn},
                {id="auto_close_if_empty", type=mt.btn},
        
            },
            {id="placing", type=mt.category, config=config.inanimate.placing,
                {id="reverse_sort",         type=mt.btn},
                {id="allow_books",          type=mt.btn},
                {id="allow_ingredients",    type=mt.btn},
                {id="min_weight",           type=mt.dslider,dp=1,max=20},
            },
            {id="locked_or_trapped", type=mt.category, 
                {id="show_locked",                 type=mt.btn, },
                {id="show_locked_min_security",    type=mt.slider },
                {id="show_trapped",                type=mt.btn,},
                {id="show_trapped_min_security",   type=mt.slider},
            },
        },
    },
    -- =========================================================================
    -- ORGANIC PAGE
    -- =========================================================================
    {id = "organic", type=mt.page, config=config.organic,
        {id = "enable", type=mt.btn},
        -- ---------------------------------------------------------------------
        -- VISUAL/COMPATIBILITY SETTINGS
        -- ---------------------------------------------------------------------
        {id="visual", type=mt.category,
            {id="change_plants", type=mt.dropdown, 
                options={
                    {"1) Don't change plants", defns.change_plants.none}, 
                    {"2) Use Graphic Herbalism", defns.change_plants.gh}, 
                    {"3) Destroy plants", defns.change_plants.destroy},
                },
                callback=function (self)
                    if config.compat.gh_current < defns.misc.gh.installed then
                        tes3.messageBox("Error: Graphic Herbalism must be installed. Resetting to default value.")
                        self.variable.value = defns.change_plants.none
                    end
                end,
            },

            {id="not_plants_src", type=mt.dropdown, 
                options={
                    {"1) All organic containers are plants", defns.not_plants_src.everything_plant}, 
                    {"2) Use \"Plants Blacklist\"", defns.not_plants_src.plant_list}, 
                    {"3) Use Graphic Herbalism blacklist", defns.not_plants_src.gh},
                },
                callback= function (self)
                    -- if graphic herbalism is currently installed, or if graphic herbalism has never been installed
                    if config.compat.gh_current < defns.misc.gh.previously then
                        tes3.messageBox("Error: Graphic Herbalism has never been installed. Resetting to default value.")
                        self.variable.value = defns.not_plants_src.plant_list
                    end
                end,
            },
            {id = "hide_on_empty", type=mt.btn},
        },

        {id = "mi",        type=mt.category, config=config.organic.mi,
            {id="mode",      type=mt.dropdown, options=mi_chance_options}, 
            {id="mode_m",    type=mt.dropdown, options=mi_chance_options},
            {id="inv_take_all",     type=mt.btn},
            {id="min_chance",           type=mt.pslider},
        },
        {id="xp", type=mt.category, config=config.organic.xp,
            {id="award",            type=mt.btn}, 
            {id="on_failure",       type=mt.btn, },
            {id="max_lvl",          type=mt.slider },
        },

        {id = "misc", type=mt.category,

            {id="sn_cf",     type=mt.dropdown, options={
                {"Same plants", defns.sn_cf.same_base_obj}, 
                {"All plants", defns.sn_cf.organic}, 
            }},
            {id="sn_dist",   type=mt.dist_slider,  min=0, max=22.1*40, step=22.1, dp=1,},

            {id="show_failure_msg",     type=mt.btn},
            
            {id="show_chances", type=mt.dropdown, options={
                {"Never show chances", defns.ui_show_chances.never}, 
                {"Decide based on Alchemy level", defns.ui_show_chances.lvl}, 
                {"Always show chances", defns.ui_show_chances.always}
            }},
            {id="show_chances_lvl", type=mt.slider, },
            {id="show_chances_100", type=mt.btn, },
            
            {id="take_all_min_chance", type=mt.pslider},
            {id = "chance_mult",       type=mt.pslider, dp=2,max=5,min=0.1,},
            {id = "min_chance",        type=mt.pslider},
            {id = "max_chance",        type=mt.pslider},
        },

    },
    -- =========================================================================
    -- PICKPOCKET PAGE
    -- =========================================================================
    {id="pickpocket", type=mt.page, config=config.pickpocket,
        {id="enable", type=mt.btn},

        {id = "mi",        type=mt.category, config=config.pickpocket.mi,
            {id="mode",      type=mt.dropdown, options=mi_chance_options}, 
            {id="mode_m",    type=mt.dropdown, options=mi_chance_options},
            {id="inv_take_all",     type=mt.btn},
            {id="min_chance",           type=mt.pslider},
        },

        -- -----------------------------------------------------------------
        -- EQUIPPED ITEM SETTINGS
        -- -----------------------------------------------------------------
        {id = "equipped", type=mt.category, config = config.pickpocket.equipped,
            {id="weapons",         type=mt.btn },
            {id="armor",           type=mt.btn },
            {id="clothing",        type=mt.btn },
            {id="jewelry",         type=mt.btn },
            {id="accessories",     type=mt.btn },
            {id="show",            type=mt.btn },
        },

        {id = "misc",                   type=mt.category,
            {id="take_all_min_chance",      type=mt.pslider},

            {id="show_chances", type=mt.dropdown, options={
                {"Never show chances", defns.ui_show_chances.never}, 
                {"Decide based on Security level", defns.ui_show_chances.lvl}, 
                {"Always show chances", defns.ui_show_chances.always}
            }},
            {id="show_chances_lvl", type=mt.slider, },
            {id="show_chances_100", type=mt.btn, },
            {id="determinism", type=mt.btn, },
            {id="determinism_cutoff", type=mt.pslider,min=0.5, },
            
            
            
            {id="chance_mult",          type=mt.pslider, dp=1,max=5, min=0.1 },
            {id="min_chance",           type=mt.pslider,          },
            {id="max_chance",           type=mt.pslider,          },

            {id="show_detection_status", type=mt.btn                         },

            {id="detection_mult",             type=mt.pslider,  dp=1,max=5,min=0.1},
            {id="trigger_crime_undetected",   type=mt.btn                         },
        },
    },
    -- =========================================================================
    -- SERVICES PAGE
    -- =========================================================================
    {id = "services", type=mt.page, config=config.services,
        {id = "enable",                 type=mt.btn},
        {id="allow_skooma",             type=mt.btn},
        {id="default_service",          type=mt.dropdown, options={
            {'1) Barter', defns.services.barter}, 
            {'2) Training', defns.services.training}, 
        }},

        {id="training",                 type=mt.category, config=config.training,
            {id = "enable",             type=mt.btn},
            {id = "max_lvl_is_weight",  type=mt.btn},
        },

        {id="barter", type=mt.category, config=config.barter,
            {id = "enable",         type=mt.btn},
            {id="start_buying",     type=mt.dropdown, options={
                {'1) Start in "Buy" mode', true}, 
                {'2) Start in "Sell" mode', false}
            }},
            {id="switch_if_empty",  type=mt.btn,},

    
            {id="award_xp",     type=mt.btn, converter=function(new_value) return new_value and config.compat.bxp end },

            {id="selling", type=mt.category, config=config.barter.selling,
                {id="reverse_sort",         type=mt.btn},
                {id="allow_books",          type=mt.btn},
                {id="allow_ingredients",    type=mt.btn},
                {id="min_weight",           type=mt.dslider,dp=1,max=20},
            },
            -- -----------------------------------------------------------------
            -- EQUIPPED ITEM SETTINGS
            -- -----------------------------------------------------------------
            {id = "equipped", type=mt.category, config = config.barter.equipped,
                {id="weapons",         type=mt.btn },
                {id="armor",           type=mt.btn },
                {id="clothing",        type=mt.btn },
                {id="jewelry",         type=mt.btn },
                {id="accessories",     type=mt.btn },
                {id="show",            type=mt.btn },
            },
        },
    },

    {id = "blacklist_containers",    type=mt.blpage, config=config.blacklist, config_key="containers", leftListLabel = "Blacklist", rightListLabel = "Containers", filters = { {label="Containers", callback = get_containers}, }, },
    {id = "blacklist_organic",       type=mt.blpage, config=config.blacklist, config_key="organic",    leftListLabel = "Blacklist", rightListLabel = "Containers", filters = { {label="Containers", callback = get_containers}, }, },
 
    {id="advanced", type=mt.page, config=config.advanced,
        {id="v_dist", type=mt.dist_slider,  min=22.1, max=22.1*40, step=22.1, dp=1,},
        {id="compat", type=mt.category,
            {id="sw_claim",                     type=mt.btn,                        },
            {id="sw_priority",                  type=mt.textfield, numbersOnly=true,},
            {id="ak_claim",                     type=mt.btn,                        },
            {id="ak_priority",                  type=mt.textfield, numbersOnly=true,},
            {id="keydown_priority",              type=mt.textfield, numbersOnly=true,},
            {id="mousedown_priority",            type=mt.textfield, numbersOnly=true,},
            
            {id="activate_event_priority",            type=mt.textfield, numbersOnly=true,},
            {id="menu_entered_priority",        type=mt.textfield, numbersOnly=true,},
            {id="load_priority",                type=mt.textfield, numbersOnly=true,},
            {id="simulate_priority",            type=mt.textfield, numbersOnly=true,},
            {id="dialogue_filtered_priority",   type=mt.textfield, numbersOnly=true,},

            {id="reset",                        type=mt.cb_btn,  buttonText="Reset",
                callback=function ()
                    table.copy(require("herbert100.more quickloot.config.default").advanced, config.advanced)
                    tes3.messageBox "Settings reset. You will have to restart the game for these changes to take effect."
                end
            },
        }
    },
}
---@class MQL.MCM.build_params
---@field parent mwseMCMPage|mwseMCMSideBarPage|mwseMCMCategory|mwseMCMTemplate the parent component to make this page/category/setting inside of
---@field parent_config table? the config table used by the parent element
---@field i18n_prefix string the prefix we should use when calling `i18n` to get the label and description
---@field entry MQL.MCM.entry the entry layout we're currently building

-- recursively build the MCM, starting with pages, then doing categories, then doing settings
-- you can honestly ignore this function for now. the useful information is in `layout` and in the `i18n` file(s).
---@param p MQL.MCM.build_params
local function build(p)
    local e = p.entry
    local prefix = string.format("%s.%s", p.i18n_prefix,e.id) -- used to get the label/desc from `i18n`. also passed to children
    local lbl = i18n(string.format("%s.label", prefix, e.id))
    local desc = i18n(string.format("%s.description", prefix, e.id))

    -- config to use when making new variables. first we try the entry's config, then we try the parent config, and finally we default to `config`
    local cfg = e.config or p.parent_config or config -- use entry config or parameter config

    -- if it's a page or a category, we should create the page/category and then build all the child elements
    if e.type == mt.page or e.type == mt.category then
        local parent
        if e.type == mt.page then
            parent = p.parent:createSideBarPage{label=lbl,description=desc}
        else
            parent = p.parent:createCategory{label=lbl, description=desc}
        end

        

        for _, child_entry in ipairs(e) do
            build{entry=child_entry,i18n_prefix=prefix,parent=parent,parent_config=cfg}
        end
        if e.add_log then log:add_to_MCM(parent,config) end
    else
        -- we know it's an actual setting, so we'll make the variable now
        local v = mwse.mcm.createTableVariable{id = e.config_key or e.id,table = cfg, converter = e.converter}
        local par = p.parent
        if e.type == mt.blpage then
            par:createExclusionsPage{ label = lbl, description = desc, variable=v, filters = e.filters,
                leftListLabel = e.leftListLabel, rightListLabel = e.rightListLabel, 
            }
        elseif e.type == mt.btn then
            par:createYesNoButton{label=lbl,description=desc,variable=v,callback=e.callback}
        
        elseif e.type == mt.slider then
            par:createSlider{label=lbl, description=desc, variable=v, callback=e.callback,
                jump=e.jump,step=e.step,min=e.min, max=e.max, e.dp
            }
        elseif e.type == mt.dslider then
            par:createDecimalSlider{ label=lbl, description=desc, variable=v, callback=e.callback,
                jump=e.jump,step=e.step,min=e.min, max=e.max, decimalPlaces=e.dp,
            }
        elseif e.type == mt.pslider then
            par:createPercentageSlider{ label=lbl, description=desc, variable=v, callback=e.callback,
                jump=e.jump,step=e.step,min=e.min, max=e.max, decimalPlaces=e.dp,
            }
        elseif e.type == mt.dist_slider then
            table.insert(par.components, DistanceSlider:new{label=lbl, description=desc, variable=v, callback=e.callback,
                jump=e.jump, step=e.step, min=e.min, max=e.max, decimalPlaces=e.dp,
                parentComponent=par,
            })
        elseif e.type == mt.keybind then
            par:createKeyBinder{label=lbl, description=desc, variable=v,
                callback=e.callback, allowCombinations=e.allowCombinations, 
                allowMouse=e.allowMouse
            }
        elseif e.type == mt.cycle_btn then
            local options = table.map(e.options or e, function (_, o) return {text = o[1], value=o[2]} end)
            par:createCycleButton{label=lbl,description=desc,variable=v, callback=e.callback, options=options}
        elseif e.type == mt.dropdown then
            -- options are passed as arrays, but MCM wants associative tables
            local options = table.map(e.options or e, function (_, o) return {label = o[1], value=o[2]} end)
            par:createDropdown{label=lbl, description=desc, variable=v, callback=e.callback, options=options }
        elseif e.type == mt.cb_btn then 
            par:createButton{label=lbl, description=desc, callback=e.callback, buttonText=e.buttonText }
        elseif e.type ==mt.textfield then
            v.converter = v.converter or e.numbersOnly and tonumber or nil -- `numbersOnly` textfields should convert entries to numbers
            par:createTextField{label=lbl, description=desc, variable=v, callback=e.callback, numbersOnly=e.numbersOnly, }
        end
        
    end
end
local keywords = table.concat(
    {"pickpocket", "organic", "barter", "training", "services", "take all", "more", "quickloot", "animated", "regular", "container", },
    " "
)
function mcm.register()

    --- slider that handles properly formatting distances
    -- an alternative does not exist in mcm at the time of writing this code
    -- maybe one will be added later though
    DistanceSlider = require("mcm.components.settings.Slider"):new() ---@type mwseMCMSlider

    ---@diagnostic disable-next-line: duplicate-set-field
    function DistanceSlider:updateValueLabel()
        
        local feet = self.variable.value / 22.1
        local meters = 0.3048 * feet

        -- table.concat{"%.", self.decimalPlaces+2, "f ft (%.", self.decimalPlaces + 3, "f m)"},
        local label_value = string.format("%.1f ft (%.2f m)", feet, meters)

        if string.find(self.label, "%s", nil, true) then
            self.elements.label.text = self.label:format(label_value)
        else
            self.elements.label.text = table.concat({self.label, label_value}, ": ")
        end
    end

    local template = mwse.mcm.createTemplate {name = "More QuickLoot",
        onSearch=function (searchText)
            return string.find(keywords, searchText, nil, true) ~= nil
        end}
    template.onClose = function()
        mcm.update()
        mwse.saveConfig("More QuickLoot", config, defns.misc.json_options)
    end
    -- build each page
    for _, entry in ipairs(layout) do
        build{entry=entry, i18n_prefix="mcm", id=nil, parent=template, parent_config=config}
    end
    template:register()
end
return mcm