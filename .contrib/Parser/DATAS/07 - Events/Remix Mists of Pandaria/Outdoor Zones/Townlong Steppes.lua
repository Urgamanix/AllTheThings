-----------------------------------------------------
--     W O R L D   E V E N T S   M O D U L E       --
-----------------------------------------------------
root(ROOTS.WorldEvents, applyevent(EVENTS.REMIX_MOP, n(REMIX_MOP, bubbleDown({ ["timeline"] = { ADDED_10_2_7, REMOVED_MOP_REMIX_END } }, {
	m(TOWNLONG_STEPPES, {
		["icon"] = "Interface\\Icons\\achievement_zone_townlongsteppes",
		["g"] = {
			n(ACHIEVEMENTS, {
				ach(19889),		-- Campaign: Townlong Steppes
				ach(19997),		-- Elusive Foes: Townlong Steppes
				ach(20030, bubbleDown({ ["_noautomation"] = true, }, {	-- Explore Townlong Steppes
					crit(65984),	-- Gao-Ran Battlefront
					crit(65985),	-- Kri'vess
					crit(65986),	-- Rensai's Watchpost
					crit(65987),	-- Niuzao Temple
					crit(65988),	-- Fire Camp Osul
					crit(65989),	-- Hatred's Vice
					crit(65990),	-- Shado-Pan Garrison
					crit(65991),	-- Shan'ze Dao
					crit(65992),	-- Sik'vess
					crit(65993),	-- Sra'vess
					crit(65994),	-- The Sumprushes
				})),
				ach(19981, {	-- Hidden Treasures: Townlong Steppes
					crit(65491, {	-- Fragment of Dread
						["_quests"] = { 31423 },
					}),
					crit(65492, {	-- Hardened Sap of Kri'vess
						["_quests"] = { 31424 },
					}),
					crit(65493, {	-- Amber Encased Moth
						["_quests"] = { 31426 },
					}),
					crit(65494, {	-- Abandoned Crate of Goods
						["_quests"] = { 31427 },
					}),
				}),
				ach(20012, {	-- Looking For Group: Townlong Steppes
					-- Meta Achievement
					["sym"] = {{"meta_achievement",
						19930,	-- Assault on Zan'vess
						19900,	-- Siege of Niuzao Temple
					}},
				}),
				ach(19914),		-- Shado-Pan
				ach(19966, {	-- Tour Townlong Steppes
					-- Meta Achievement
					["sym"] = {{"meta_achievement",
						19997,	-- Elusive Foes: Townlong Steppes
						20030,	-- Explore Townlong Steppes
						19981,	-- Hidden Treasures: Townlong Steppes
					}},
				}),
				ach(19877, {	-- Townlong Steppes
					-- Meta Achievement
					["sym"] = {{"meta_achievement",
						19889,	-- Campaign: Townlong Steppes
						20012,	-- Looking For Group: Townlong Steppes
						19914,	-- Shado-Pan
						19966,	-- Tour Townlong Steppes
					}},
					["g"] = {
						i(221817),	-- Muskpaw Calf (PET!)
					},
				}),
			}),
			n(QUESTS, {
				q(80430, {	-- Aid the August Celestials
					["repeatable"] = true,
					["provider"] = { "n", 61584 },	-- Sentinel Commander Qipan
					["coord"] = { 39.3, 62.0, TOWNLONG_STEPPES },
				}),
				q(80426, {	-- Aid the Shado-Pan
					["repeatable"] = true,
					["provider"] = { "n", 63009 },	-- Master Snowdrift
					["coord"] = { 49.3, 70.6, TOWNLONG_STEPPES },
				}),
			}),
			n(ZONE_REWARDS, {
				filter(CLOTH, {
					i(213687),	-- Mistwalker's Amice
					i(213686),	-- Mistwalker's Belt
					i(213689),	-- Mistwalker's Cowl
					i(213685),	-- Mistwalker's Cuffs
					i(213690),	-- Mistwalker's Handwraps
					i(213688),	-- Mistwalker's Pants
					i(213692),	-- Mistwalker's Raiment
					i(213691),	-- Mistwalker's Treads
				}),
				filter(LEATHER, {
					i(214086),	-- Springrain Belt
					i(214089),	-- Springrain Boots
					i(214091),	-- Springrain Bracers
					i(214087),	-- Springrain Gloves
					i(214088),	-- Springrain Helm
					i(214084),	-- Springrain Leggings
					i(214085),	-- Springrain Shoulderpads
					i(214090),	-- Springrain Tunic
				}),
				filter(MAIL, {
					i(214525),	-- Streamspeaker Breastplate
					i(214524),	-- Streamspeaker Footguards
					i(214521),	-- Streamspeaker Girdle
					i(214522),	-- Streamspeaker Grips
					i(214523),	-- Streamspeaker Helmet
					i(214519),	-- Streamspeaker Legwraps
					i(214520),	-- Streamspeaker Mantle
					i(214526),	-- Streamspeaker Wristguards
				}),
				filter(PLATE, {
					i(214793),	-- Bladesworn Battleplate
					i(214798),	-- Bladesworn Greatbelt
					i(214796),	-- Bladesworn Greathelm
					i(214797),	-- Bladesworn Handguards
					i(214800),	-- Bladesworn Legplates
					i(214799),	-- Bladesworn Spaulders
					i(214794),	-- Bladesworn Vambraces
					i(214795),	-- Bladesworn Warboots
				}),
				n(WEAPONS, {
					i(215871),	-- Amberweaver's Conduit
					i(215870),	-- Amberweaver's Rod (drop)
					i(215980),	-- Binan Falchion
					i(215558),	-- Cloudbender's Crossbow (chest)
					i(215803),	-- Dragonguard's Glaive (drop)
					i(215890),	-- Hopespreader's Staff (drop)
					i(215763),	-- Hozen Basher
					i(215621),	-- Imperial Warknife
					i(215894),	-- Jinyu Conduit
					i(215987),	-- Jinyu Greatblade
					i(215540),	-- Jinyu Shortbow (chest)
					i(215650),	-- Pandaren Claw (drop)
					i(215758),	-- Saurok Scepter
					i(215866),	-- Staff of Focus (drop)
					i(215590),	-- Shomi's Shanker
					i(215957),	-- Tian Monastery Saber
					i(215700),	-- Trailseeker Longrifle (chest)
					i(215519),	-- Uroe, Harbinger of Fear (chest)
					i(215512),	-- Wallwatcher's Poleaxe
					i(215495),	-- Yaungol Hatchet
				}),
			}),
		},
	}),
}))));