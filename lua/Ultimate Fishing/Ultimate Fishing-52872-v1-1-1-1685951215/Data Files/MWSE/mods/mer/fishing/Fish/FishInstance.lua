local common = require("mer.fishing.common")
local logger = common.createLogger("FishInstance")

---@class Fishing.FishType.instance
---@field fishType Fishing.FishType
---@field fatigue number How much fatigue the fish has left
local FishInstance = {}

---@param fishType Fishing.FishType
---@return Fishing.FishType.instance | nil
function FishInstance.new(fishType)
    local self = setmetatable({}, { __index = FishInstance })
    local baseObject = fishType:getBaseObject()
    if not baseObject then
        logger:warn("Could not find base object for %s", fishType.baseId)
        return nil
    end
    self.fishType = fishType
    self.fatigue = fishType:getStartingFatigue()
    return self
end

function FishInstance:getName()
    return self.fishType:getBaseObject().name
end

function FishInstance:getInstanceObject()
    return tes3.getObject(self.fishType.baseId) --[[@as tes3misc]]
end

function FishInstance:getSplashSize()
    return math.remap(self.fishType.size, 1.0, 5.0, 1.0, 3.0)
end

function FishInstance:getRippleSize()
    return self.fishType.size
end

function FishInstance:getChaseSpeed()
    local variance = math.random(80, 120) / 100
    local speed =  self.fishType.speed * variance
    logger:debug("getSpeed() speed: %s", speed)
    return speed
end

function FishInstance:getReelSpeed()
    local variance = math.random(80, 120) / 100
    local speed =  self.fishType.speed * variance * 1.5
    logger:debug("getSpeed() speed: %s", speed)
    return speed
end

function FishInstance:getDistanceModifier()
    local currentFatigue = self.fatigue
    local maxFatigue = self.fishType:getStartingFatigue()
    local difficulty = self.fishType.difficulty
    local difficultyModifier = math.remap(difficulty,
        0, 100,
        50, 150
    )
    local fatigueEffect = math.remap(currentFatigue,
        0, maxFatigue,
        0, 1.0
    )
    local distance = difficultyModifier * fatigueEffect
    logger:debug("%s getDistanceModifier() distance: %s",
        self:getName(), distance)
    return distance
end

return FishInstance