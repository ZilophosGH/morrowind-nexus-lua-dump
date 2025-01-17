
local confPath = "alterationMove_config"
local configDefault = {
	toggleMode = false,
	magickaCost = 3,
	levelreq = 30,
	allowAirJump = true,
	airJumpCost = 10,
	airJumpMultiplier = 15,
	enableJumpVfx = true,
	enableSounds = true
}

local config = mwse.loadConfig(confPath, configDefault)
local levState = 0
local sfState = 0
local levTimer

if not config then
    config = { blocked = {} }
end

local function playAlterationHit()

	if ( config.enableSounds ) then
		tes3.playSound({ sound = "alteration hit"})
	end
	
end

local function playAlterationFail()

	if ( config.enableSounds ) then
		tes3.playSound({ sound = "Spell Failure Alteration"})
	end	
	
end
local function endEffects()
	tes3.removeSpell({ reference = tes3.player, spell = "lack_am_levitate1" })
	tes3.removeSpell({ reference = tes3.player, spell = "lack_am_slowfall1" })
	levState = 0
	sfState = 0
	playAlterationFail()
	
	if ( levTimer ) then
		levTimer:pause()
	end
end

local function magTimer()
	if ( levState == 1 or sfState == 1 ) then
		if ( tes3.mobilePlayer.magicka.current < config.magickaCost ) then
			endEffects()
		else
			tes3.modStatistic({
				reference = tes3.mobilePlayer,
				name = "magicka",
				current = -config.magickaCost,
				limitToBase = true
			})
			tes3.mobilePlayer:exerciseSkill(11, .02)
		end
	end
end

local function tryStartLevitate()

	if ( tes3.mobilePlayer and ( tes3.mobilePlayer.isFalling or tes3.mobilePlayer.isJumping ) and tes3.mobilePlayer.alteration.current >= config.levelreq and levState == 0 ) then
		if ( tes3.mobilePlayer.magicka.current < config.magickaCost ) then
			playAlterationFail()		
			return
		end
		levState = 1
		tes3.addSpell({ reference = tes3.player, spell = "lack_am_levitate1" })
		
		if ( levTimer == nil ) then 
			levTimer = timer.start({ duration = 1, callback = magTimer, type = timer.simulate, iterations = -1 })
		else 
			levTimer:resume()
		end
		
		playAlterationHit()
	end
	
end

local function tryStartSlowfall()

	if ( tes3.mobilePlayer and ( tes3.mobilePlayer.isFalling or tes3.mobilePlayer.isJumping ) and tes3.mobilePlayer.alteration.current >= config.levelreq and sfState == 0 ) then
		if ( tes3.mobilePlayer.magicka.current < config.magickaCost ) then
			playAlterationFail()
			return
		end
		sfState = 1
		tes3.addSpell({ reference = tes3.player, spell = "lack_am_slowfall1" })
		
		if ( levTimer == nil ) then 
			levTimer = timer.start({ duration = 1, callback = magTimer, type = timer.simulate, iterations = -1 })
		else 
			levTimer:resume()
		end
		
		playAlterationHit()
	end
	
end

local function tryAirJump()

	if ( tes3.mobilePlayer.isFalling or tes3.mobilePlayer.isJumping ) then
		if ( tes3.mobilePlayer and tes3.mobilePlayer.alteration.current >= config.levelreq and tes3.mobilePlayer.magicka.current >= config.airJumpCost ) then
			
			local x = tes3.mobilePlayer.reference.forwardDirection.x
			local y = tes3.mobilePlayer.reference.forwardDirection.y
			local z = 1
			local v = tes3vector3.new( x, y, z )
			
			local multiplier = ( tes3.mobilePlayer.alteration.current * config.airJumpMultiplier )
			
			tes3.mobilePlayer:doJump({ velocity = v * multiplier, allowMidairJumping = true })
			playAlterationHit()
			tes3.modStatistic({
				reference = tes3.mobilePlayer,
				name = "magicka",
				current = -config.airJumpCost,
				limitToBase = true
			})
			tes3.mobilePlayer:exerciseSkill(11, .05)
			if ( config.enableJumpVfx ) then
				tes3.createVisualEffect({ object = "VFX_AlterationArea", lifespan = 5, scale = 5, verticalOffset = 10, position = tes3.mobilePlayer.position })
			end
		else
			playAlterationFail()
		end
	end

end

local function jumpDown(e)

	if not (e.keyCode == tes3.getInputBinding(tes3.keybind.jump).code ) then
		return
	end

	if tes3.menuMode() then
		return
	end
	
	if config.allowAirJump and e.isShiftDown then
		tryAirJump()
		return
	end
	
	if config.toggleMode then
		if ( levState == 1 ) then
			endEffects()
		else
			tryStartLevitate()
		end
	else
		tryStartLevitate()
	end
	

end

