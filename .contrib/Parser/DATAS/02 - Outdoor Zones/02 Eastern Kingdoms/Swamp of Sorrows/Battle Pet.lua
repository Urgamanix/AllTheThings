---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

_.Zones =
{
	m(EASTERN_KINGDOMS, {
		m(SWAMP_OF_SORROWS, {
			filter(101, {	-- Pet Battle
				p(648, {	-- Huge Toad
					["crs"] = { 61368 },	-- Huge Toad
				}),
				p(422, {	-- Moccasin
					["crs"] = { 61372 },	-- Moccasin
				}),
				p(403, {	-- Parrot
					["crs"] = { 61313 },	-- Parrot
				}),
				p(401, {	-- Strand Crab
					["crs"] = { 61312 },	-- Strand Crab
				}),
				p(402, {	-- Swamp Moth
					["crs"] = { 61370 },	-- Swamp Moth
				}),
				p(420, {	-- Toad
					["crs"] = { 61369 },	-- Toad
				}),
				p(418, {	-- Water Snake
					["crs"] = { 61367 },	-- Water Snake
				}),
				q(31913, {	-- Everessa
					["provider"] = { "n", 66518 },	-- Everessa
					["coord"] = { 76.8, 41.4, SWAMP_OF_SORROWS },
					["isDaily"] = true,
				}),
			}),
		}),
	}),
};
