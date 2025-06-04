-- DeathOpsLinebackerTrait.lua
-- Modular Trait: Death Ops - Linebacker (Heavy Support / Suppression)

require "DeathOps/DeathOpsTraitDefinitions"

DeathOpsLinebackerTrait = CreateDeathOpsTrait()
DeathOpsLinebackerTrait.name = "DeathOpsLinebacker"
DeathOpsLinebackerTrait.deathOpsExclusive = true

-- Creates the trait in TraitFactory
function DeathOpsLinebackerTrait.Create()
    local linebacker = TraitFactory.addTrait(
        "DeathOpsLinebacker",
        getText("UI_trait_DeathOpsLinebacker"),
        -4,  -- Character point cost
        getText("UI_trait_DeathOpsLinebackerDesc"),
        true,   -- Profession-only flag
        false   -- Remove on level-up
    )

    -- XP Boosts
    linebacker:addXPBoost(Perks.Strength, 3)
    linebacker:addXPBoost(Perks.Fitness, 2)
    linebacker:addXPBoost(Perks.Reloading, 2)
    linebacker:addXPBoost(Perks.Aiming, 2)
    linebacker:addXPBoost(Perks.Sprinting, 1)

    return linebacker
end

-- Optional starting gear or behavior
function DeathOpsLinebackerTrait.OnNewGame(player)
    if player:HasTrait("DeathOpsLinebacker") then
        local inv = player:getInventory()
        -- Example: inv:AddItem("Base.556Clip")
    end
end

-- Register events
function DeathOpsLinebackerTrait.RegisterEvents()
    Events.OnNewGame.Add(DeathOpsLinebackerTrait.OnNewGame)
end

-- Activate event hooks
DeathOpsLinebackerTrait.RegisterEvents()