local function jumpUp(e)

	if not (e.keyCode == tes3.getInputBinding(tes3.keybind.jump).code ) then
		return
	end

	if tes3.menuMode() then
		return
	end
	
	if ( levState == 1 and not config.toggleMode ) then
		endEffects()
	end
end

local function sneakDown(e)

	if not (e.keyCode == tes3.getInputBinding(tes3.keybind.sneak).code ) then
		return
	end

	if tes3.menuMode() then
		return
	end
	
	if config.toggleMode then
		if ( sfState == 1 ) then
			endEffects()
		else
			tryStartSlowfall()
		end
	else
		tryStartSlowfall()
	end

end

local function sneakUp(e)
	if not (e.keyCode == tes3.getInputBinding(tes3.keybind.sneak).code ) then
		return
	end
	
	if tes3.menuMode() then
		return
	end
	
	if ( sfState == 1 and not config.toggleMode ) then
		endEffects()
	end
end

local function initialized()

	if tes3.isModActive("lack_AlterationMovement.esp") then
		event.register(tes3.event.keyDown, jumpDown)
		event.register(tes3.event.keyUp, jumpUp)
		event.register(tes3.event.keyDown, sneakDown)
		event.register(tes3.event.keyUp, sneakUp)
	else
		tes3.messageBox("Enable lack_AlterationMovement.esp to use Alteration Movement")
	end
	
	print("[Alteration Movement] Alteration Movement Initialized")
end

event.register(tes3.event.initialized, initialized)

local function registerModConfig()
    local EasyMCM = require("easyMCM.EasyMCM")
    local template = EasyMCM.createTemplate("Alteration Movement")
    template:saveOnClose(confPath, config)
    local page = template:createSideBarPage{
        sidebarComponents = {
            EasyMCM.createInfo{ text = "Alteration Movement\n\nby AlandroSul\n\nControls:\nJump while falling/jumping to levitate\nSneak while falling to slowfall"},
        }
    }

    local category = page:createCategory("Settings")

    category:createButton({	
		buttonText = "Disable/Enable Toggle controls",
		description = "Enable to control by jump/sneak toggle rather than by holding the jump/sneak button down. Default: disabled",
		callback = function(self)
			config.toggleMode = not config.toggleMode
			if ( config.toggleMode ) then
				tes3.messageBox("Toggle mode enabled.")
			else
				tes3.messageBox("Toggle mode disabled.")
			end
		end
    })
	
    category:createButton({	
		buttonText = "Disable/Enable Air Jump",
		description = "Enable to permit air jumping when holding shift instead of levitation. Default: enabled",
		callback = function(self)
			config.allowAirJump = not config.allowAirJump
			if ( config.allowAirJump ) then
				tes3.messageBox("Air jump enabled.")
			else
				tes3.messageBox("Air jump disabled.")
			end
		end
    })
	
    category:createButton({	
		buttonText = "Disable/Enable Air Jump VFX",
		description = "Enable for alteration spell effects to appear when you air jump. Disable if you think its too much. Default: enabled",
		callback = function(self)
			config.enableJumpVfx = not config.enableJumpVfx
			if ( config.enableJumpVfx ) then
				tes3.messageBox("Air jump vfx enabled.")
			else
				tes3.messageBox("Air jump vfx disabled.")
			end
		end
    })
	
    category:createButton({	
		buttonText = "Disable/Enable Sounds",
		description = "Enable for alteration spell audio when using alteration movement abilities. Default: enabled",
		callback = function(self)
			config.enableSounds = not config.enableSounds
			if ( config.enableSounds ) then
				tes3.messageBox("Sound enabled.")
			else
				tes3.messageBox("Sound disabled.")
			end
		end
    })
	
	category:createSlider {
    label = "Magicka Cost",
    description = "Magicka cost per second when levitating/slowfalling. Default: 3",
    max = 100,
    min = 1,
    step = 1,
    jump = 1,
    variable = mwse.mcm:createTableVariable {
        id = "magickaCost",
        table = config
    }
	}
	
	category:createSlider {
    label = "Air Jump Magicka Cost",
    description = "Magicka cost per air jump. Default: 10",
    max = 100,
    min = 1,
    step = 1,
    jump = 1,
    variable = mwse.mcm:createTableVariable {
        id = "airJumpCost",
        table = config
    }
	}
	
	category:createSlider {
    label = "Air Jump Skill Multiplier",
    description = "Velocity multiplier for alteration skill when air jumping. Default: 15",
    max = 100,
    min = 1,
    step = 1,
    jump = 1,
    variable = mwse.mcm:createTableVariable {
        id = "airJumpMultiplier",
        table = config
    }
	}
	
	category:createSlider {
    label = "Alteration Level Req",
    description = "Alteration Level Requirement for intuitive magic. Default 30",
    max = 100,
    min = 1,
    step = 1,
    jump = 1,
    variable = mwse.mcm:createTableVariable {
        id = "levelreq",
        table = config
    }
	}

    EasyMCM.register(template)
end

event.register("modConfigReady", registerModConfig)