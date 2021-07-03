ESX = nil
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx_joint:roule_le_teh_zbii') --This event open menu
AddEventHandler('esx_joint:roule_le_teh_zbii', function()
  TriggerServerEvent('esx_joint:roule_le_teh_zbi')
end)

RegisterNetEvent('esx_joint:joint')
AddEventHandler('esx_joint:joint', function()
	function loadAnimDict(dict)
		while (not HasAnimDictLoaded(dict)) do
			RequestAnimDict(dict)
			Citizen.Wait(5)
		end
	end
	local ad = "amb@world_human_aa_smoke@male@idle_a"
	loadAnimDict( ad )
	TaskPlayAnim( PlayerPedId(), ad, "idle_c", 3.0, -8, -1, 63, 0, 0, 0, 0 )

	local x,y,z = table.unpack(GetEntityCoords(PlayerPedId()))
	local spjoint = math.random(1)
	if spjoint == 1 then
		spjoint = 'p_amb_joint_01'
		joint = CreateObject(GetHashKey(spjoint), x, y, z+0.2,  true,  true, true)
		AttachEntityToEntity(joint, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 28422), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, true, true, false, true, 1, true)
    Citizen.Wait(Config.TimeSmoke)
    ClearPedTasksImmediately(playerPed)
    SetTimecycleModifier("spectator6")
    SetPedMotionBlur(playerPed, true)
    SetPedMovementClipset(playerPed, "MOVE_M@DRUNK@VERYDRUNK", true)
    SetPedIsDrunk(playerPed, true)
    AnimpostfxPlay("ChopVision", 10000001, true)
    ShakeGameplayCam("DRUNK_SHAKE", Config.EffectMouvement)
    SetEntityHealth(GetPlayerPed(-1), 200)
    SetPedArmour(PlayerPedId(), 50)
    TriggerEvent('esx_joint:finish')
    Citizen.Wait(Config.TimeEffect)
    SetPedMoveRateOverride(PlayerId(),1.0)
    SetRunSprintMultiplierForPlayer(PlayerId(),1.0)
    SetPedIsDrunk(GetPlayerPed(-1), false)		
    SetPedMotionBlur(playerPed, false)
    ResetPedMovementClipset(GetPlayerPed(-1))
    AnimpostfxStopAll()
    ShakeGameplayCam("DRUNK_SHAKE", 0.0)
    SetTimecycleModifierStrength(0.0)
	end
end)
RegisterNetEvent('esx_joint:finish')
AddEventHandler('esx_joint:finish', function()
	DetachEntity(spjoint, 1, 1)
	DeleteObject(spjoint)	
	maitem = false
	ClearPedSecondaryTask(PlayerPedId())
	FreezeEntityPosition(PlayerPedId(), false)
end)