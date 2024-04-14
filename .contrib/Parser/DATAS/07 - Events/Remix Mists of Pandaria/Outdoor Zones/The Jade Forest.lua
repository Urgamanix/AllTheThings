-----------------------------------------------------
--     W O R L D   E V E N T S   M O D U L E       --
-----------------------------------------------------
root(ROOTS.WorldEvents, applyevent(EVENTS.REMIX_MOP, n(REMIX_MOP, bubbleDown({ ["timeline"] = { ADDED_10_2_7, REMOVED_REMIX } }, {
	m(THE_JADE_FOREST, {
		["icon"] = "Interface\\Icons\\achievement_zone_jadeforest",
		["g"] = {
			n(ACHIEVEMENTS, {
				ach(20026, {	-- Explore Jade Forest
					crit(65919),	-- Tian Monastery
					crit(65920),	-- Dawn's Blossom
					crit(65921),	-- Dreamer's Pavillion
					crit(65922),	-- Emperor's Omen
					crit(65923),	-- Pearl Lake
					crit(65924),	-- Grookin Hill
					crit(65925),	-- Greenstone Quarry
					crit(65926),	-- Nectarbreeze Orchard
					crit(65927),	-- Camp Nooka Nooka
					crit(65928),	-- Terrace of Ten Thunders
					crit(65929),	-- Serpent's Heart
					crit(65930),	-- Slingtail Pits
					crit(65931),	-- Temple of the Jade Serpent
					crit(65932),	-- The Arboretum
					crit(65933),	-- Garrosh'ar Point
					crit(65934),	-- Windward Isle
					crit(65935),	-- Honeydew Village
				}),
				ach(19872, {	-- The Jade Forest
					-- Meta Achievement
					["sym"] = {{"meta_achievement",
						19882,	-- Campaign: The Jade Forest [A]
						19883,	-- Campaign: The Jade Forest [H]
						20008,	-- Looking For Group: The Jade Forest
						19912,	-- Order of the Cloud Serpent
						19962,	-- Tour The Jade Forest
					}},
					["g"] = {
						i(220777),	-- Cherry Blossom Trail (TOY!)
					},
				}),
				ach(19977, {	-- Hidden Treasures: The Jade Forest
					crit(65478, {	-- Ship's Storage
						["_quests"] = { 31396 },
					}),
					crit(65479, {	-- Ancient Pandaren Tea Pot
						["_quests"] = { 31400 },
					}),
					crit(65480, {	-- Lucky Pandaren Coin
						["_quests"] = { 31401 },
					}),
					crit(65481, {	-- Pandaren Ritual Stone
						["_quests"] = { 31404 },
					}),
				}),
			}),
			n(QUESTS, {
				q(81638, {	-- Home Is Where the Hearthstone Is
					--["sourceQuests"] = { 79440 },	-- Recalling the War (need to confirm)
					["provider"] = { "n", 65907 },	-- Jiayi Applebloom
					["coord"] = { 44.8, 84.4, THE_JADE_FOREST },
				}),
				q(80012, {	-- Dragonriding
					["sourceQuests"] = { 79440 },	-- Recalling the War
					["provider"] = { "n", 218468 },	-- Moratari
					["coord"] = { 28.5, 14.0, THE_JADE_FOREST },	-- missing ally coords
				}),
				q(80013, {	-- How to Glide with Your Dragon
					["sourceQuests"] = { 80012 },	-- Dragonriding
					["provider"] = { "n", 218469 },	-- Lord Anderstrasz
					["coord"] = { 65.2, 37.2, THE_JADE_FOREST },
					["g"] = {
						i(216712),	-- Bronze Timepiece (QI!)
					},
				}),
				q(80015, {	-- How to Dive with Your Dragon
					["sourceQuests"] = { 80013 },	-- How to Glide with Your Dragon
					["provider"] = { "n", 218469 },	-- Lord Anderstrasz
					["coord"] = { 65.2, 37.2, THE_JADE_FOREST },
					["g"] = {
						i(216712),	-- Bronze Timepiece (QI!)
					},
				}),
				q(80016, {	-- The Need For Higher Velocities
					["sourceQuests"] = { 80015 },	-- How to Dive with Your Dragon
					["provider"] = { "n", 218469 },	-- Lord Anderstrasz
					["coord"] = { 65.2, 37.2, THE_JADE_FOREST },
					["g"] = {
						i(216712),	-- Bronze Timepiece (QI!)
					},
				}),
				q(80017, {	-- The Need For Higher Altitudes
					["sourceQuests"] = { 80016 },	-- The Need For Higher Velocities
					["provider"] = { "n", 218469 },	-- Lord Anderstrasz
					["coord"] = { 65.2, 37.2, THE_JADE_FOREST },
					["g"] = {
						i(216712),	-- Bronze Timepiece (QI!)
					},
				}),
				q(80018, {	-- Fashionable Flying
					["sourceQuests"] = { 80017 },	-- The Need For Higher Altitudes
					["provider"] = { "n", 218469 },	-- Lord Anderstrasz
					["coord"] = { 65.2, 37.2, THE_JADE_FOREST },
				}),
				q(80349, {	-- Time to Return
					["sourceQuests"] = { 80018 },	-- Fashionable Flying
					["provider"] = { "n", 218469 },	-- Lord Anderstrasz
					["coord"] = { 65.2, 37.2, THE_JADE_FOREST },
				}),
				q(79489, {	-- Gems of Power
					["sourceQuests"] = { 79440 },	-- Recalling the War
				}),
				q(80196, {	-- Extract a Gem
					["sourceQuests"] = { 79489 },	-- Gems of Power
				}),
				q(80197, {	-- Combine Gems
					["sourceQuests"] = { 80196 },	-- Extract a Gem
				}),
				q(78893, {	-- A Scrap of Bronze
					["sourceQuests"] = { 79440 },	-- Recalling the War
					["provider"] = { "i", 210526 },	-- Unraveling Tunic (QI!)
				}),
				q(81976, {	-- Bazaar, Isn't It?
					--["sourceQuests"] = { xx },	-- TODO: some of level up/turn in HQTs?
					["provider"] = { "n", 222186 },	-- Nostwin
					["coord"] = { 45.8, 84.7, THE_JADE_FOREST },	-- missing horde coords
					["g"] = {
						i(217930), -- Nostwin's Voucher
					},
				}),
				q(78894, {	-- Infinite Growth
					--["sourceQuests"] = { 81976 },	-- Bazaar, Isn't It? / unsure since I didn't teleport right after I get voucher
					["provider"] = { "n", 213664 },	-- Momentus
					["coord"] = { 42.5, 27.3, THE_JADE_FOREST },
				}),
			}),
			n(REWARDS, {
				filter(MAIL, {
					------ Trailseeker's Laminar Armor (Black) ------
					-- Looks to be this set from Jade Forest?
					i(214460),	-- Windreaver's Belt
					i(214457),	-- Windreaver's Boots
					i(214454),	-- Windreaver's Bracers
					i(214459),	-- Windreaver's Gauntlets
					i(214456),	-- Windreaver's Hauberk
					i(214458),	-- Windreaver's Helm
					i(214463),	-- Windreaver's Leggings
					i(214461),	-- Windreaver's Spaulders
				}),
			}),
		},
	}),
}))));