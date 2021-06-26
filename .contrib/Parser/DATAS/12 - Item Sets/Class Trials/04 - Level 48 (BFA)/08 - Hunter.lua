-----------------------------------------------------
--       G E A R     S E T S     M O D U L E       --
-----------------------------------------------------

_.GearSets =
{
	n(-5350, {	-- Class Trial Item Sets
		n(-154, {	-- Level 48
			n(-150, {	-- Trailseeker
				["classes"] = { HUNTER },
				["groups"] = {
					i(160439, {	-- Adventurer's Footlocker
						i(153813),	-- Trailseeker Shotgun
						i(153814),	-- Trailseeker Spear
					}),
					i(153813),	-- Trailseeker Shotgun
					i(153808),	-- Trailseeker Helm
					i(153800),	-- Trailseeker Choker
					i(153810),	-- Trailseeker Spaulders
					i(153799),	-- Trailseeker Cloak of Rage
					i(153805),	-- Trailseeker Vest
					i(153812),	-- Trailseeker Bracers
					i(153807),	-- Trailseeker Gauntlets
					i(153811),	-- Trailseeker Belt
					i(153809),	-- Trailseeker Legguards
					i(153806),	-- Trailseeker Greaves
					i(153802),	-- Trailseeker Band of Onslaught
					i(153803),	-- Trailseeker Ring of Onslaught
					i(153804),	-- Trailseeker Stone of Rage
					i(153801),	-- Trailseeker Idol of Rage
				},
			}),
		}),
	}),
};
_.NeverImplemented = bubbleDown({ ["u"] = NEVER_IMPLEMENTED }, {
	n(-9982, {	-- Legion
		n(-5350, {	-- Class Trial Item Sets
			n(-150, {	-- Trailseeker
				["classes"] = { HUNTER },
				["groups"] = {
					-- added 7.2.5/Confirmed
					i(150642),	-- Trailseeker Spaulders
					i(150637),	-- Trailseeker Vest
					i(150638),	-- Trailseeker Greaves
					i(150639),	-- Trailseeker Gauntlets
					i(150640),	-- Trailseeker Helm
					i(150641),	-- Trailseeker Legguards
					i(150643),	-- Trailseeker Belt
					i(150644),	-- Trailseeker Bracers
				},
			}),
		}),
	}),
});