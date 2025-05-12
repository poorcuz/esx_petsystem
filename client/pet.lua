local function doAnimation(petData, animName, subAnimName)
    local animatorList = Config.AnimationList[petData.animType]
    if not animatorList then print("no animList found!") return end

    local animData = animatorList[animName][subAnimName]
    if not animData then print("no animData found!") return end

    RequestAnimDict(animData.animDictionary)
	while not HasAnimDictLoaded(animData.animDictionary) do
		Wait(0)
	end

    TaskPlayAnim(petData.ped, animData.animDictionary, animData.animationName, 8.0, -8.0, -1, 1, 0, false, false, false)
end

Citizen.CreateThread(function()
    while true do
        local playerPed = PlayerPedId()
        local playerPos = GetEntityCoords(playerPed)

        for petName, petData in pairs(petsTbl) do
            local petPed = petData.ped
            local petPos = GetEntityCoords(petPed)
            local petDist = Vdist(playerPos, petPos)

            if petData.spawned and DoesEntityExist(petPed) then
                if petData.command ~= "dead" then
                    local petHealth = GetEntityHealth(petPed)
                    if petHealth <= 0 then
                        Config.ShowNotification("error", (Config.Locale["PET_DIED"]):format(petData.label) )
                        petsTbl[petName] = nil
                        petData.command = "dead"

                        Citizen.CreateThread(function()
                            Citizen.Wait(10000)
                            DeleteEntity(petPed)          
                        end)              
                    end

                    if petData.command ~= "sit_vehicle" and IsPedSittingInAnyVehicle(playerPed) and petDist < 8.0 and petData.command ~= "dead" then
                        local vehicle = GetVehiclePedIsUsing(playerPed)

                        for seatIdx=0, 4 do
                            if IsVehicleSeatFree(vehicle, seatIdx) then
                                SetPedIntoVehicle(petPed, vehicle, seatIdx)
                                Citizen.Wait(50)
                                SetPedCanBeDraggedOut(petPed, false)
                                doAnimation(petData, "sitting", "sit")
                                
                                petData.command = "sit_vehicle"
                                break
                            end
                        end
                    elseif petData.command == "sit_vehicle" and not IsPedSittingInAnyVehicle(playerPed) and petData.command ~= "dead" then
                        local vehicle = GetVehiclePedIsUsing(playerPed)
                        local vehiclePos = GetEntityCoords(vehicle)
                        local vehicleDist = Vdist(playerPos, vehiclePos)

                        if vehicleDist > 10.0 then
                            SetEntityCoords(petPed, playerPos ,1,0,0,1)
                            SetPedCanBeDraggedOut(petPed, true)
                            ClearPedTasksImmediately(petPed)
                            ClearPedSecondaryTask(petPed)

                            petData.command = "follow"
                        end
                    elseif petData.command == "follow" then
                        local status = GetScriptTaskStatus(petPed, "SCRIPT_TASK_FOLLOW_TO_OFFSET_OF_ENTITY")
                        if status ~= 0 and status ~= 1 then
                            ClearPedTasksImmediately(petPed)
                            ClearPedSecondaryTask(petPed)
                            TaskFollowToOffsetOfEntity(petPed, playerPed, 0.0, 1.0, 0.0, 2.0, -1, 5.0, true)
                        end
                    elseif petData.command == "sit" then
                        doAnimation(petData, "sitting", "sit")
                    elseif petData.command == "attack" then
                        local attackTarget = petData.attackTarget
                        if not DoesEntityExist(attackTarget) or GetEntityHealth(attackTarget) <= 0 then
                            SetPedAsEnemy(petData.ped, false)
                            SetPedRelationshipGroupHash(petData.ped, GetHashKey("CIVFEMALE"))
                            SetPedConfigFlag(petData.ped, 52, false)
                            SetPedCombatAttributes(petData.ped, 46, false) 
                            
                            petData.command = "follow"
                        end
                    end
                end

            end
        end
    
        Citizen.Wait(1500)
    end
end)