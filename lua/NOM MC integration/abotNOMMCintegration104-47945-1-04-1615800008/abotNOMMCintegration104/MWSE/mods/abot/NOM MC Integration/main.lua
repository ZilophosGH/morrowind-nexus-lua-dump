--[[
uses dragged ingredients and potions with NOM (and MC) /abot
]] --


local author = 'abot'
local modName = 'NOM MC Integration'
local modPrefix = author .. '/'.. modName


local ALCH = tes3.objectType.alchemy
local INGR = tes3.objectType.ingredient
local MISC = tes3.objectType.miscItem
local RESTORE_FATIGUE = tes3.effect.restoreFatigue
---local BOOK = tes3.objectType.book
local ARMORER_SKILL = tes3.skill.armorer

local eatSomething
local drinkSomething
local ab01anvilBuff -- flag saved to playerData in save()
local player -- set in loaded()

--[[
tes3.modStatistic(table)
description: Modifies a statistic on a given actor. This should be used instead of manually setting values on the game structures,
to ensure that events and GUI elements are properly handled. Either skill, attribute, or name must be provided.
Accepts parameters through a table with the given keys:
attribute: number The attribute to set Optional.
base: number If set, the base value will be modified. Optional.
current: number If set, the current value will be modified. Optional.
limit: boolean If set, the attribute won't rise above 100 or fall below 0.
name: string A generic name of an attribute to set. Optional
reference: tes3mobileActor|tes3reference|string)
skill: number The skill to set. Optional.
value: number If set, both the base and current value will be modified. Optional.
]]
local function addAnvilBuff()
	tes3.modStatistic({reference = player, skill = ARMORER_SKILL, current = 15})
	ab01anvilBuff = true
	tes3.playSound({ sound = 'restoration hit' })
	---tes3.messageBox("Using the anvil temporarily boosts your Armorer skill")
end

local function removeAnvilBuff()
	tes3.modStatistic({reference = player, skill = ARMORER_SKILL, current = -15})
	ab01anvilBuff = false
end

local function eat(value, obj)
	local v = tes3.getGlobal('hungry') -- Morrowind Crafting variable
	if v then
		if not (v == 0) then
			if v > 0 then
				v = v - 1
			elseif v < 0 then
				v = 0
			end
			---assert(tes3.setGlobal('hungry', v))
			tes3.setGlobal('hungry', v)
		end
	end
	v = tes3.getGlobal('NOM_hunger') -- getGlobal returns value
	if v then
		if v > -30 then
			v = v - value
			---assert(tes3.setGlobal('NOM_hunger', v))
			tes3.setGlobal('NOM_hunger', v)
			---assert(tes3.getGlobal('NOM_hunger') == v)
			tes3.playSound({ sound = 'fv_eat' })
			eatSomething = true
			tes3.messageBox("You eat some %s", obj.name)
		else
			---tes3.messageBox('You are not hungry')
			return
		end
		--[[
		local s
		if objType == INGR then
			s = 'INGR'
		else
			s = 'ALCH'
		end
		--]]
		---mwse.log('%s %s eat %s NOM_hunger = %s', modPrefix, s, objId, v)
		----mwse.log('%s INGR Swallow objId = %s effId = %s %s', modPrefix, objId, effId, table.find(tes3.effect, effId))
	end
end

local function drink(value, obj)
	local v = tes3.getGlobal('NOM_Thirst_v') -- getGlobal returns value
	if v > -30 then
		v = v - value
		---assert(tes3.setGlobal('NOM_Thirst_v', v))
		tes3.setGlobal('NOM_Thirst_v', v)
		---assert(tes3.getGlobal('NOM_Thirst_v') == v)
		tes3.playSound({ sound = 'NoM_Drink' })
		drinkSomething = true
		tes3.messageBox("You drink some %s", obj.name)
	else
		---tes3.messageBox('You are not thirsty')
		return
	end
	--[[
	local s
	if objType == INGR then
		s = 'INGR'
	else
		s = 'ALCH'
	end
	--]]
	---mwse.log('%s %s drink %s NOM_Thirst_v = %s', modPrefix, s, objId, v)
	return
