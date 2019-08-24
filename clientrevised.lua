--[[Door locking clientside code, referenced from MissBehavin's non-ESX door lock script, edited (implemented player animations, removed ESX, removed non-used code) and presented for LARP demonstration, by TitanSix--]]--
--[[Code includes 3d text of door being locked/unlocked when used, also includes animation for locking the door, for MRPD cell doors]]--
--[[Code also referenced from FiveM forums]]--

function DrawText3d(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
    if onScreen then
        SetTextScale(0.5, 0.5)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(255, 0, 0, 255)
        SetTextDropshadow(0, 0, 0, 0, 55)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
		ClearDrawOrigin()
    end
end

Citizen.CreateThread(function()
    while true do
		Citizen.Wait(0)
		local ped = GetPlayerPed(-1)
        for i = 1, #doors do
            local playerCoords = GetEntityCoords( GetPlayerPed(-1) )
            local closeDoor = GetClosestObjectOfType(doors[i]["x"], doors[i]["y"], doors[i]["z"], 1.0, GetHashKey(doors[i]["objName"]), false, false, false)
            
            local objectCoordsDraw = GetEntityCoords( closeDoor )            
            local playerDistance = GetDistanceBetweenCoords(playerCoords.x, playerCoords.y, playerCoords.z, doors[i]["x"], doors[i]["y"], doors[i]["z"], true)
                        
            if(playerDistance < 1.25) then
                
                if doors[i]["locked"] == true then
                    DrawText3d(doors[i]["txtX"], doors[i]["txtY"], doors[i]["txtZ"], "[E] ~r~Locked")
                else
                    DrawText3d(doors[i]["txtX"], doors[i]["txtY"], doors[i]["txtZ"], "[E] ~g~Unlocked")
                end
				
                if IsControlJustPressed(1,51) then	
	--[[Code chunk below is for animations. I believe it could be put here, or individually inside if the doors are locked = true/= false. Clarification?]]--
			if (GetEntityModel(ped) == GetHashKey("mp_m_freemode_01")) then
				RequestAnimDict('anim@amb@clubhouse@tutorial@bkr_tut_ig3@machinic_loop_mechandplayer')  
			while not HasAnimDictLoaded('anim@amb@clubhouse@tutorial@bkr_tut_ig3@machinic_loop_mechandplayer') do
				Citizen.Wait(0)
			end
				TaskPlayAnim(ped,'anim@amb@clubhouse@tutorial@bkr_tut_ig3@machinic_loop_mechandplayer', 'machinic_loop_mechandplayer'', 1.0, 1.0, -1, 8, -1, true, true, true)
			elseif (GetEntityModel(ped) == GetHashKey("mp_f_freemode_01")) then
				RequestAnimDict('anim@amb@clubhouse@tutorial@bkr_tut_ig3@machinic_loop_mechandplayer')  
			while not HasAnimDictLoaded('anim@amb@clubhouse@tutorial@bkr_tut_ig3@machinic_loop_mechandplayer') do
				Citizen.Wait(0)
			end
				TaskPlayAnim(ped,'anim@amb@clubhouse@tutorial@bkr_tut_ig3@machinic_loop_mechandplayer', 'machinic_loop_mechandplayer'', 1.0, 1.0, -1, 8, -1, true, true, true)
			else
				RequestAnimDict('anim@amb@clubhouse@tutorial@bkr_tut_ig3@machinic_loop_mechandplayer')  
			while not HasAnimDictLoaded('anim@amb@clubhouse@tutorial@bkr_tut_ig3@machinic_loop_mechandplayer') do
				Citizen.Wait(0)
			end
				TaskPlayAnim(ped,'anim@amb@clubhouse@tutorial@bkr_tut_ig3@machinic_loop_mechandplayer', 'machinic_loop_mechandplayer'', 1.0, 1.0, -1, 8, -1, true, true, true)
			end
		end
	end
	--[[End code chunk for animations.]]--
					if doors[i]["locked"] == true then
                        FreezeEntityPosition(closeDoor, false)
                        if(i==1 or i==2 or i==3 or i==4) then
                            doors[1]["locked"] = false
                            doors[2]["locked"] = false
							doors[3]["locked"] = false
                            doors[4]["locked"] = false
                        else
                            doors[i]["locked"] = false
                        end
                    else
                        FreezeEntityPosition(closeDoor, true)
                        if(i==1 or i==2 or i==3 or i==4) then
                            doors[1]["locked"] = true
                            doors[2]["locked"] = true
							doors[3]["locked"] = true
                            doors[4]["locked"] = true
                        else
                            doors[i]["locked"] = true
                        end
                    end
                    TriggerServerEvent('door:update', i, doors[i]["locked"])
                end
            else
                FreezeEntityPosition(closeDoor, doors[i]["locked"])
            end
        end
    end
end)

doors = {
    -- mission row cell doors
    [1] = { ["objName"] = "v_ilev_ph_cellgate", ["x"]= 463.815, ["y"]= -992.686,["z"]= 24.9149,["locked"]= true,["txtX"]=463.815,["txtY"]=-992.686,["txtZ"]=25.064},
    [2] = { ["objName"] = "v_ilev_ph_cellgate", ["x"]= 462.381, ["y"]= -993.651,["z"]= 24.9149,["locked"]= true,["txtX"]=461.806,["txtY"]=-993.308,["txtZ"]=25.064},
    [3] = { ["objName"] = "v_ilev_ph_cellgate", ["x"]= 462.331, ["y"]= -998.152,["z"]= 24.9149,["locked"]= true,["txtX"]=461.806,["txtY"]=-998.800,["txtZ"]=25.064},
    [4] = { ["objName"] = "v_ilev_ph_cellgate", ["x"]= 462.704, ["y"]= -1001.92,["z"]= 24.9149,["locked"]= true,["txtX"]=461.806,["txtY"]=-1002.450,["txtZ"]=25.064},
}


RegisterNetEvent('door:state')
AddEventHandler('door:state', function(id, lockdoor)
    if type(doors[id]) ~= nil then
        doors[id]["locked"] = lockdoor
    end
end)
