DeathOpsTraitDefinitions = {}
DeathOpsTraitDefinitions.restrictTraitsToProfession = true
DeathOpsTraitDefinitions.traits = {}

function CreateDeathOpsTrait()
    local trait = {}
    table.insert(DeathOpsTraitDefinitions.traits, trait)
    return trait
end
