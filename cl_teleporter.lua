-- Spoody.Dev (Dont Redistribute)

key_to_teleport = 38

positions = {
    {{-956.49, -776.85, 17.00, 0}, {-3005.38, 4741.23, 426.25, 358},{0,51,255}, "Sky Ramps"}, 
} --    ^ At Skate                           ^ Where you teleport to

-- DONT EDIT! ONLY TOUCH THE 

local player = GetPlayerPed(-1)

Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(5)
        local player = GetPlayerPed(-1)
        local playerLoc = GetEntityCoords(player)

        for _,location in ipairs(positions) do
            teleport_text = location[4]
            loc1 = {
                x=location[1][1],
                y=location[1][2],
                z=location[1][3],
                heading=location[1][4]
            }
            loc2 = {
                x=location[2][1],
                y=location[2][2],
                z=location[2][3],
                heading=location[2][4]
            }
            Red = location[3][1]
            Green = location[3][2]
            Blue = location[3][3]

            DrawMarker(2, loc1.x, loc1.y, loc1.z+1.0, 0, 0, 0, 0, 0, 0, 0.25, 0.2, 0.1, Red, Green, Blue, 200, 0, 0, 0, 1)
            DrawMarker(2, loc2.x, loc2.y, loc2.z+1.0, 0, 0, 0, 0, 0, 0, 0.25, 0.2, 0.1, Red, Green, Blue, 200, 0, 0, 0, 1)

			if CheckPos(playerLoc.x, playerLoc.y, playerLoc.z, loc1.x, loc1.y, loc1.z, 2) then 
				DrawText3Ds(loc1.x, loc1.y, loc1.z + 1.2, '[~b~E~s~] Teleport to Sky Ramps')
                if IsControlJustReleased(1, key_to_teleport) then
					DoScreenFadeOut(500) -- Remove this to remove the fade when you tp
    				Wait(500)
                    SetEntityCoords(player, loc2.x, loc2.y, loc2.z)
                    SetEntityHeading(player, loc2.heading)
					DoScreenFadeIn(500) -- Remove this to remove the fade when you tp
                    print('Made By: Spoody#1000')
                    exports['mythic_notify']:DoHudText('inform', 'Teleported!', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
		            Citizen.Wait(1)
                end
			elseif CheckPos(playerLoc.x, playerLoc.y, playerLoc.z, loc2.x, loc2.y, loc2.z, 2) then
				DrawText3Ds(loc2.x, loc2.y, loc2.z + 1.2, '[~b~E~s~] Teleport Back To Skate Ramps')
                if IsControlJustReleased(1, key_to_teleport) then
					DoScreenFadeOut(500) -- Remove this to remove the fade when you tp
    				Wait(500)
                    SetEntityCoords(player, loc1.x, loc1.y, loc1.z)
                    SetEntityHeading(player, loc1.heading)
					DoScreenFadeIn(500) -- Remove this to remove the fade you tp
                    print('Made By: Spoody#1000')
                    exports['mythic_notify']:DoHudText('inform', 'Teleported!', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
		            Citizen.Wait(1)
                end
            end            
        end
    end
end)

function CheckPos(x, y, z, cx, cy, cz, radius)
    local t1 = x - cx
    local t12 = t1^2

    local t2 = y-cy
    local t21 = t2^2

    local t3 = z - cz
    local t31 = t3^2

    return (t12 + t21 + t31) <= radius^2
end


function DrawText3Ds(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 100)
    ClearDrawOrigin()
end


