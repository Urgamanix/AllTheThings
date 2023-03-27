-----------------------------------------------------
--        P R O M O T I O N S   M O D U L E        --
-----------------------------------------------------
root(ROOTS.Promotions, {
	n(-584, {	-- Dragonflight Seasonal Promotions
		["timeline"] = { "added 10.0.0.46366" },
		["description"] = "These promotions happened during the time Dragonflight was the most recent content between 25th October 2022 & 12nd November 2024.\n\nThey are listed in the order of their first appearance.",
		["groups"] = {
			-- "Pre" Season
			mount(315132, {	-- Gargantuan Grrloc (MOUNT!)
				["description"] = "Obtained if you set up a 12-Month WoW Subscription. Promotion valid through January 15, 2023.",
				["timeline"] = { "added 10.0.0.46366" },
				["u"] = REMOVED_FROM_GAME,
			}),
			mount(381529, {	-- Telix the Stormhorn (MOUNT!)
				["description"] = "Obtained if you set up a 12-Month WoW Subscription. Promotion valid through January 15, 2023.",
				["timeline"] = { "added 10.0.0.46366" },
				["u"] = REMOVED_FROM_GAME,
			}),
			i(34493, {	-- Dragon Kite (PET!)
				["description"] = "Obtained through watching Twitch Streamers with Drops enabled for at least 4 hours between November 15th, 03:00 p.m. & November 18th, 11:59 p.m. PST.\n\nYour Twitch account has to be connected with your Battle.net Account & you have to redeem the drop on Twitch before receiving it in your in-game collection as gift.",
				["timeline"] = {
					ADDED_10_0_2,
					"removed 10.0.2.46702",	-- After November 17th, 11:59 p.m. PST
				},
			}),
			i(79771, {	-- Fel Drake (MOUNT!)
				["description"] = "Obtained through watching Twitch Streamers with Drops enabled for at least 4 hours between November 28th, 03:00 p.m. & December 1st, 11:59 p.m. PST.\n\nYour Twitch account has to be connected with your Battle.net Account & you have to redeem the drop on Twitch before receiving it in your in-game collection as gift.",
				["timeline"] = {
					ADDED_10_0_2_LAUNCH,
					"removed 10.0.2.46879",	-- After December 1st 2022
				},
			}),
			i(190583, {	-- Ichabod (PET!)
				["description"] = "Obtained by gifting an eligible creator's channel two Twitch subscriptions between November 28th, 03:00 p.m. & December 12th, 11:59 p.m. PST.\n\nYour Twitch account has to be connected with your Battle.net Account & you have to redeem the drop on Twitch before receiving it in your in-game collection as gift.",
				["timeline"] = {
					ADDED_10_0_2_LAUNCH,
					"removed 10.0.2.46999",
				},
			}),
			i(70099, {	-- Cenarion Hatchling (PET!)
				["description"] = "Obtained through watching the Race to World First streams with Drops enabled for at least 4 hours between December 9th, 12:00 a.m. & December 13th, 02:59 p.m. PST.\n\nYour Twitch account has to be connected with your Battle.net Account & you have to redeem the drop on Twitch before receiving it in your in-game collection as gift.",
				["timeline"] = {
					"added 10.0.2.46924",
					"removed 10.0.2.47067",
				},
			}),
			i(92724, {	-- Swift Windsteed (MOUNT!)
				["description"] = "Obtained through watching the Race to World First streams with Drops enabled for at least 8 hours between December 9th, 12:00 a.m. & December 13th, 02:59 p.m. PST.\n\nYour Twitch account has to be connected with your Battle.net Account & you have to redeem the drop on Twitch before receiving it in your in-game collection as gift.",
				["timeline"] = {
					"added 10.0.2.46924",
					"removed 10.0.2.47067",
				},
			}),
			-- Season 1
			i(49703, {	-- Perpetual Purple Firework (TOY!)
				["description"] = "Obtained through watching select Twitch Streamers with Drops enabled for at least 2 hours between December 13th, 03:00 p.m. & December 28th, 11:59 p.m. PST.\n\nYour Twitch account has to be connected with your Battle.net Account & you have to redeem the drop on Twitch before receiving it in your in-game collection as gift.",
				["timeline"] = {
					"added 10.0.2.47067",
					"removed 10.0.2.47213",
				},
			}),
			i(203716, {	-- Thundering Banner of the Aspects (TOY!)
				["description"] = "Mythic Dungeon International: DF Season 1\n\nThe Mythic Dungeon International (MDI) returns with its global competitions for its 7th year, pitting the best Mythic Dungeon teams in a head-to-head race to the finish line.\n\nAll registered teams that complete under time the two dungeons within the Proving Grounds will receive the exclusive Thundering Banner of the Aspects to use in-game!\nSign-ups close 27 January 2022 1PM PDT and The Proving Grounds are on 1 February 1PM PDT - 8 February (US) 1PM PDT.",
				["timeline"] = { ADDED_10_0_5, REMOVED_10_0_7 },
			}),
			i(35227, {	-- Goblin Weather Machine - Prototype 01-B (TOY!)
				["description"] = "Obtained through watching select Twitch Streamers with Drops enabled for at least 4 hours between February 1st, 10:00 a.m. & February 5th, 11:59 p.m. PST.\n\nYour Twitch account has to be connected with your Battle.net Account & you have to redeem the drop on Twitch before receiving it in your in-game collection as gift.",
				["timeline"] = {
					"added 10.0.5.47884",
					"removed 10.0.5.47936",
				},
			}),
			i(38301, {	-- D.I.S.C.O. (TOY!)
				["description"] = "Obtained through watching select Twitch Streamers with Drops enabled for at least 4 hours between February 21st, 10:00 a.m. & April 2nd, 11:59 p.m. PST.\n\nYour Twitch account has to be connected with your Battle.net Account & you have to redeem the drop on Twitch before receiving it in your in-game collection as gift.",
				["timeline"] = { ADDED_10_0_7 },
			}),
		},
	}),
});