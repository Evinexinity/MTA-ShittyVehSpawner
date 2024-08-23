
vehicleNames = {"Landstalker", "Bravura", "Buffalo", "Linerunner", "Perennial", "Sentinel", "Dumper", "Fire Truck", "Trashmaster", "Stretch", "Manana", 
	"Infernus", "Voodoo", "Pony", "Mule", "Cheetah", "Ambulance", "Leviathan", "Moonbeam", "Esperanto", "Taxi", "Washington", "Bobcat", 
	"Mr. Whoopee", "BF Injection", "Hunter", "Premier", "Enforcer", "Securicar", "Banshee", "Predator", "Bus", "Rhino", "Barracks", "Hotknife", 
	"Trailer 1", "Previon", "Coach", "Cabbie", "Stallion", "Rumpo", "RC Bandit", "Romero", "Packer", "Monster", "Admiral", "Squalo", 
	"Seasparrow", "Pizzaboy", "Tram", "Trailer 2", "Turismo", "Speeder", "Reefer", "Tropic", "Flatbed", "Yankee", "Caddy", "Solair", 
	"Berkley's RC Van", "Skimmer", "PCJ-600", "Faggio", "Freeway", "RC Baron", "RC Raider", "Glendale", "Oceanic", "Sanchez", "Sparrow", "Patriot", 
	"Quadbike", "Coastguard", "Dinghy", "Hermes", "Sabre", "Rustler", "ZR-350", "Walton", "Regina", "Comet", "BMX", "Burrito", "Camper", "Marquis", 
	"Baggage", "Dozer", "Maverick", "News Chopper", "Rancher", "FBI Rancher", "Virgo", "Greenwood", "Jetmax", "Hotring Racer", "Sandking", 
	"Blista Compact", "Police Maverick", "Boxville", "Benson", "Mesa", "RC Goblin", "Hotring Racer 2", "Hotring Racer 3", "Bloodring Banger", 
	"Rancher Lure", "Super GT", "Elegant", "Journey", "Bike", "Mountain Bike", "Beagle", "Cropduster", "Stuntplane", "Tanker", "Roadtrain", "Nebula", 
	"Majestic", "Buccaneer", "Shamal", "Hydra", "FCR-900", "NRG-500", "HPV1000", "Cement Truck", "Towtruck", "Fortune", "Cadrona", "FBI Truck", 
	"Willard", "Forklift", "Tractor", "Combine Harvester", "Feltzer", "Remington", "Slamvan", "Blade", "Freight", "Brown Streak", "Vortex", "Vincent", 
	"Bullet", "Clover", "Sadler", "Fire Truck Ladder", "Hustler", "Intruder", "Primo", "Cargobob", "Tampa", "Sunrise", "Merit", "Utility Van", 
	"Nevada", "Yosemite", "Windsor", "Monster 2", "Monster 3", "Uranus", "Jester", "Sultan", "Stratum", "Elegy", "Raindance", "RC Tiger", "Flash", 
	"Tahoma", "Savanna", "Bandito", "Freight Train Flatbed", "Streak Train Trailer", "Kart", "Mower", "Dune", "Sweeper", "Broadway", "Tornado", 
	"AT-400", "DFT-30", "Huntley", "Stafford", "BF-400", "Newsvan", "Tug", "Trailer (Tanker Commando)", "Emperor", "Wayfarer", "Euros", "Hotdog", 
	"Club", "Box Freight", "Trailer 3", "Andromada", "Dodo", "RC Cam", "Launch", "Police LS", "Police SF", "Police LV", "Police Ranger", 
	"Picador", "S.W.A.T.", "Alpha", "Phoenix", "Glendale Damaged", "Sadler Damaged", "Baggage Trailer (covered)", 
	"Baggage Trailer (Uncovered)", "Trailer (Stairs)", "Boxville Mission", "Farm Trailer", "Street Clean Trailer"
}

modVehicleNames = {[400] = "patrol", [401] = "amir",

}

function isInTable(inpValue, inpTable)
	for key, value in pairs(inpTable) do
		if value == inpValue then
			return true
		end
	end
end

function isNum(uinput)
	if type(tonumber(uinput)) == "number" then
		return true
	else
		return false
	end
end

function createVehForPlayer(player, command, model)
    
    local player_rz, player_ry, player_rx = getElementRotation(player, "ZYX")

    -- I have 0 fucking clue what this code does... oh btw, thank you Wumbaloo from MTA Forum!
    function getPositionFromElementOffset(element,offX,offY,offZ) 
        local m = getElementMatrix ( element )  -- Get the matrix 
        local x = offX * m[1][1] + offY * m[2][1] + offZ * m[3][1] + m[4][1]  -- Apply transform 
        local y = offX * m[1][2] + offY * m[2][2] + offZ * m[3][2] + m[4][2] 
        local z = offX * m[1][3] + offY * m[2][3] + offZ * m[3][3] + m[4][3] 
        return x, y, z                               -- Return the transformed point 
    end

    local player_x, player_y, player_z = getElementPosition(player)
    local model_isNum = isNum(model)

    if model_isNum == true then
        for k,v in pairs(vehicleNames) do
            if k+399 == tonumber(model) then
                modelName = v
            end
        end
    end

    if model_isNum == true then

        -- Same here, I just sat and tweaked this part for 2 fucking hours. at some point I SOMEHOW Figured it out...
        local veh_x, veh_y, veh_z = getPositionFromElementOffset(player, 0, 5, 1)
        local newVehicle = createVehicle(model, veh_x, veh_y, veh_z)
        
        setElementRotation(newVehicle, 0, 0, player_rx + 90)

        vehNameEquivilant = model
        for k,v in pairs(vehicleNames) do
            if k + 399 == tonumber(model) then
                vehNameEquivilant = v
            end
        end

        outputChatBox(string.format("#FFFFFFVehicle ID#004CFF %s.#FF0005 %s #FFFFFFhas Spawned#12AC03 Successfully!", model, modelName), player, 255, 255, 255, true)
        
    else
        if isInTable(model, vehicleNames) ~= true then
            if isInTable(model, modVehicleNames) == true then
                for k,v in pairs(modVehicleNames) do
                    if v == model then
                        local veh_x, veh_y, veh_z = getPositionFromElementOffset(player, 0, 5, 1)
                        local newVehicle = createVehicle(k, veh_x, veh_y, veh_z)

                        setElementRotation(newVehicle, 0, 0, player_rx + 90)

                        outputChatBox(string.format("#FFFFFFVehicle ID#004CFF %s.#FF0005 %s #FFFFFFhas Spawned#12AC03 Successfully!", v, k), player, 255, 255, 255, true)
                    end
                end
            end
        else
        for i,v in pairs(vehicleNames) do
            if v == model then
                modelID = i + 399
                local veh_x, veh_y, veh_z = getPositionFromElementOffset(player, 0, 5, 1)
                local newVehicle = createVehicle(modelID, veh_x, veh_y, veh_z)
                setElementRotation(newVehicle, 0, 0, player_rx + 90)
                outputChatBox(string.format("#FFFFFFVehicle #FF0005 %s#FFFFFF (#004CFF %s #FFFFFF) #FFFFFFhas Spawned#12AC03 Successfully!", model, modelID), player, 255, 255, 255, true)
            end
        end
        end
    end
end

addCommandHandler("veh", createVehForPlayer, false, false)
