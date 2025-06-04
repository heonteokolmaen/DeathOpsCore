require "DeathOps/DeathOpsWeaponUtil"

local function InitDeathOpsLoadout(player)
    if player:getDescriptor():getProfession() == "deathops" then
        -- Add gear
        DeathOpsWeaponUtil.addStandardLoadout(player)

        -- Set hard skill levels
        local xp = player:getXp()
        xp:setXPToLevel(Perks.Aiming, 2)
        xp:setXPToLevel(Perks.Sneak, 2)
        xp:setXPToLevel(Perks.Nimble, 1)
        xp:setXPToLevel(Perks.Lightfoot, 1)
        xp:setXPToLevel(Perks.Fitness, 3)
        xp:setXPToLevel(Perks.Strength, 2)
        xp:setXPToLevel(Perks.Sprinting, 2)
        xp:setXPToLevel(Perks.Trapping, 1)
        xp:setXPToLevel(Perks.Foraging, 1)
        xp:setXPToLevel(Perks.FirstAid, 1)
    end
end

Events.OnCreateLivingCharacter.Add(InitDeathOpsLoadout)
