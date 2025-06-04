-- DeathOpsReconTrait.lua
-- Modular Trait: Death Ops - Recon

require "DeathOps/DeathOpsTraitDefinitions"

DeathOpsReconTrait = CreateDeathOpsTrait()
DeathOpsReconTrait.name = "DeathOpsRecon"
DeathOpsReconTrait.deathOpsExclusive = true

-- Creates the trait in TraitFactory
function DeathOpsReconTrait.Create()
    local recon = TraitFactory.addTrait(
        "DeathOpsRecon",
        getText("UI_trait_DeathOpsRecon"),
        -4,  -- Character point cost
        getText("UI_trait_DeathOpsReconDesc"),
        true,   -- Profession-only flag
        false   -- Remove on level-up
    )

    -- XP Boosts
    recon:addXPBoost(Perks.Sneak, 2)
    recon:addXPBoost(Perks.Lightfoot, 2)
    recon:addXPBoost(Perks.Sprinting, 1)
    recon:addXPBoost(Perks.Aiming, 1)
    recon:addXPBoost(Perks.Trapping, 1)

    return recon
end

-- Optional starting gear or behavior
function DeathOpsReconTrait.OnNewGame(player)
    if player:HasTrait("DeathOpsRecon") then
        local inv = player:getInventory()
        inv:AddItem("Base.Binoculars")
    end
end

-- Register events
function DeathOpsReconTrait.RegisterEvents()
    Events.OnNewGame.Add(DeathOpsReconTrait.OnNewGame)
end

-- Activate event hooks
DeathOpsReconTrait.RegisterEvents()