end
local function equip(e)

	---assert(e)
	local ref = e.reference
	---assert(ref)
	if not (ref == player) then
		return
	end
	local obj = e.item
	---assert(obj)
	local objType = obj.objectType
	---assert(objType)
	if not obj.effects then
		return
	end
	local objId = obj.id

	local lcId = string.lower(objId)
	if objType == INGR then
		if string.multifind(lcId, {'bread', 'roast', 'food', 'cook', 'grilled', 'egg', 'dry', 'pie', 'comberry'}, 1, true) then
			eat(20, obj)
			return
		end

		local effId = obj.effects[1] -- first effect, for ingredients it's the index, not an object though
		if not effId then
			return
		end
		if not (effId == RESTORE_FATIGUE) then
			return
		end
		eat(20, obj)
		return
	end

	if objType == MISC then -- NOM water bottles
		mwse.log('%s MISC equipped', modPrefix)
		if string.find(lcId, "^nom_waterskin_%d") then
			mwscript.startScript({script = 'NOM_thirst'})
			mwse.log('%s drink calling NOM_thirst', modPrefix)
			return
		end
		if string.find(lcId, "^misc_com_bottle_%d%d_water") then
			mwscript.startScript({script = 'NOM_thirst_water'})
			mwse.log('%s drink calling NOM_thirst_water', modPrefix)
		end
		return
	end

	if not (objType == ALCH) then -- potions & beverages
		return
	end

	if lcId:startswith('mc_') then -- Morrowind Crafting potion = food
		eat(20, obj)
		return
	end
	if string.multifind(lcId, {'wine', 'liquor', 'mead', 'brew', 'brandy', 'whiskey'}, 1, true) then
		drink(10, obj)
		return
	end

	local eff = obj.effects[1] -- first effect is obj
	if not (eff.id == RESTORE_FATIGUE) then
		return
	end
	drink(20, obj)
end

local function menuExit()
	if eatSomething then
		eatSomething = false
		----assert(tes3.setGlobal('NoM_eatsth', 1))
		----assert(tes3.getGlobal('NoM_eatsth') == 1)
		tes3.setGlobal('NoM_eatsth', 1)
		mwscript.startScript({script = 'NoM_hunger_penalties'})
		----mwscript.startScript({script = 'NOM_config'}) -- just for debug, it works
		---mwse.log('%s eat calling NoM_hunger_penalties', modPrefix)
	end
	if drinkSomething then
		drinkSomething = false
		---assert(tes3.setGlobal('NoM_drinksth', 1))
		---assert(tes3.getGlobal('NoM_drinksth') == 1)
		tes3.setGlobal('NoM_drinksth', 1)
		mwscript.startScript({script = 'NOM_thirst_penalties'})
		mwse.log('%s drink calling NOM_thirst_penalties', modPrefix)
	end
end

local STATIC_TYPE = tes3.objectType.static
local ACTI_TYPE = tes3.objectType.activator
local LIGHT_TYPE = tes3.objectType.light

local NOM_well_waterScriptId = 'NOM_well_water' -- special script to interface Water Life with NOM setting its state to 20
local NoM_roastScriptId = 'NoM_roast'

-- things below set in initialized()
local iMaxActivateDist
local NOM_well_waterScript
local NoM_roastScript
local inputController

