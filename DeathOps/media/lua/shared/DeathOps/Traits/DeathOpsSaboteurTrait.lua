-- DeathOpsSaboteurTrait.lua
-- Modular Trait: Death Ops - Saboteur

require "DeathOps/DeathOpsTraitDefinitions"

DeathOpsSaboteurTrait = CreateDeathOpsTrait()
DeathOpsSaboteurTrait.name = "DeathOpsSaboteur"
DeathOpsSaboteurTrait.deathOpsExclusive = true

-- Creates the trait in TraitFactory
function DeathOpsSaboteurTrait.Create()
    local saboteur = TraitFactory.addTrait(
        "DeathOpsSaboteur",
        getText("UI_trait_DeathOpsSaboteur"),
        -4,  -- Character point cost
        getText("UI_trait_DeathOpsSaboteurDesc"),
        true,   -- Profession-only flag
        false   -- Remove on level-up
    )

    -- XP Boosts
    saboteur:addXPBoost(Perks.Electricity, 3)
    saboteur:addXPBoost(Perks.Mechanics, 2)
    saboteur:addXPBoost(Perks.Sneak, 2)
    saboteur:addXPBoost(Perks.Lightfoot, 1)
    saboteur:addXPBoost(Perks.Aiming, 1)

    return saboteur
end

-- Optional starting gear or behavior
function DeathOpsSaboteurTrait.OnNewGame(player)
    if player:HasTrait("DeathOpsSaboteur") then
        local inv = player:getInventory()
        -- Example: inv:AddItem("Base.Timer") or inv:AddItem("Base.Wire")
    end
end

-- Register events
function DeathOpsSaboteurTrait.RegisterEvents()
    Events.OnNewGame.Add(DeathOpsSaboteurTrait.OnNewGame)
end

-- Activate event hooks
DeathOpsSaboteurTrait.RegisterEvents()
