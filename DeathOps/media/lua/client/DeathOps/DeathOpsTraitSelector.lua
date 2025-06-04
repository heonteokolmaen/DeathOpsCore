deathops_trait_selector_code = """
-- DeathOpsTraitSelector.lua
-- Greys out other DeathOps traits when one is selected

local deathOpsTraits = {
    "DeathOpsAssaulter",
    "DeathOpsCovert",
    "DeathOpsDemolitions",
    "DeathOpsCombatMedic",
    "DeathOpsTechnician",
    "DeathOpsMarksman",
    "DeathOpsLinebacker",
    "DeathOpsSaboteur",
    "DeathOpsScoutSniper"
}

local function isDeathOpsTrait(trait)
    for _, t in ipairs(deathOpsTraits) do
        if t == trait then return true end
    end
    return false
end

local function onGameBoot()
    local originalTraitSelect = ISCharacterCreationMain.traitSelected

    function ISCharacterCreationMain:traitSelected(trait)
        originalTraitSelect(self, trait)

        if isDeathOpsTrait(trait) then
            for _, otherTrait in ipairs(deathOpsTraits) do
                if otherTrait ~= trait then
                    self.traitListBox:disableTrait(otherTrait)
                end
            end
        else
            for _, t in ipairs(deathOpsTraits) do
                self.traitListBox:enableTrait(t)
            end
        end
    end
end

Events.OnGameBoot.Add(onGameBoot)
"""

# Save file
file_path = "/mnt/data/DeathOpsTraitSelector.lua"
with open(file_path, "w") as f:
    f.write(deathops_trait_selector_code)

file_path