local function checkActivate()
	local eyePos = tes3.getPlayerEyePosition()
	local eyeDir = tes3.getPlayerEyeVector()

	---tes3.messageBox("keyDown")
	local results = tes3.rayTest({position = eyePos
		, direction = eyeDir, maxDistance = 2 * iMaxActivateDist
		, findAll = true, ignore = { player } })

	if not results then
		return
	end
	if #results < 1 then
		return
	end
	local result
	for _, v in pairs(results) do
		if v then
			if not (v.reference == player) then
				result = v
				break
			end
		end
	end
	if not result then
		return
	end
	local ref = result.reference
	if not ref then
		return
	end
	local obj = ref.object
	---assert(obj)

	local objType = obj.objectType

	local isStatic = objType == STATIC_TYPE
	local isActi = objType == ACTI_TYPE
	local isLight = objType == LIGHT_TYPE

	if not isStatic then
		if not isActi then
			if not isLight then
				return
			end
		end
	end

	local distance = eyePos:distance(result.intersection)
	---local id = ref.id
	---assert(id)
	----tes3.messageBox("distance = %s", distance)
	----mwse.log("%s looking at %s type distance %s", modPrefix, id, distance)

	if distance > iMaxActivateDist then
		----tes3.messageBox("%s distance = %s > %s", id, distance, iMaxActivateDist)
		---mwse.log("%s %s distance = %s > %s", modPrefix, id, distance, iMaxActivateDist)
		return
	end

	local mesh = obj.mesh
	---assert(mesh)
	local lcMesh = string.lower(mesh)

	--[[
	if not tes3.getPlayerTarget() then
		tes3.messageBox("target %s", obj.id)
		---mge.enableHUD('target')
		---timer.start({ duration = 2, callback = function () mge.disableHUD('target') end })
	end
	--]]

	if isStatic or isLight then
		if NoM_roastScript then
			if string.multifind(lcMesh, {'firepit', 'light_logpile', 'coals_hot'}, 1, true) then
				if not mwscript.scriptRunning(NoM_roastScriptId) then
					tes3.setGlobal('NoM_cooking_device', 2)
					tes3.setGlobal('NoM_cooking_x', ref.position.x)
					tes3.setGlobal('NoM_cooking_y', ref.position.y)
					local z = ref.position.z
					local bounds = ref.object.boundingBox
					if bounds then
						z = z - ref.scale * (bounds.max.z - bounds.min.z) / 4
					end
					tes3.setGlobal('NoM_cooking_z', z)

					tes3.setGlobal('NoM_cooking_scale', ref.scale)
					tes3.setGlobal('NoM_cooking_rot', ref.orientation.z)
					mwscript.startScript({reference = ref, script = NoM_roastScriptId})
					----tes3.messageBox("%s script started on %s", NoM_roastScriptId, id)
					---mwse.log("%s script started on %s", NoM_roastScriptId, id)
				end
				return
			end
		end
	end

	if NOM_well_waterScript then
		if not mwscript.scriptRunning(NOM_well_waterScriptId) then
			local ok = false
			if isStatic then
				if string.find(lcMesh, 'kegstand', 1, true) then
					ok = true
				end
			end
			if not ok then
				if string.multifind(lcMesh, {'well', '_water', 'water_'}, 1, true) then
					if isStatic then
						ok = true
					elseif isActi then
						local script = obj.script
						if not script then
							ok = true
						else
							local id = script.id:lower()
							if not (id == 'sound_water_spout') then
								if not string.find(id,'^nom_') then
									ok = true
								end
							end
						end
					end
				end
			end
			if ok then
				NOM_well_waterScript.context.state = 20
				mwscript.startScript({reference = ref, script = NOM_well_waterScriptId})
				---tes3.messageBox("%s script started on %s", NOM_well_waterScriptId, id)
				return
			end
		end
	end

	if isStatic then
		if string.find(lcMesh, 'anvil', 1, true) then
			-- 15 points armorer skill buff for 10 seconds
			if not ab01anvilBuff then
				addAnvilBuff()
				timer.start({ iterations = 1, duration = 10, callback = removeAnvilBuff})
			end
		end
	end

end

local activateKey = tes3.keybind.activate

local activated
local function activateKeyDown()
	if tes3.menuMode() then
		return
	end
	if inputController:keybindTest(activateKey) then
		activated = true
	end
end

local function activateKeyUp()
	if activated then
		activated = false
		timer.delayOneFrame(checkActivate)
	end
end

-- Automatically adds NOM/Morrowind Crafting ingredients to suitable killed creatures /abot

local crList = {}

local CREA = tes3.objectType.creature

