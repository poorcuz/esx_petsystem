function GivePetToSource(source, pet)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return false, Config.Locale["PLR_NOT_FOUND"] end

    local petsObj = json.decode(xPlayer.getMeta("pets") or "{}")
    if petsObj[pet] then
        return false, Config.Locale["PLR_HAS_PET_ALREADY"]
    end

    petsObj[pet] = true
    xPlayer.setMeta("pets", json.encode(petsObj))

    return true, nil
end
exports("GivePetToSource", GivePetToSource)

function GetPetsFromSource(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return false, Config.Locale["PLR_NOT_FOUND"] end

    local petsObj = json.decode(xPlayer.getMeta("pets") or "{}")
    for petName, petData in pairs(petsObj) do
        local petConfig = Config.Pets[petName]
        if petConfig then
            petsObj[petName] = {
                label = petConfig.label
            }
        else
            petsObj[petName] = nil
        end
    end

    return true, petsObj
end

for name, data in pairs(Config.Items) do
    if GetResourceState("inventory") == "started" then
        exports["inventory"]:AddRestricted(name)
    end

    ESX.RegisterUsableItem(name, function(playerId)
        local xPlayer = ESX.GetPlayerFromId(playerId)
        local success, msg = GivePetToSource(playerId, data)

        if not success then
            if xPlayer.showError then
                return xPlayer.showError(msg)
            else
                return xPlayer.showNotification(msg)
            end
        else
            xPlayer.removeInventoryItem(name, 1)
            return xPlayer.showNotification(Config.Locale["REDEEMED_PET"])
        end
    end)
end