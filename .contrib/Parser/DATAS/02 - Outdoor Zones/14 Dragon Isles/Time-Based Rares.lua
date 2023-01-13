---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------
root("Zones", m(DRAGON_ISLES, bubbleDown({ ["timeline"] = TIMELINE_DF_REL }, {
	n(RARES, {
		n(-1143, {	-- Every 2 Hours Rare
			["description"] = "These rares spawn on a fixed timer & will be marked with a skull on the map if you are in the respective zone.\n\nEU: 6am CET 8am CET and so on\n\nNA: 7am PST 9am PST and so on",
			["g"] = {
				-- Thaldraszus
				n(193220, {	-- Broodweaver Araznae <Mother of Spiders>
					["coord"] = { 59.6, 70.1, THALDRASZUS },
					["questID"] = 73987,
					["g"] = {
						-- is part of the DF>Global Rare Loottable
						-- specfic drops
						i(200758),	-- Breastplate of Storied Antiquity (needs to move to a CBD somehow sometime for certain Rares)
						i(200147),	-- Web-Woven Robe
					},
				}),
				n(193234, {	-- Eldoren the Reborn <Jewel of the Skies>
					["coord"] = { 49.0, 51.0, THALDRASZUS },
					["questID"] = 73990,
					["g"] = {
						i(200284),	-- Phoenix Feather Pendant
					},
				}),
				n(193210, {	-- Phleep <Time-Lost, Mind-Lost>
					["coord"] = { 57.2, 84.2, THALDRASZUS },
					["questID"] = 74021,
					["g"] = {
						i(200148),	-- A Collection of Me (TOY!)
						i(200126),	-- Mantle of Copious Chronologies
						i(200202),	-- Tomorrow's Chains
						i(197008),	-- Cliffside Wylderdrake: Narrow Stripes Pattern (DM!)
					},
				}),
				-- The Azure Spawn
				n(193251, {	-- Gruffy
					["coord"] = { 32.7, 29.2, THE_AZURE_SPAN },
					-- ["questID"] = 69885,
					["g"] = {
						i(200755),	-- Gruffy's Dented Horn
					},
				}),
				n(193135, {	-- Azra's Prized Peony
					["coord"] = { 54.9, 71.1, THE_WAKING_SHORES },
					["questID"] = 73984,
					["g"] = {
						i(200259),	-- Forest Dweller's Shield
						i(197398),	-- Renewed Proto-Drake: Snub Snout (DM!)
						i(197121),	-- Highland Drake: Tan Horns (DM!)
						i(200229),	-- Slightly Digested Leggings
					},
				}),
				n(192737, {	-- Qalashi War Mammoth
					["description"] = "Marked with an icon on the map if they are up.",
					["coords"] = {
						{ 33.8, 70.4, THE_WAKING_SHORES },
						{ 39.2, 68.2, THE_WAKING_SHORES },
						{ 47.0, 73.0, THE_WAKING_SHORES },
						{ 48.4, 65.8, THE_WAKING_SHORES },
						{ 53.0, 66.4, THE_WAKING_SHORES },
					},
					["questID"] = 73890,
					-- He "drops" 4 rare npcs upon dieing, but they have no drops. CRS doesnt seem useful
					["g"] = {
						n(192738, {	-- Brundin the Dragonbane
						}),
						n(192741, {	-- Flamebreaker Grella
						}),
						n(192744, {	-- Scalemelter Dorbane
						}),
						n(192743, {	-- Stonefist Rejara
						}),
					},
				}),
				-- The Ohnharan Plains
				n(193170, {	-- Fulgurb
					["coord"] = { 74.4, 47.6, OHNAHRAN_PLAINS },
					["questID"] = 73994,
					["isDaily"] = true,
					["g"] = {
						i(200433),	-- Footwraps of Subjugation
					},
				}),
				-- The Waking Shores
				n(193132, {	-- Amethyzar the Glittering
					["coord"] = { 63.4, 54.8, THE_WAKING_SHORES },
					["questID"] = 73981,
					["g"] = {
						i(200156),	-- Amethyzarite Geode
					},
				}),
			},
		}),
	}),
})));