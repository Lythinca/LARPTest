--[[Script made for opening cell doors at MRPD, for LARP demonstration. By TitanSix--]]--
--[[If User Presses "E" Key, animation should play. Commented after is the same set, with a different animation. Next step would be to make a /emote command for the same usage--]]--
--[[Code is untested due to having a problem fetching my FXServer info.]]--

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local ped = GetPlayerPed(-1)
		
        if IsControlJustReleased(1, 206) then
            if (GetEntityModel(ped) == GetHashKey("mp_m_freemode_01")) then
                RequestAnimDict('anim@mp_rollarcoaster@safety_bar_grip_move_a_player_one')  
                while not HasAnimDictLoaded('anim@mp_rollarcoaster@safety_bar_grip_move_a_player_one') do
                    Citizen.Wait(0)
                end
                TaskPlayAnim(ped,'anim@mp_rollarcoaster@safety_bar_grip_move_a_player_one', 'csafety_bar_grip_move_a_player_one', 1.0, 1.0, -1, 8, -1, true, true, true)
            elseif (GetEntityModel(ped) == GetHashKey("mp_f_freemode_01")) then
                RequestAnimDict('anim@mp_player_intcelebrationfemale@safety_bar_grip_move_a_player_one')  
                while not HasAnimDictLoaded('anim@mp_rollarcoaster@safety_bar_grip_move_a_player_one') do
                    Citizen.Wait(0)
                end
                TaskPlayAnim(ped,'anim@mp_rollarcoaster@safety_bar_grip_move_a_player_one', 'safety_bar_grip_move_a_player_one', 1.0, 1.0, -1, 8, -1, true, true, true)
            else
                RequestAnimDict('anim@mp_rollarcoaster@safety_bar_grip_move_a_player_one')  
                while not HasAnimDictLoaded('anim@mp_rollarcoaster@safety_bar_grip_move_a_player_one') do
                    Citizen.Wait(0)
                end
                TaskPlayAnim(ped,'anim@mp_rollarcoaster@safety_bar_grip_move_a_player_one', 'safety_bar_grip_move_a_player_one', 1.0, 1.0, -1, 8, -1, true, true, true)
            end
        end
    end
end)

--[[--
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local ped = GetPlayerPed(-1)
		
        if IsControlJustReleased(1, 206) then
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
end)
--]]--
