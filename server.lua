--[[Door locking serverside code, referenced from MissBehavin's non-ESX door lock script, edited and presented for LARP demonstration, by TitanSix--]]--
--[[Code is untested. I'm not 100% sure of the code as it mentions ESX, but is non-ESC code. Clarification?]]--

lockdoor = nil
doors = {1,2,3,4}

RegisterServerEvent('door:update')
AddEventHandler('door:update', function(id, lockdoor)
    if (id ~= nil and lockdoor ~= nil) then
		TriggerClientEvent('door:state', -1, id, lockdoor)
		
    end
end)

AddEventHandler('esx:playerLoaded', function(source)
	local lockdoor = true
	local id = doors[i]
    TriggerClientEvent('door:state', -1, id, lockdoor)

end)

RegisterServerEvent('esx_doors:getDoors')
AddEventHandler('esx_doors:getDoors', function(id, lockdoor)
    if (id ~= nil and lockdoor ~= nil) then
        TriggerClientEvent('door:state', -1, id, lockdoor)
    end
end)
