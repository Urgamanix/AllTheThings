-----------------------------------------------------
--   D U N G E O N S  &  R A I D S  M O D U L E    --
-----------------------------------------------------

_.Instances = { tier(2, {	-- Burning Crusade
	inst(746, { 	-- Gruul's Lair
		["coord"] = { 69.31, 23.67, BLADES_EDGE_MOUNTAINS },	-- Gruul's Lair, Blade's Edge Mountain
		["sharedLockout"] = 1,
		["isRaid"] = true,
		["mapID"] = 330,
		["lvl"] = 68,
		["groups"] = {
			e(1564, {	-- High King Maulgar
				["creatureID"] = 18831,
				["groups"] = {
					i(29763),	-- Pauldrons of the Fallen Champion
					i(29764),	-- Pauldrons of the Fallen Defender
					i(29762),	-- Pauldrons of the Fallen Hero
					i(28800),	-- Hammer of the Naaru
					i(28796),	-- Malefic Mask of the Shadows
					i(28801),	-- Maulgar's Warhelm
					i(28797),	-- Brute Cloak of the Ogre-Magi
					i(28795),	-- Bladespire Warbands
					i(28799),	-- Belt of Divine Inspiration
				},
			}),
			e(1565, {	-- Gruul the Dragonkiller
				["creatureID"] = 19044,
				["groups"] = {
					ach(692),	-- Gruul's Lair
					i(29766),	-- Leggings of the Fallen Champion
					i(29767),	-- Leggings of the Fallen Defender
					i(29765),	-- Leggings of the Fallen Hero
					i(28794),	-- Axe of the Gronn Lords
					i(28802),	-- Bloodmaw Magus-Blade				-- Confirmed by Crieve, 2019-07-07. Was Unobtainable since 7.3.5
					i(28825),	-- Aldori Legacy Defender
					i(28804),	-- Collar of Cho'gall				-- Confirmed by Crieve, 2019-07-07. Was Unobtainable since 7.3.5
					i(28803),	-- Cowl of Nature's Breath			-- Confirmed by Crieve, 2019-07-07. Was Unobtainable since 7.3.5
					i(28822),	-- Teeth of Gruul					-- Confirmed by Crieve, 2019-07-07. Was Unobtainable since 7.3.5
					i(28824),	-- Gauntlets of Martial Perfection
					i(28827),	-- Gauntlets of the Dragonslayer
					i(28828),	-- Gronn-Stitched Girdle
					i(28810),	-- Windshear Boots					-- Confirmed by Crieve, 2019-07-07. Was Unobtainable since 7.3.5
					i(28830),	-- Dragonspine Trophy
					i(28823),	-- Eye of Grull						-- Confirmed by Crieve, 2019-07-07. Was Unobtainable since 7.3.5
					i(31750),	-- Earthen Signet
				},
			})
		},
	}),
})};
