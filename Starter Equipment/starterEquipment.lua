--To install follow the instructions on https://github.com/Boyos999/tes3mpScripts

--This script will add some starting gear to the player's inventory after finishing character creation based on the
--values of their skills
--Only gives armor and weapon for highest skills (marksman not included)


-- abbreviated skills and their skill ids
-- 0,1,2, 3, 4, 5, 6, 7, 9,  16, 18, 21,22,23
-- b,a,ma,ha,bl,lb,ax,sp,enc,alc,sec,la,sb,marks

--[[
local skillArray = {"block", "armorer", "mediumarmor", "heavyarmor", "blunt", "longblade", "axe", "spear", "athletics",
"enchant", "destruction", "alteration", "illusion", "conjuration", "mysticism", "restoration", "alchemy", "unarmored",
"security", "sneak", "acrobatics", "lightarmor", "shortblade", "marksman", "mercantile", "speechcraft", "handtohand"}
]]--

local starterEquipment = {}


starterEquipment.GiveStarterItems = function(eventStatus, pid)
	local major = 30
	local minor = 15
	local baseGold = { refId = "Gold_001", count = 100, charge = -1}
	
	--[[
	Armor priority to reduce item spam
	Heavy armor (3)
	medium armor (2)
	Light armor (21)
	]]--
	local highest = 3
	if tes3mp.GetSkillBase(pid, 2) > tes3mp.GetSkillBase(pid,highest) then
		highest = 2
	end
	if tes3mp.GetSkillBase(pid, 21) > tes3mp.GetSkillBase(pid,highest) then
		highest = 21
	end
	
	--[[
	weapon priority to reduce item spam (marksman not included)
	long blade (5)
	axe (6)
	blunt (4)
	spear (7)
	short blade (22)
	]]--
	local HighestWeapon = 5
	if tes3mp.GetSkillBase(pid, 6) > tes3mp.GetSkillBase(pid,highest) then
		HighestWeapon = 6
	end
	if tes3mp.GetSkillBase(pid, 4) > tes3mp.GetSkillBase(pid,highest) then
		HighestWeapon = 4
	end
	if tes3mp.GetSkillBase(pid, 7) > tes3mp.GetSkillBase(pid,highest) then
		HighestWeapon = 7
	end
	if tes3mp.GetSkillBase(pid, 22) > tes3mp.GetSkillBase(pid,highest) then
		HighestWeapon = 22
	end
	--Block
	if tes3mp.GetSkillBase(pid, 0) >= major then
		--heavyshield
		if highest == 3 then
			local structuredItem = { refId = "steel_towershield", count = 1, charge = -1}
			table.insert(Players[pid].data.inventory, structuredItem)
		--mediumshield
		elseif highest == 2 then
			local structuredItem = { refId = "bonemold_towershield", count = 1, charge = -1}
			table.insert(Players[pid].data.inventory, structuredItem)
		--lightshield
		elseif highest == 21 then
			local structuredItem = { refId = "chitin_towershield", count = 1, charge = -1}
			table.insert(Players[pid].data.inventory, structuredItem)
		end
		
	elseif tes3mp.GetSkillBase(pid, 0) >= minor then
		--heavyshield
		if highest == 3 then
			local structuredItem = { refId = "steel_shield", count = 1, charge = -1}
			table.insert(Players[pid].data.inventory, structuredItem)
		
		--mediumshield
		elseif highest == 2 then
			local structuredItem = { refId = "bonemold_shield", count = 1, charge = -1}
			table.insert(Players[pid].data.inventory, structuredItem)
		
		--lightshield
		elseif highest == 21 then
			local structuredItem = { refId = "chitin_shield", count = 1, charge = -1}
			table.insert(Players[pid].data.inventory, structuredItem)
		end
	end
	
	--armorer
	if tes3mp.GetSkillBase(pid, 1) >= major then
		local structuredItem = { refId = "repair_journeyman_01", count = 4, charge = -1}
		table.insert(Players[pid].data.inventory, structuredItem)
	
	elseif tes3mp.GetSkillBase(pid, 1) >= minor then
		local structuredItem = { refId = "repair_prongs", count = 4, charge = -1}
		table.insert(Players[pid].data.inventory, structuredItem)
	end
	
	--mediumarmor
	if tes3mp.GetSkillBase(pid, 2) >= major and highest == 2 then
		local maItems = {
			{ "bonemold_cuirass",1,-1},
			{ "bonemold_boots",1, -1},
			{ "bonemold_greaves", 1,-1}
		}
		for i,item in pairs(maItems) do
			local structuredItem = { refId = item[1], count = item[2], charge = item[3]}
			table.insert(Players[pid].data.inventory, structuredItem)
		end
	
	elseif tes3mp.GetSkillBase(pid, 2) >= minor and highest == 2 then
		local structuredItem = { refId = "imperial_chain_cuirass", count = 1, charge = -1}
		table.insert(Players[pid].data.inventory, structuredItem)
	end
	
	--heavyarmor
	if tes3mp.GetSkillBase(pid, 3) >= major and highest == 3 then
		local haItems = {
			{ "steel_cuirass",1,-1},
			{ "steel_boots",1, -1},
			{ "steel_greaves", 1,-1}
		}
		for i,item in pairs(haItems) do
			local structuredItem = { refId = item[1], count = item[2], charge = item[3]}
			table.insert(Players[pid].data.inventory, structuredItem)
		end
	
	elseif tes3mp.GetSkillBase(pid, 3) >= minor and highest == 3 then
		local structuredItem = { refId = "iron_cuirass", count = 1, charge = -1}
		table.insert(Players[pid].data.inventory, structuredItem)
	end
	
	--blunt
	if tes3mp.GetSkillBase(pid, 4) >= major and HighestWeapon == 4 then
		local structuredItem = { refId = "steel mace", count = 1, charge = -1}
		table.insert(Players[pid].data.inventory, structuredItem)
	
	elseif tes3mp.GetSkillBase(pid, 4) >= minor and HighestWeapon == 4 then
		local structuredItem = { refId = "iron club", count = 1, charge = -1}
		table.insert(Players[pid].data.inventory, structuredItem)
	end
	
	--longblade
	if tes3mp.GetSkillBase(pid, 5) >= major and HighestWeapon == 5 then
		local structuredItem = { refId = "steel longsword", count = 1, charge = -1}
		table.insert(Players[pid].data.inventory, structuredItem)
	
	elseif tes3mp.GetSkillBase(pid, 5) >= minor and HighestWeapon == 5 then
		local structuredItem = { refId = "iron broadsword", count = 1, charge = -1}
		table.insert(Players[pid].data.inventory, structuredItem)
	end
	
	--axe
	if tes3mp.GetSkillBase(pid, 6) >= major and HighestWeapon == 6 then
		local structuredItem = { refId = "steel war axe", count = 1, charge = -1}
		table.insert(Players[pid].data.inventory, structuredItem)
	
	elseif tes3mp.GetSkillBase(pid, 6) >= minor and HighestWeapon == 6 then
		local structuredItem = { refId = "chitin war axe", count = 1, charge = -1}
		table.insert(Players[pid].data.inventory, structuredItem)
	end
	
	--spear
	if tes3mp.GetSkillBase(pid, 7) >= major and HighestWeapon == 7 then
		local structuredItem = { refId = "steel spear", count = 1, charge = -1}
		table.insert(Players[pid].data.inventory, structuredItem)
	
	elseif tes3mp.GetSkillBase(pid, 7) >= minor and HighestWeapon == 7 then
		local structuredItem = { refId = "chitin spear", count = 1, charge = -1}
		table.insert(Players[pid].data.inventory, structuredItem)
	end
	
	--enchant
	if tes3mp.GetSkillBase(pid, 9) >= major then
		local enItems = {
			{ "dire flamebolt ring",1,15},
			{ "life ring",1, 15},
			{ "Misc_SoulGem_Lesser", 3,-1}
		}
		for i,item in pairs(enItems) do
			local structuredItem = { refId = item[1], count = item[2], charge = item[3]}
			table.insert(Players[pid].data.inventory, structuredItem)
		end
	
	elseif tes3mp.GetSkillBase(pid, 9) >= minor then
		local enItems = {
			{ "sparkbolt ring",1,5},
			{ "Misc_SoulGem_Petty",3,-1}
		}
		for i,item in pairs(enItems) do
			local structuredItem = { refId = item[1], count = item[2], charge = item[3]}
			table.insert(Players[pid].data.inventory, structuredItem)
		end
	end
	
	--alchemy
	if tes3mp.GetSkillBase(pid, 16) >= major then
		local alcItems = {
			{ "apparatus_j_mortar_01",1,-1},
			{ "apparatus_a_alembic_01",1, -1},
			{ "apparatus_a_retort_01", 1,-1},
			{ "ingred_marshmerrow_01", 5,-1},
			{ "ingred_wickwheat_01", 5,-1}
		}
		for i,item in pairs(alcItems) do
			local structuredItem = { refId = item[1], count = item[2], charge = item[3]}
			table.insert(Players[pid].data.inventory, structuredItem)
		end
	
	elseif tes3mp.GetSkillBase(pid, 16) >= minor then
		local alcItems = {
			{ "apparatus_a_mortar_01",1,-1},
			{ "ingred_marshmerrow_01", 5,-1},
			{ "ingred_wickwheat_01", 5,-1}
		}
		for i,item in pairs(alcItems) do
			local structuredItem = { refId = item[1], count = item[2], charge = item[3]}
			table.insert(Players[pid].data.inventory, structuredItem)
		end
	end
	
	--security
	if tes3mp.GetSkillBase(pid, 18) >= major then
		local secItems = {
			{ "probe_journeyman_01",1,-1},
			{ "pick_journeyman_01",1, -1},
			{ "probe_apprentice_01",1,-1},
			{ "pick_apprentice_01", 1,-1}
		}
		for i,item in pairs(secItems) do
			local structuredItem = { refId = item[1], count = item[2], charge = item[3]}
			table.insert(Players[pid].data.inventory, structuredItem)
		end
	
	elseif tes3mp.GetSkillBase(pid, 18) >= minor then
		local secItems = {
			{ "probe_apprentice_01",1,-1},
			{ "pick_apprentice_01", 1,-1}
		}
		for i,item in pairs(secItems) do
			local structuredItem = { refId = item[1], count = item[2], charge = item[3]}
			table.insert(Players[pid].data.inventory, structuredItem)
		end
	end
	
	--lightarmor
	if tes3mp.GetSkillBase(pid, 21) >= major and highest == 21 then
		local laItems = {
			{ "chitin cuirass",1,-1},
			{ "chitin boots",1, -1},
			{ "chitin greaves", 1,-1}
		}
		for i,item in pairs(laItems) do
			local structuredItem = { refId = item[1], count = item[2], charge = item[3]}
			table.insert(Players[pid].data.inventory, structuredItem)
		end
	
	elseif tes3mp.GetSkillBase(pid, 21) >= minor and highest == 21 then
		local structuredItem = { refId = "netch_leather_boiled_cuirass", count = 1, charge = -1}
		table.insert(Players[pid].data.inventory, structuredItem)
	end
	
	--shortblade
	if tes3mp.GetSkillBase(pid, 22) >= major and HighestWeapon == 22 then
		local structuredItem = { refId = "steel shortsword", count = 1, charge = -1}
		table.insert(Players[pid].data.inventory, structuredItem)
	
	elseif tes3mp.GetSkillBase(pid, 22) >= minor and HighestWeapon == 22 then
		local structuredItem = { refId = "chitin shortsword", count = 1, charge = -1}
		table.insert(Players[pid].data.inventory, structuredItem)
	end
	--marksman
	if tes3mp.GetSkillBase(pid, 23) >= major then
		local mItems = {
			{ "steel longbow",1,-1},
			{ "chitin arrow",100, -1},
			{ "steel arrow", 20,-1}
		}
		for i,item in pairs(mItems) do
			local structuredItem = { refId = item[1], count = item[2], charge = item[3]}
			table.insert(Players[pid].data.inventory, structuredItem)
		end
	
	elseif tes3mp.GetSkillBase(pid, 23) >= minor then
		local structuredItem = { refId = "steel throwing star", count = 20, charge = -1}
		table.insert(Players[pid].data.inventory, structuredItem)
	end

	--universal
	table.insert(Players[pid].data.inventory, baseGold)
	
	Players[pid]:LoadInventory()
	Players[pid]:LoadEquipment()
end

customEventHooks.registerHandler("OnPlayerEndCharGen",starterEquipment.GiveStarterItems)

return starterEquipment
