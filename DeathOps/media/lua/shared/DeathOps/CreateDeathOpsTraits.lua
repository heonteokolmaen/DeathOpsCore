require "NPCs/MainCreationMethods"
require "DeathOps/DeathOpsTraitDefinitions"

local function createTraits()
    for _, traitDef in ipairs(DeathOpsTraitDefinitions.traits) do
        traitDef.Create()
        if traitDef.deathOpsExclusive and DeathOpsTraitDefinitions.restrictTraitsToProfession then
            ProfessionExclusiveTrait:new(traitDef.name, {"deathops"})
        end
    end
end

local function setMutualExclusions()
    local existingTraits = {}
    for _, traitDef in ipairs(DeathOpsTraitDefinitions.traits) do
        existingTraits[traitDef.name] = true
    end
    for _, traitDef in ipairs(DeathOpsTraitDefinitions.traits) do
        if traitDef.mutualExclusions then
            for _, exclusion in ipairs(traitDef.mutualExclusions) do
                if existingTraits[exclusion] then
                    TraitFactory.setMutualExclusive(traitDef.name, exclusion)
                end
            end
        end
    end
end

local function initDeathOpsTraits()
    createTraits()
    setMutualExclusions()
end

local function initDeathOpsProfs()
    local prof = ProfessionFactory.addProfession("deathops", getText("UI_prof_DeathOps"), "profession_DeathOps", 10)
    prof:addFreeTrait("HighlyTrained")
    prof:addFreeTrait("Desensitized")
    prof:addXPBoost(Perks.Aiming, 3)
    prof:addXPBoost(Perks.Sneak, 2)
    prof:addXPBoost(Perks.Nimble, 2)
    prof:addXPBoost(Perks.Lightfoot, 2)
    prof:addXPBoost(Perks.Fitness, 1)
    prof:addXPBoost(Perks.Strength, 1)
    prof:addXPBoost(Perks.Sprinting, 2)
    prof:addXPBoost(Perks.Trapping, 1)
    prof:addXPBoost(Perks.Foraging, 1)
    prof:addXPBoost(Perks.FirstAid, 1)


    for i = 1, ProfessionFactory.getProfessions():size() do
        local p = ProfessionFactory.getProfessions():get(i - 1)
        BaseGameCharacterDetails.SetProfessionDescription(p)
    end
end

local origTraits = BaseGameCharacterDetails.DoTraits
BaseGameCharacterDetails.DoTraits = function()
    origTraits()
    initDeathOpsTraits()
end

local origProfs = BaseGameCharacterDetails.DoProfessions
BaseGameCharacterDetails.DoProfessions = function()
    origProfs()
    initDeathOpsProfs()
end

Events.OnGameBoot.Remove(origTraits)
Events.OnGameBoot.Remove(origProfs)
Events.OnGameBoot.Add(BaseGameCharacterDetails.DoTraits)
Events.OnGameBoot.Add(BaseGameCharacterDetails.DoProfessions)
