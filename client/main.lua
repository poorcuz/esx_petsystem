petsTbl = {}

function GetPetState(petName)
    return petsTbl[petName] or nil
end
exports("GetPetState", GetPetState)

function GetPetList()
    local _petData = nil
    local waited = 0

    ESX.TriggerServerCallback("bc_pets:getPetList", function(data)
        _petData = data
    end)

    while not _petData and waited < 5000 do
        Wait(10)
        waited = waited + 10
    end

    return _petData
end
exports("GetPetList", GetPetList)

function SpawnPet(petName)
    local petConfig = Config.Pets[petName]
    if not petConfig then 
        return false, Config.Locale["PET_NOT_FOUND"]
    end

    local petData = petsTbl[petName]
    if petData and petData.spawned then
        return false, Config.Locale["PET_ALREADY_SPAWNED"]
    end

    local playerPed = PlayerPedId()
    local playerPos = GetEntityCoords(playerPed)
	local playerGroup = CreateGroup() -- Create a unique 

    if IsPedSittingInAnyVehicle(playerPed) then return false, Config.Locale["STEP_OUT_OF_VEHICLE"] end

    RequestAnimDict('rcmnigel1c')
	while not HasAnimDictLoaded('rcmnigel1c') do
		Wait(0)
	end

    TaskPlayAnim(playerPed, 'rcmnigel1c', 'hailing_whistle_waive_a', 8.0, -8, -1, 120, 0, false, false, false)
    DoRequestModel(petConfig.model)
	SetTimeout(2500, function() 
		local animalPed = CreatePed(28, petConfig.model, playerPos.x +1, playerPos.y +1, playerPos.z -1, 1, 1)
        Citizen.Wait(50)

        SetPedAsGroupMember(playerPed, playerGroup)
        SetPedAsGroupLeader(playerPed, playerGroup)
    
		SetPedAsGroupMember(animalPed, playerGroup)
		SetPedNeverLeavesGroup(animalPed, true)
		SetPedCanBeTargetted(animalPed, false)
		SetEntityAsMissionEntity(animalPed, true,true)
        SetPedAsEnemy(animalPed, false)
        SetPedRelationshipGroupHash(animalPed, `CIVFEMALE`)
        --SetBlockingOfNonTemporaryEvents(animalPed, true)
        --SetPedCombatAttributes(animalPed, 1424, true) -- No attacking
        TaskFollowToOffsetOfEntity(animalPed, playerPed, 0.0, 1.0, 0.0, 2.0, -1, 5.0, true)


        petsTbl[petName] = {
            spawned = true,
            command = 'follow',
            ped = animalPed,
            groupHandle = playerGroup,
            animType = petConfig.animType,
            label = petConfig.label
        }
	end)

    return true, Config.Locale["PET_SPAWN_SUCCESS"]
end
exports("SpawnPet", SpawnPet)

function AttachPet(petName)
    local petData = petsTbl[petName]
    if not petData then return end

    local playerPed = PlayerPedId()
    local playerPos = GetEntityCoords(playerPed)
	local playerGroup = petData.groupHandle

    SetPedAsGroupMember(playerPed, playerGroup) -- 👈 necessary
    SetPedAsGroupLeader(playerPed, playerGroup) -- 👈 must come after

    SetPedAsGroupMember(petData.ped, playerGroup)
    SetPedNeverLeavesGroup(petData.ped, true)
    SetPedCanBeTargetted(petData.ped, false)
    SetEntityAsMissionEntity(petData.ped, true,true)

    TaskFollowToOffsetOfEntity(petData.ped, playerPed, 0.0, 1.0, 0.0, 2.0, -1, 5.0, true)
end

function DismissPet(petName)
    local playerPed = PlayerPedId()
    local playerPos = GetEntityCoords(playerPed)

    local petData = petsTbl[petName]
    if not petData or not petData.spawned then
        return false, Config.Locale['PET_NOT_SPAWNED']
    end

    petsTbl[petName] = nil

    SetGroupSeparationRange(petData.groupHandle, 1.9)
    SetPedNeverLeavesGroup(petData.ped, false)
    TaskGoToCoordAnyMeans(petData.ped, playerPos.x + 40, playerPos.y, playerPos.z, 5.0, 0, 0, 786603, 0xbf800000)

    Citizen.CreateThread(function()
        Citizen.Wait(5000)
        DeleteEntity(petData.ped)
    end)

    return true, Config.Locale["PET_DISMISS_SUCCESS"]
end
exports("DismissPet", DismissPet)

function AttackPlayer(petName, targetPlayerId)
    local petData = petsTbl[petName]
    if not petData then
        return false, Config.Locale["PET_ATTACK_FAILED"]
    end

    local petPed = petData.ped
    if not petPed then
        return false, Config.Locale["PET_ATTACK_FAILED"]
    end

    local targetPlayerPed = GetPlayerPed(targetPlayerId)
    if not targetPlayerPed then
        return false, Config.Locale["PLR_NOT_FOUND"]
    end

    -- Set the pet as an enemy and hostile to the player
    SetPedAsEnemy(petPed, true)
    SetPedRelationshipGroupHash(petPed, GetHashKey("security_guard"))
    SetPedConfigFlag(petPed, 52, true)
    SetPedCombatAttributes(petPed, 46, true)  -- Make the pet fight aggressively

    petData.command = "attack"
    petData.attackTarget = targetPlayerPed

    TaskCombatPed(petPed, targetPlayerPed, 0, 16)

    return true, Config.Locale["PET_ATTACK_SUCCESS"]
end
exports("AttackPlayer", AttackPlayer)


function PetSit(petName)
    local petData = petsTbl[petName]
    if not petData then
        return false, Config.Locale["PET_SIT_FAILED"]
    end

    local petPed = petData.ped
    if not petPed then
        return false, Config.Locale["PET_SIT_FAILED"]
    end

    petData.command = "sit"
    return true, Config.Locale["PET_SIT_SUCCESS"]
end
exports("PetSit", PetSit)

function PetFollow(petName)
    local petData = petsTbl[petName]
    if not petData then
        return false, Config.Locale["PET_FOLLOW_FAILED"]
    end

    local petPed = petData.ped
    if not petPed then
        return false, Config.Locale["PET_FOLLOW_FAILED"]
    end

    petData.command = "follow"
    return true, Config.Locale["PET_FOLLOW_SUCCESS"]
end
exports("PetFollow", PetFollow)

function DoRequestModel(model)
	RequestModel(model)
	while not HasModelLoaded(model) do
		Citizen.Wait(1)
	end
end


Citizen.CreateThread(function()
    Wait(5000)
    while not exports["inventory"] or not Config.Items do Wait(10) end

    for name, data in pairs(Config.Items) do
        exports["inventory"]:AddCloseOnUse(name)
        exports["inventory"]:AddRestricted(name)
    end
end)