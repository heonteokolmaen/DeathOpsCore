-- DeathOpsScoutSniperTrait.lua
-- Modular Trait: Death Ops - Scout Sniper

require "DeathOps/DeathOpsTraitDefinitions"

DeathOpsScoutSniperTrait = CreateDeathOpsTrait()
DeathOpsScoutSniperTrait.name = "DeathOpsScoutSniper"
DeathOpsScoutSniperTrait.deathOpsExclusive = true

-- Creates the trait in TraitFactory
function DeathOpsScoutSniperTrait.Create()
    local sniper = TraitFactory.addTrait(
        "DeathOpsScoutSniper",
        getText("UI_trait_DeathOpsScoutSniper"),
        -4,  -- Character point cost
        getText("UI_trait_DeathOpsScoutSniperDesc"),
        true,   -- Profession-only flag
        false   -- Remove on level-up
    )

    -- XP Boosts
    sniper:addXPBoost(Perks.Aiming, 4)
    sniper:addXPBoost(Perks.Sneak, 2)
    sniper:addXPBoost(Perks.Lightfoot, 2)
    sniper:addXPBoost(Perks.Reloading, 1)
    sniper:addXPBoost(Perks.Fitness, 1)

    return sniper
end

-- Optional starting gear or behavior
function DeathOpsScoutSniperTrait.OnNewGame(player)
    if player:HasTrait("DeathOpsScoutSniper") then
        local inv = player:getInventory()
        -- Example: inv:AddItem("Base.HuntingRifle")
    end
end

-- Register events
function DeathOpsScoutSniperTrait.RegisterEvents()
    Events.OnNewGame.Add(DeathOpsScoutSniperTrait.OnNewGame)
end

-- Activate event hooks
DeathOpsScoutSniperTrait.RegisterEvents()
