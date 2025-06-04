DeathOpsWeaponUtil = {}

-- Add a default loadout for Death Ops operatives
function DeathOpsWeaponUtil.addStandardLoadout(player)
    DeathOpsWeaponUtil.addWeapon(player, "Base.M16", {"Base.Scope", "Base.Laser"})
    DeathOpsWeaponUtil.addMags(player, "Base.556Clip", 3)
end

-- Determine how much ammo to give based on traits
function DeathOpsWeaponUtil.getAmmoMultiplier(player)
    if player:HasTrait("LoadoutExtraAmmo") then
        return 2
    elseif player:HasTrait("LoadoutLessAmmo") then
        return 0.5
    end
    return 1
end

-- Generic weapon + attachment assignment
function DeathOpsWeaponUtil.addWeapon(player, weaponType, attachments)
    local inventory = player:getInventory()
    local weapon = inventory:AddItem(weaponType)
    if weapon and attachments then
        for _, part in ipairs(attachments) do
            weapon:attachWeaponPart(InventoryItemFactory.CreateItem(part))
        end
    end
    return weapon
end

-- Add magazines to inventory, adjusted by multiplier
function DeathOpsWeaponUtil.addMags(player, magType, count)
    local multiplier = DeathOpsWeaponUtil.getAmmoMultiplier(player)
    for i = 1, count * multiplier do
        DeathOpsWeaponUtil.addMag(player, magType)
    end
end

-- Add and preload a single magazine
function DeathOpsWeaponUtil.addMag(player, magType)
    local mag = player:getInventory():AddItem(magType)
    mag:setCurrentAmmoCount(mag:getMaxAmmo())
    return mag
end

-- Equip and preload weapon + mag
function DeathOpsWeaponUtil.equipAndFullyLoad(player, weaponType, magType, attachments)
    local weapon = DeathOpsWeaponUtil.addWeapon(player, weaponType, attachments)
    local mag = DeathOpsWeaponUtil.addMag(player, magType)
    mag:setCurrentAmmoCount(mag:getMaxAmmo() + 1) -- +1 to simulate chambered round

    DeathOpsWeaponUtil.equipWeapon(player, weapon)
    ISTimedActionQueue.add(ISInsertMagazine:new(player, weapon, mag))
