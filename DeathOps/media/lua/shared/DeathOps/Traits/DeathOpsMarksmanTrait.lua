-- DeathOpsMarksmanTrait.lua
-- Modular Trait: Death Ops - Marksman

require "DeathOps/DeathOpsTraitDefinitions"

DeathOpsMarksmanTrait = CreateDeathOpsTrait()
DeathOpsMarksmanTrait.name = "DeathOpsMarksman"
DeathOpsMarksmanTrait.deathOpsExclusive = true

-- Creates the trait in TraitFactory
function DeathOpsMarksmanTrait.Create()
    local marksman = TraitFactory.addTrait(
        "DeathOpsMarksman",
        getText("UI_trait_DeathOpsMarksman"),
        -4,  -- Character point cost
        getText("UI_trait_DeathOpsMarksmanDesc"),
        true,   -- Profession-only flag
        false   -- Remove on level-up
    )

    -- XP Boosts
    marksman:addXPBoost(Perks.Aiming, 4)
    marksman:addXPBoost(Perks.Reloading, 2)
    marksman:addXPBoost(Perks.Lightfoot, 1)
    marksman:addXPBoost(Perks.Nimble, 1)
    marksman:addXPBoost(Perks.Sneak, 1)

    return marksman
end

-- Optional starting gear or behavior
function DeathOpsMarksmanTrait.OnNewGame(player)
    if player:HasTrait("DeathOpsMarksman") then
        local inv = player:getInventory()
        -- Example: inv:AddItem("Base.223Box")
    end
end

-- Register events
function DeathOpsMarksmanTrait.RegisterEvents()
    Events.OnNewGame.Add(DeathOpsMarksmanTrait.OnNewGame)
end

-- Activate event hooks
DeathOpsMarksmanTrait.RegisterEvents()
