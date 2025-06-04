-- DeathOps_[TraitName]Trait.lua
-- Modular Trait Template for Death Ops system

require "DeathOps/DeathOpsTraitDefinitions"

DeathOps[TraitName]Trait = CreateDeathOpsTrait()
DeathOps[TraitName]Trait.name = "DeathOps[TraitName]"
DeathOps[TraitName]Trait.deathOpsExclusive = true

-- Creates the trait in TraitFactory
function DeathOps[TraitName]Trait.Create()
    local trait = TraitFactory.addTrait(
        "DeathOps[TraitName]",
        getText("UI_trait_DeathOps[TraitName]"),
        [Cost],  -- Character point cost
        getText("UI_trait_DeathOps[TraitName]Desc"),
        true,   -- Profession-only flag
        false    -- Remove on level-up
    )

    -- XP Boosts (customize below)
    trait:addXPBoost(Perks.[SkillName1], [Level])
    -- trait:addXPBoost(Perks.[SkillName2], [Level])  -- Optional extra boosts

    return trait
end

-- Optional function to give starting gear or behavior
function DeathOps[TraitName]Trait.OnNewGame(player)
    if player:HasTrait("DeathOps[TraitName]") then
        local inv = player:getInventory()
        -- Example: inv:AddItem("Base.SomeItem")
    end
end

-- Registers the OnNewGame hook
function DeathOps[TraitName]Trait.RegisterEvents()
    Events.OnNewGame.Add(DeathOps[TraitName]Trait.OnNewGame)
end

-- Activate custom events (can be removed if unused)
DeathOps[TraitName]Trait.RegisterEvents()
