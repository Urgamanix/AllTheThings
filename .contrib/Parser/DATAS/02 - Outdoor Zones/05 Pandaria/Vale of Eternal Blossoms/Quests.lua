---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

_.Zones =
{
	m(424, {	-- Pandaria
		m(390, {	-- Vale of Eternal Blossoms
			n(QUESTS, {
				q(33229, {	-- A Flash of Bronze...
					["hordeQuestID"] = 33230,	-- A Flash of Bronze...
					["provider"] = { "n", 73691 },	-- Chromie <The Timewalkers>
					["isBreadcrumb"] = true,
				}),
				q(37188, {	-- A Flash of Bronze...
					["isBreadcrumb"] = true,
					["provider"] = { "n", 73691 },	-- Chromie <The Timewalkers>
					["u"] = NEVER_IMPLEMENTED,
				}),
				q(37194, {	-- A Flash of Bronze...
					["isBreadcrumb"] = true,
					["provider"] = { "n", 73691 },	-- Chromie <The Timewalkers>
					["u"] = NEVER_IMPLEMENTED,
				}),
				q(31376, {	-- Attack At The Temple of the Jade Serpent
					["sourceQuests"] = { 31512 },	-- A Witness to History
					["provider"] = { "n", 64032 },	-- Sage Whiteheart
					["isDaily"] = true,
					["coord"] = { 84.6, 63.6, 390 },
					["races"] = ALLIANCE_ONLY,
				}),
				q(30642, {	-- Battle Axe of the Thunder King
					["u"] = REMOVED_FROM_GAME,
					["g"] = {
						i(90609, {	-- Mending Robes of the Golden Lotus
							["u"] = REMOVED_FROM_GAME,
						}),
						i(90607, {	-- Burning Robes of the Golden Lotus
							["u"] = REMOVED_FROM_GAME,
						}),
						i(90603, {	-- Durable Plate of the Golden Lotus
							["u"] = REMOVED_FROM_GAME,
						}),
						i(90602, {	-- Deadeye Chain of the Golden Lotus
							["u"] = REMOVED_FROM_GAME,
						}),
						i(90601, {	-- Bonded Plate of the Golden Lotus
							["u"] = REMOVED_FROM_GAME,
						}),
						i(90600, {	-- Ferocious Plate of the Golden Lotus
							["u"] = REMOVED_FROM_GAME,
						}),
						i(90599, {	-- Warming Chestguard of the Golden Lotus
							["u"] = REMOVED_FROM_GAME,
						}),
						i(90598, {	-- Crackling Chain of the Golden Lotus
							["u"] = REMOVED_FROM_GAME,
						}),
						i(90597, {	-- Delicate Chestguard of the Golden Lotus
							["u"] = REMOVED_FROM_GAME,
						}),
					},
				}),
				q(30266, {	-- Bloodied Skies
					["coord"] = { 21.3, 71.4, 390 },
					["isDaily"] = true,
					["provider"] = { "n", 58920 },	-- Kun Autumnlight
				}),
				q(31378, {	-- Challenge at the Temple of the Red Crane
					["sourceQuests"] = { 31512 },	-- A Witness to History
					["provider"] = { "n", 64032 },	-- Sage Whiteheart
					["isDaily"] = true,
					["coord"] = { 84.6, 63.6, 390 },
					["races"] = ALLIANCE_ONLY,
				}),
				q(31382, {	-- Defense At Niuzao Temple
					["sourceQuests"] = { 31512 },	-- A Witness to History
					["provider"] = { "n", 64032 },	-- Sage Whiteheart
					["isDaily"] = true,
					["coord"] = { 84.6, 63.6, 390 },
					["races"] = ALLIANCE_ONLY
				}),
				q(31876, {	-- The Inkmasters of the Arboretum
					["requireSkill"] = INSCRIPTION,
					["provider"] = { "n", 64691 },	-- Lorewalker Huynh
					["isWeekly"] = true,
					["coord"] = { 82.0, 29.4, 390 },
				}),
				q(33231, {	-- Journey to the Timeless Isle
					["hordeQuestID"] = 33232,	-- Journey to the Timeless Isle
					["provider"] = { "n", 73691 },	-- Chromie <The Timewalkers>
					["isBreadcrumb"] = true, 	-- Possible to skip if you just fly to the Isle after picking up Flash of Bronze
					["sourceQuests"] = {
						33229,	-- A Flash of Bronze...
						33230,	-- A Flash of Bronze...
						37188,	-- A Flash of Bronze...
						37194,	-- A Flash of Bronze...
					},
				}),
				q(30243, {	-- Mantid Under Fire
					["coord"] = { 21.3, 71.4, 390 },
					["isDaily"] = true,
					["provider"] = { "n", 58920 },	-- Kun Autumnlight
				}),
				q(32246, {	-- Meet the Scout (A)
					["provider"] = { "n", 64610 },	-- Lyalia
					["coord"] = { 84.0, 58.7, 390 },
					["races"] = ALLIANCE_ONLY,
				}),
				q(32249, {	-- Meet the Scout (H)
					["provider"] = { "n", 64566 },	-- Sunwalker Dezco
					["coord"] = { 62.8, 27.9, 390 },
					["races"] = HORDE_ONLY,
				}),
				q(30261, {	-- Roll Club: Serpent's Spine
					["coord"] = { 18.1, 63.5, 390 },
					["isDaily"] = true,
					["provider"] = { "n", 58704 },	-- Kelari Featherfoot
				}),
				q(30242, {	-- Survival Ring: Blades
					["coord"] = { 18.4, 71.5, 390 },
					["isDaily"] = true,
					["provider"] = { "n", 58743 },	-- Yumi Goldenpaw
				}),
				q(30240, {	-- Survival Ring: Flame
					["coord"] = { 18.4, 71.5, 390 },
					["isDaily"] = true,
					["provider"] = { "n", 58743 },	-- Yumi Goldenpaw
				}),
				q(31369, {	-- The Anglers
				--	if this quest is available, it requires fishing and never having approached the anglers' wharf on the character at all.  as soon as you approach (with fishing unlocked) you hit neutral with the faction.  (TODO: if someone tests this under those conditions and this breadcrumb is still unavailable, it needs to be marked removed)
					["isBreadcrumb"] = true,
					["provider"] = { "n", 64033 },	-- Master Angler Karu
					["races"] = ALLIANCE_ONLY,
					["coord"] = { 86.5, 60.2, 390 },
					["u"] = REMOVED_FROM_GAME,	-- A fresh Level10 with Fishing cant accept it and similar comments on WoWhead suggest its removed since 5.1.
				}),
				q(31103, {	-- The Ballad of Liu Lang
					["description"] = "The item that starts this quest is mailed to you after you finish the |cffefef01Ballad of Liu Lang|r achievement.",
					["provider"] = { "i", 83780 },	-- The Ballad of Liu Lang
				}),
				q(30306, {	-- The Battle Ring
					["coord"] = { 19.0, 75.4, 390 },
					["isDaily"] = true,
					["provider"] = { "n", 58962 },	-- Hai-Me Heavyhands
				}),
				q(31095, {	-- The Dark Heart of the Mogu
					["provider"] = { "i", 83772 },	-- The Dark Heart of the Mogu
					["description"] = "Complete achievement with the same name and you will get the item that starts the quest in the mail.",
				}),
				q(31384, {	-- The Golden Lotus (A)
					["isBreadcrumb"] = true,
					["coord"] = { 84.2, 62.4, 390 },
					["races"] = ALLIANCE_ONLY,
					["provider"] = { "n", 64031 },	-- Xari the Kind
				}),
				q(31385, {	-- The Golden Lotus (H)
					["isBreadcrumb"] = true,
					["coord"] = { 63.0, 22.2, 390 },
					["races"] = HORDE_ONLY,
					["provider"] = { "n", 64007 },	-- Weng the Merciful
				}),
				q(32806, {	-- The King and the Council
					["providers"] = {
						{ "n", 61962 },	-- Lorewalker Cho
						{ "n", 63577 },	-- Lorewalker Cho
					},
					["coord"] = { 83.2, 29.6, 390 },
					["maps"] = { 523 },	-- Dun Morogh (Blood in the Snow scenario)
					["lvl"] = 90,
					["g"] = {
						i(98133),	-- Greater Cache of Treasures
					},
				}),
				q(31390, {	-- The Klaxxi (A)
					["coord"] = { 84.4, 61.6, 390 },
					["races"] = ALLIANCE_ONLY,
					["provider"] = { "n", 64488 },	-- Riki the Shifting Shadow
					["isBreadcrumb"] = true,
				}),
				q(31391, {	-- The Klaxxi (H)
					["coord"] = { 63.2, 20.8, 390 },
					["races"] = HORDE_ONLY,
					["provider"] = { "n", 64534 },	-- Bowmaster Ku
					["isBreadcrumb"] = true,
				}),
				q(32815, {	-- The Old Seer
					["sourceQuests"] = { 32807 },	-- The Warchief and the Darkness
					["provider"] = { "n", 61962 },	-- Lorewalker Cho
				}),
				q(30280, {	-- The Thunder Below
					["coord"] = { 21.4, 71.5, 390 },
					["isDaily"] = true,
					["provider"] = { "n", 58919 },	-- Anji Autumnlight
				}),
				q(32807, {	-- The Warchief and the Darkness
					["sourceQuests"] = { 32806 },	-- The King and the Council
					["provider"] = { "n", 61962 },	-- Lorewalker Cho
					["coord"] = { 83.2, 29.6, 390 },
					["maps"] = { 520, 521 },	-- Vale of Eternal Blossoms (Dark Heart of Pandaria scenario)
					["lvl"] = 90,
					["g"] = {
						i(98133),	-- Greater Cache of Treasures
					},
				}),
				q(32679, {	-- Thunder Calls (A)
					["races"] = ALLIANCE_ONLY,
				}),
				q(32678, {	-- Thunder Calls (H)
					["coord"] = { 62.8, 28.0, 390 },
					["races"] = HORDE_ONLY,
					["provider"] = { "n", 64566 },	-- Sunwalker Dezco
				}),
				q(31380, {	-- Trial At The Temple of the White Tiger (A)
					["sourceQuests"] = { 31512 },	-- A Witness to History
					["provider"] = { "n", 64032 },	-- Sage Whiteheart
					["isDaily"] = true,
					["coord"] = { 84.6, 63.6, 390 },
					["races"] = ALLIANCE_ONLY,
				}),
				q(31381, {	-- Trial At The Temple of the White Tiger (H)
					["sourceQuests"] = { 31511 },	-- A Witness to History
					["provider"] = { "n", 64001 },	-- Sage Lotusbloom
					["isDaily"] = true,
					["coord"] = { 62.7, 23.3, 390 },
					["races"] = HORDE_ONLY,
				}),
				q(33134, {	-- Warforged Seals (A)
					["repeatable"] = true,
					["provider"] = { "n", 64029 },	-- Elder Lin
					["coord"] = { 85.2, 62.6, 390 },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 85,
				}),
				q(33133, {	-- Warforged Seals (H)
					["repeatable"] = true,
					["provider"] = { "n", 63996 },	-- Elder Liao
					["coord"] = { 62.0, 20.6, 390 },
					["races"] = HORDE_ONLY,
					["lvl"] = 85,
				}),
				--[[
				q(31383, {	-- Defense At Niuzao Temple
					["races"] = HORDE_ONLY
				}),
				q(31387, {	-- Understanding The Shado-Pan
					["races"] = ALLIANCE_ONLY
				}),
				q(31389, {	-- Understanding The Shado-Pan
					["races"] = HORDE_ONLY
				}),
				]]--
			}),
		}),
	}),
};