local function initLootLists()
	local MC = tes3.getObject('mc_fish_raw')
	local NOM = tes3.getObject('NOM_food_guar_rib')
	local TR = tes3.getObject('T_IngFood_MeatAlit_01')
	if ( MC	or NOM or TR ) then
		if TR then
			crList['alit'] = {'T_IngFood_MeatAlit_01', 60}
			crList['boar'] = {'T_IngFood_MeatBoar_01', 60}
			crList['boar'] = {'T_IngFood_MeatBoar_02', 60}
			crList['guar'] = {'T_IngFood_MeatGuar_01', 60}
			crList['horker'] = {'T_IngFood_MeatHorker_01', 60}
			crList['kagouti'] = {'T_IngFood_MeatKagouti_01', 60}
			crList['kwama'] = {'T_IngFood_MeatKwama_01', 60}
			crList['molecrab'] = {'T_IngCrea_ShellMolecrab_02', 60}
			crList['ornada'] = {'T_IngFood_MeatOrnada_01', 60}
			crList['parastylus'] = {'T_IngFood_MeatParastylus_01', 60}
			crList['salmon'] = {'T_IngFood_FishSalmon_01', 60}
			crList['racer'] = {'T_IngFood_MeatCliffracer_01', 60}
			crList['troll'] = {'T_IngCrea_Trollfat_01', 60}
		end
		if MC then
			crList['guar'] = {'mc_guar_raw', 60}
			crList['kagouti'] = {'mc_kagouti_raw', 60}
			crList['netch'] = {'mc_netch_acid', 60}
			crList['racer'] = {'random_racer_plumes', 60}
			crList['slaughterfish'] = {'mc_fish_raw', 60}
		end
		if NOM then
			crList['alit'] = {'TR_Ingred_Meat_Alit', 60}
			crList['bear'] = {'ingred_bear_meat_SA', 60}
			crList['boar'] = {'TR_Ingred_Meat_Boar', 60}
			crList['chicken'] = {'NOM_food_chickenleg1', 60}
			crList['durzog'] = {'ingred_durzog_meat_01', 60}
			crList['guar'] = {'NOM_food_guar_rib', 60}
			crList['kagouti'] = {'TR_Ingred_Meat_Kagouti', 60}
			crList['kriin'] = {'plx_ingred_kriin_flesh', 60}
			crList['kwama'] = {'TR_Ingred_Meat_Kwama', 60}
			crList['molecrab'] = {'TR_Ingred_Egg_Molecrab', 60}
			crList['mouse'] = {'ingred_mouse_meat_MVA', 60}
			crList['nix-hound'] = {'ingred_hound_meat_01', 60}
			crList['ornada'] = {'TR_Ingred_Ornada_Meat', 60}
			crList['parastylus'] = {'TR_Ingred_Parastylus_Meat', 60}
			crList['scrib'] = {'ingred_scrib_jerky_01', 60}
			crList['racer'] = {'TR_Ingred_Meat_Cliffracer', 60}
			crList['wolf'] = {'ingred_wolf_meat_SA', 60}
		end
		---math.randomseed(os.time()) -- no more needed
	end
end

