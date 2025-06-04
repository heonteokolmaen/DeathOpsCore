-- DeathOpsBreacherTrait.lua
-- Modular Trait: Death Ops - Breacher

require "DeathOps/DeathOpsTraitDefinitions"

DeathOpsBreacherTrait = CreateDeathOpsTrait()
DeathOpsBreacherTrait.name = "DeathOpsBreacher"
DeathOpsBreacherTrait.deathOpsExclusive = true

-- Creates the trait in TraitFactory
function DeathOpsBreacherTrait.Create()
    local breacher = TraitFactory.addTrait(
        "DeathOpsBreacher",
        getText("UI_trait_DeathOpsBreacher"),
        -4,  -- Character point cost
        getText("UI_trait_DeathOpsBreacherDesc"),
        true,   -- Profession-only flag
        false   -- Remove on level-up
    )

    -- XP Boosts
    breacher:addXPBoost(Perks.ShortBlunt, 3)
    breacher:addXPBoost(Perks.Strength, 2)
    breacher:addXPBoost(Perks.Fitness, 2)
    breacher:addXPBoost(Perks.Maintenance, 1)
    breacher:addXPBoost(Perks.Sprinting, 1)

    return breacher
end

-- Optional starting gear or behavior
function DeathOpsBreacherTrait.OnNewGame(player)
    if player:HasTrait("DeathOpsBreacher") then
        local inv = player:getInventory()
        -- Example gear; customize as needed
        -- inv:AddItem("Base.BallPeenHammer")
        -- inv:AddItem("Base.DoorCharge")
    end
end

-- Register events
function DeathOpsBreacherTrait.RegisterEvents()
    Events.OnNewGame.Add(DeathOpsBreacherTrait.OnNewGame)
end

-- Activate event hooks
DeathOpsBreacherTrait.RegisterEvents()
