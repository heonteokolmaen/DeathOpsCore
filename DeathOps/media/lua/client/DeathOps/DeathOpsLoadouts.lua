-- DeathOpsLoadouts.lua
-- Shared + Role-Specific Loadouts for Death Ops traits

DeathOpsLoadouts = {}

function DeathOpsLoadouts.Standard(player)
    local inv = player:getInventory()

    -- Standard Rifle Loadout
    inv:AddItem("Base.M16")
    inv:AddItem("Base.M16Magazine")
    inv:AddItem("Base.M16Magazine")
    inv:AddItem("Base.M16Magazine")
    inv:AddItem("Base.Bullets556x45Box")

    -- Standard Sidearm
    inv:AddItem("Base.M1911")
    inv:AddItem("Base.M1911Mag")
    inv:AddItem("Base.M1911Mag")
    inv:AddItem("Base.Bullets45Box")
    inv:AddItem("Base.Holster")

    -- Standard Gear
    inv:AddItem("Base.Vest_BulletArmy")
    inv:AddItem("Base.Hat_BeretArmy")
    inv:AddItem("Base.Gloves_LeatherGloves")
    inv:AddItem("Base.Shoes_ArmyBoots")
    inv:AddItem("Base.Torch")
    inv:AddItem("Base.WalkieTalkie5")

    -- Universal Recipes
    player:learnRecipe("AttachScope")
    player:learnRecipe("CleanFirearm")
    player:learnRecipe("HotwireCar")
end

function DeathOpsLoadouts.Assaulter(player)
    DeathOpsLoadouts.Standard(player)
    local inv = player:getInventory()
    inv:AddItem("Base.Axe")
    player:learnRecipe("MakeMolotov")
end

function DeathOpsLoadouts.CombatMedic(player)
    DeathOpsLoadouts.Standard(player)
    local inv = player:getInventory()
    inv:AddItem("Base.AlcoholWipes")
    inv:AddItem("Base.Bandage")
    inv:AddItem("Base.SutureNeedle")
    player:learnRecipe("MakeDisinfectedBandage")
    player:learnRecipe("MakeSplint")
end

function DeathOpsLoadouts.Technician(player)
    DeathOpsLoadouts.Standard(player)
    local inv = player:getInventory()
    inv:AddItem("Base.Screwdriver")
    inv:AddItem("Base.ElectronicsScrap")
    inv:AddItem("Base.Wire")
    player:learnRecipe("MakeRemoteTrigger")
    player:learnRecipe("FixElectronics")
end

function DeathOpsLoadouts.Saboteur(player)
    DeathOpsLoadouts.Standard(player)
    local inv = player:getInventory()
    inv:AddItem("Base.GasCan")
    inv:AddItem("Base.Lighter")
    inv:AddItem("Base.Timer")
    player:learnRecipe("MakeIED")
    player:learnRecipe("SetTimedCharge")
end

function DeathOpsLoadouts.Marksman(player)
    DeathOpsLoadouts.Standard(player)
    local inv = player:getInventory()
    inv:AddItem("Base.Binoculars")
    player:learnRecipe("CraftRangedScope")
    player:learnRecipe("ZeroSight")
end

function DeathOpsLoadouts.Linebacker(player)
    DeathOpsLoadouts.Standard(player)
    local inv = player:getInventory()
    inv:AddItem("Base.Nightstick")
    player:learnRecipe("ReinforceArmor")
end

function DeathOpsLoadouts.ScoutSniper(player)
    DeathOpsLoadouts.Standard(player)
    local inv = player:getInventory()
    inv:AddItem("Base.Binoculars")
    player:learnRecipe("MakeGhillieSuit")
    player:learnRecipe("Camouflage")
end

function DeathOpsLoadouts.Covert(player)
    DeathOpsLoadouts.Standard(player)
    local inv = player:getInventory()
    inv:AddItem("Base.Screwdriver")
    player:learnRecipe("CraftSilencer")
    player:learnRecipe("MakeNoiseTrap")
end

function DeathOpsLoadouts.ApplyLoadout(player)
    if player:HasTrait("DeathOpsAssaulter") then
        DeathOpsLoadouts.Assaulter(player)
    elseif player:HasTrait("DeathOpsCombatMedic") then
        DeathOpsLoadouts.CombatMedic(player)
    elseif player:HasTrait("DeathOpsTechnician") then
        DeathOpsLoadouts.Technician(player)
    elseif player:HasTrait("DeathOpsSaboteur") then
        DeathOpsLoadouts.Saboteur(player)
    elseif player:HasTrait("DeathOpsMarksman") then
        DeathOpsLoadouts.Marksman(player)
    elseif player:HasTrait("DeathOpsLinebacker") then
        DeathOpsLoadouts.Linebacker(player)
    elseif player:HasTrait("DeathOpsScoutSniper") then
        DeathOpsLoadouts.ScoutSniper(player)
    elseif player:HasTrait("DeathOpsCovert") then
        DeathOpsLoadouts.Covert(player)
    else
        DeathOpsLoadouts.Standard(player)
    end
end

return DeathOpsLoadouts
