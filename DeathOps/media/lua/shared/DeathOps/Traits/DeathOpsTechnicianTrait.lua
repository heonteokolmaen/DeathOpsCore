-- DeathOpsTechnicianTrait.lua
-- Modular Trait: Death Ops - Technician

require "DeathOps/DeathOpsTraitDefinitions"

DeathOpsTechnicianTrait = CreateDeathOpsTrait()
DeathOpsTechnicianTrait.name = "DeathOpsTechnician"
DeathOpsTechnicianTrait.deathOpsExclusive = true

-- Creates the trait in TraitFactory
function DeathOpsTechnicianTrait.Create()
    local technician = TraitFactory.addTrait(
        "DeathOpsTechnician",
        getText("UI_trait_DeathOpsTechnician"),
        -4,  -- Character point cost
        getText("UI_trait_DeathOpsTechnicianDesc"),
        true,   -- Profession-only flag
        false   -- Remove on level-up
    )

    -- XP Boosts
    technician:addXPBoost(Perks.Electricity, 3)
    technician:addXPBoost(Perks.Mechanics, 2)
    technician:addXPBoost(Perks.Maintenance, 2)
    technician:addXPBoost(Perks.Lightfoot, 1)
    technician:addXPBoost(Perks.Sneak, 1)

    return technician
end

-- Optional starting gear or behavior
function DeathOpsTechnicianTrait.OnNewGame(player)
    if player:HasTrait("DeathOpsTechnician") then
        local inv = player:getInventory()
        -- Example: inv:AddItem("Base.ElectronicsMag1")
    end
end

-- Register events
function DeathOpsTechnicianTrait.RegisterEvents()
    Events.OnNewGame.Add(DeathOpsTechnicianTrait.OnNewGame)
end

-- Activate event hooks
DeathOpsTechnicianTrait.RegisterEvents()
