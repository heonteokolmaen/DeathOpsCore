-- DeathOpsCombatMedicTrait.lua
-- Modular Trait: Death Ops - Combat Medic

require "DeathOps/DeathOpsTraitDefinitions"

DeathOpsCombatMedicTrait = CreateDeathOpsTrait()
DeathOpsCombatMedicTrait.name = "DeathOpsCombatMedic"
DeathOpsCombatMedicTrait.deathOpsExclusive = true

-- Creates the trait in TraitFactory
function DeathOpsCombatMedicTrait.Create()
    local combatmedic = TraitFactory.addTrait(
        "DeathOpsCombatMedic",
        getText("UI_trait_DeathOpsCombatMedic"),
        -4,  -- Character point cost
        getText("UI_trait_DeathOpsCombatMedicDesc"),
        true,   -- Profession-only flag
        false    -- Remove on level-up
    )

    -- XP Boosts
    combatmedic:addXPBoost(Perks.FirstAid, 3)
    combatmedic:addXPBoost(Perks.Fitness, 2)
    combatmedic:addXPBoost(Perks.Sprinting, 2)
    combatmedic:addXPBoost(Perks.Nimble, 1)
    combatmedic:addXPBoost(Perks.Aiming, 1)
-- DeathOpsCombatMedic.lua
-- Modular Trait: Death Ops - Combat Medic

require "DeathOps/DeathOpsTraitDefinitions"

DeathOpsCombatMedicTrait = CreateDeathOpsTrait()
DeathOpsCombatMedicTrait.name = "DeathOpsCombatMedic"
DeathOpsCombatMedicTrait.deathOpsExclusive = true

-- Creates the trait in TraitFactory
function DeathOpsCombatMedicTrait.Create()
    local medic = TraitFactory.addTrait(
        "DeathOpsCombatMedic",
        getText("UI_trait_DeathOpsCombatMedic"),
        -4,  -- Character point cost
        getText("UI_trait_DeathOpsCombatMedicDesc"),
        true,   -- Profession-only flag
        false   -- Remove on level-up
    )

    -- XP Boosts
    medic:addXPBoost(Perks.FirstAid, 2)
    medic:addXPBoost(Perks.Lightfoot, 1)
    medic:addXPBoost(Perks.Sprinting, 1)
    medic:addXPBoost(Perks.Reloading, 1)

    return medic
end

-- Optional starting gear or behavior
function DeathOpsCombatMedicTrait.OnNewGame(player)
    if player:HasTrait("DeathOpsCombatMedic") then
        local inv = player:getInventory()
        -- Example: inv:AddItem("Base.Tweezers") or inv:AddItem("Base.Bandage")
    end
end

-- Register events
function DeathOpsCombatMedicTrait.RegisterEvents()
    Events.OnNewGame.Add(DeathOpsCombatMedicTrait.OnNewGame)
end

-- Activate event hooks
DeathOpsCombatMedicTrait.RegisterEvents()

    return combatmedic
end

-- Optional starting gear or behavior
function DeathOps.CombatMedicTrait.OnNewGame(player)
    if player:HasTrait("DeathOpsCombatMedic") then
        local inv = player:getInventory()
        -- Example: inv:AddItem("Base.Bandage") or inv:AddItem("Base.AlcoholWipes")
    end
end

-- Register events
function DeathOps.CombatMedicTrait.RegisterEvents()
    Events.OnNewGame.Add(DeathOpsCombatMedicTrait.OnNewGame)
end

-- Activate event hooks
DeathOpsCombatMedicTrait.RegisterEvents()
