local common = require ("mer.ashfall.common.common")

return  {
    text = "Remove Bellows",
    showRequirements = function(campfire)
        return not not campfire.data.bellowsId
    end,
    callback = function(campfire)
        tes3.addItem{ reference = tes3.player, item = campfire.data.bellowsId, playSound = false}
        campfire.data.bellowsId = nil
        tes3.playSound{ reference = tes3.player, sound = "Item Misc Up"  }
        event.trigger("Ashfall:UpdateAttachNodes", {campfire = campfire})
    end
}