local function addIngredientTo(creaObj)
	local id = creaObj.id
	local name = creaObj.name
	id = string.lower(id) -- lowercase for matching
	if name then
		name = string.lower(name)
	end
	local inventory = creaObj.inventory
	if not inventory then
		mwse.log("%s CREA %s inventory = %s", modPrefix, id, inventory)
		return
	end
	local s, notWerewolf, notFalseRacer, ingredient, chanceNone
	for crKey, ingredients in pairs(crList) do
		---mwse.log("%s crKey %s ingredients %s", modPrefix, crKey, ingredients)
		s = false
		if id:find(crKey, 1, true) then
			s = id
		elseif name:find(crKey, 1, true) then
			s = name
		end
		if s then
			---mwse.log("%s CREA %s ingredients %s", modPrefix, s, ingredients)
			notWerewolf = not ( s:find('wolf', 1, true) and s:find('were', 1, true) )
			notFalseRacer = true
			if ( s:find('racer', 1, true) ) then
				notFalseRacer = s:find('cliff', 1, true)
			end
			----mwse.log("%s notWerewolf %s notFalseRacer %s", modPrefix, notWerewolf, notFalseRacer)
			if ( notWerewolf and notFalseRacer ) then
				ingredient = 'none'
				chanceNone = 1000
				for i, v in pairs(ingredients) do
					if i == 1 then
						ingredient = v
					else
						chanceNone = v
					end
				end
				---mwse.log("%s CREA %s ingredient %s chanceNone %s", modPrefix, s, ingredient, chanceNone)
				if ( math.random(100) > chanceNone ) then
					if ( tes3.getObject(ingredient) ) then
						if not inventory:contains(ingredient) then
							local qty = math.random(2) -- 1 <= qty <= 2 (integer)
							---mwscript.addItem({ reference = ref, item = ingredient, count = qty })
							mwse.log("%s/addIngredientTo %d %s added to %s", modPrefix, qty, ingredient, s)
						end -- if not inventory
					end --if ( tes3
				end --if ( math
			end --if ( notWerewolf
		end --if ( s:find
	end --for crKey
end

local function death(e)
	---assert(e)
	local ref = e.reference
	---assert(ref)
	if not ref then
		return
	end
	local obj = ref.object
	---assert(obj)
	if not obj then
		return
	end
	if not (obj.objectType == CREA) then
		return
	end
	local id = obj.id
	---assert(id)
	if not id then
		return
	end
	local name = obj.name
	---assert(name)
	if not name then
		return
	end
	local inventory = obj.inventory
	if not inventory then
		---mwse.log("%s CREA %s inventory = %s", modPrefix, id, inventory)
		return
	end
	addIngredientTo(obj)
end


--[[
	if ref.object.objectType == iBookType and ref:testActionFlag(tes3.actionFlag.useEnabled) then
		if not tes3.hasOwnershipAccess({ target = ref }) then
			tes3.messageBox('stole book %s', ref.object)
			tes3.triggerCrime{type = tes3.crimeType.theft, victim = ref.itemData.owner, value =ref.object.value}

			if ref.itemData and ref.itemData.owner then
				ref.itemData.owner = nil
			end
			tes3.addItem({ reference = tes3.player,	item = ref.object, itemData = ref.itemData,	count = itemData and itemData.count or 1 })
			ref.itemData = nil
			ref:disable()
			mwscript.setDelete({ reference = ref, delete = true })
			return false
		end
--]]

local function loaded()
	if NOM_well_waterScript then
		mwscript.stopScript({script = NOM_well_waterScriptId})
	end
	if NoM_roastScript then
		mwscript.stopScript({script = NoM_roastScriptId})
	end
	player = tes3.player
	local playerData = player.data
	if not playerData then
		return
	end
	if playerData.ab01anvilBuff then
		removeAnvilBuff()
	end
end

local function save()
	local playerData = player.data
	if not playerData then
		return
	end
	if ab01anvilBuff then
		playerData.ab01anvilBuff = true
	end
end

--[[
local function testIngredients()
	for creaObj in tes3.iterateObjects(CREA) do
		addIngredientTo(creaObj)
	end
end
--]]

local function initialized()
	if tes3.getGlobal('NOM_hunger') then -- getGlobal returns value
		if tes3.getGlobal('NOM_thirst_v') then
			event.register('equip', equip)
			event.register('menuExit', menuExit)
			mwse.log('%s, NOM detected', modPrefix)
		end
	end
	iMaxActivateDist = tes3.findGMST(tes3.gmst.iMaxActivateDist).value * 1.3
	---local activateKey2
	---local activateKey = tes3.scanCode.e
	inputController = tes3.worldController.inputController
	---activateKey2 = tes3.getInputBinding(tes3.keybind.activate).keyCode
	--- assert(activateKey == activateKey2)
	if tes3.getScript('ab01wlgOnLoadScript') then
		mwse.log('%s, Water Life detected', modPrefix)
		NOM_well_waterScript = tes3.getScript(NOM_well_waterScriptId)
		if NOM_well_waterScript then
			mwscript.stopScript({script = NOM_well_waterScriptId})
		end
		local slowMoAnimFix = tes3.hasCodePatchFeature(101) -- Allows actors with very slow walk animations (<1 unit/sec) to load without causing animation errors
		if slowMoAnimFix then
			local ab01DontSpawnWarnAnim = tes3.getGlobal('ab01DontSpawnWarnAnim')
			if ab01DontSpawnWarnAnim then
				if ab01DontSpawnWarnAnim > 0 then
					tes3.setGlobal('ab01DontSpawnWarnAnim', 0) -- enable water life snail spawning if MCP fix is enabled
					mwse.log("%s, Morrowind Code Patch slowMoAnimFix detected tes3.hasCodePatchFeature(101)", modPrefix)
					mwse.log("%s, ab01DontSpawnWarnAnim set to 0 (Water Life snail spawning enabled)", modPrefix)
				---else
					---mwse.log("%s, ab01DontSpawnWarnAnim == 0 (Water Life snail spawning already enabled)", modPrefix)
				end
			end
		end
	end
	NoM_roastScript = tes3.getScript(NoM_roastScriptId)
	if NoM_roastScript then
		mwse.log('%s, NOM %s script detected', modPrefix, NoM_roastScriptId)
	end
	if NOM_well_waterScript
	or NoM_roastScript then
		event.register('keyDown', activateKeyDown)
		event.register('keyUp', activateKeyUp)
	end
	initLootLists()
	event.register('death', death)
	event.register('loaded', loaded)
	event.register('save', save)
	mwse.log('%s initialized', modPrefix)

	--- testIngredients()

end
event.register('initialized', initialized)

--[[
local function orFind(haystack, needles)
-- e.g. orFind('the Quick brown foX','foX|qUick|Brown') -> fox
	-- lowercase all as matches are case sensitive
	haystack = string.lower(haystack)
	needles = string.lower(needles)

	local a = string.gmatch(needles, '([^|]+)')
	if not a then
		return nil
	end
	local result
	for needle in a do
		result = string.match(haystack, needle)
		if result then
			return result
		end
	end
	return nil
end
--]]
