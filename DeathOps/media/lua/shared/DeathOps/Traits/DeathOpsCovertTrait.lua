-- DeathOpsCovertTrait.lua
-- Modular Trait: Death Ops - Covert Operative

require "DeathOps/DeathOpsTraitDefinitions"

DeathOpsCovertTrait = CreateDeathOpsTrait()
DeathOpsCovertTrait.name = "DeathOpsCovert"
DeathOpsCovertTrait.deathOpsExclusive = true

-- Creates the trait in TraitFactory
function DeathOpsCovertTrait.Create()
    local covert = TraitFactory.addTrait(
        "DeathOpsCovert",
        getText("UI_trait_DeathOpsCovert"),
        -4,  -- Character point cost
        getText("UI_trait_DeathOpsCovertDesc"),
        true,   -- Profession-only flag
        false   -- Remove on level-up
    )

    -- XP Boosts
    covert:addXPBoost(Perks.Sneak, 3)
    covert:addXPBoost(Perks.Lightfoot, 2)
    covert:addXPBoost(Perks.Electricity, 2)
    covert:addXPBoost(Perks.Mechanics, 2)
    covert:addXPBoost(Perks.Nimble, 1)

    return covert
end

-- Optional starting gear or behavior
function DeathOpsCovertTrait.OnNewGame(player)
    if player:HasTrait("DeathOpsCovert") then
        local inv = player:getInventory()
        -- Example: inv:AddItem("Base.Screwdriver")
    end
end

-- Register events
function DeathOpsCovertTrait.RegisterEvents()
    Events.OnNewGame.Add(DeathOpsCovertTrait.OnNewGame)
end

-- Activate event hooks
DeathOpsCovertTrait.RegisterEvents()
