-- DeathOpsDemolitions.lua
-- Modular Trait: Death Ops - Demolitions Expert

require "DeathOps/DeathOpsTraitDefinitions"

DeathOpsDemolitionsTrait = CreateDeathOpsTrait()
DeathOpsDemolitionsTrait.name = "DeathOpsDemolitions"
DeathOpsDemolitionsTrait.deathOpsExclusive = true

-- Creates the trait in TraitFactory
function DeathOpsDemolitionsTrait.Create()
    local demolitions = TraitFactory.addTrait(
        "DeathOpsDemolitions",
        getText("UI_trait_DeathOpsDemolitions"),
        -4,  -- Character point cost
        getText("UI_trait_DeathOpsDemolitionsDesc"),
        true,   -- Profession-only flag
        false   -- Remove on level-up
    )

    -- XP Boosts
    demolitions:addXPBoost(Perks.Aiming, 3)
    demolitions:addXPBoost(Perks.Reloading, 2)
    demolitions:addXPBoost(Perks.Electricity, 2)
    demolitions:addXPBoost(Perks.Maintenance, 1)
    demolitions:addXPBoost(Perks.Strength, 1)

    return demolitions
end

-- Optional starting gear or behavior
function DeathOpsDemolitionsTrait.OnNewGame(player)
    if player:HasTrait("DeathOpsDemolitions") then
        local inv = player:getInventory()
        -- Example: inv:AddItem("Base.TimerMagazine")
    end
end

-- Register events
function DeathOpsDemolitionsTrait.RegisterEvents()
    Events.OnNewGame.Add(DeathOpsDemolitionsTrait.OnNewGame)
end

-- Activate event hooks
DeathOpsDemolitionsTrait.RegisterEvents()
