-- DeathOpsAssaulterTrait.lua
-- Modular Trait: Death Ops - Assaulter

require "DeathOps/DeathOpsTraitDefinitions"

DeathOpsAssaulterTrait = CreateDeathOpsTrait()
DeathOpsAssaulterTrait.name = "DeathOpsAssaulter"
DeathOpsAssaulterTrait.deathOpsExclusive = true

-- Creates the trait in TraitFactory
function DeathOpsAssaulterTrait.Create()
    local assaulter = TraitFactory.addTrait(
        "DeathOpsAssaulter",
        getText("UI_trait_DeathOpsAssaulter"),
        -4,  -- Character point cost
        getText("UI_trait_DeathOpsAssaulterDesc"),
        true,   -- Profession-only flag
        false   -- Remove on level-up
    )

    -- XP Boosts
    assaulter:addXPBoost(Perks.Aiming, 3)
    assaulter:addXPBoost(Perks.Reloading, 2)
    assaulter:addXPBoost(Perks.ShortBlunt, 2)
    assaulter:addXPBoost(Perks.Fitness, 2)
    assaulter:addXPBoost(Perks.Strength, 2)
    assaulter:addXPBoost(Perks.Sprinting, 1)
    assaulter:addXPBoost(Perks.Nimble, 1)

    return assaulter
end

-- Optional starting gear or behavior
function DeathOpsAssaulterTrait.OnNewGame(player)
    if player:HasTrait("DeathOpsAssaulter") then
        local inv = player:getInventory()
        -- Example: inv:AddItem("Base.Hammer")
    end
end

-- Register events
function DeathOpsAssaulterTrait.RegisterEvents()
    Events.OnNewGame.Add(DeathOpsAssaulterTrait.OnNewGame)
end

-- Activate event hooks
DeathOpsAssaulterTrait.RegisterEvents()
