---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------
_.Zones =
{
	m(12, {	-- Kalimdor
		m(83, {	-- Winterspring
			n(RARES, {
				n(51045,  {	-- Arcanus
					["coord"] = { 48.0, 59.6, 83 },
				}), 
				n(10202,  {	-- Azurous
					["coords"] = {
						{ 58.0, 56.0, 83 },
						{ 59.8, 53.8, 83 },
						{ 61.2, 54.6, 83 },
						{ 63.0, 54.8, 83 },
						{ 65.6, 58.0, 83 },
						{ 65.8, 61.0, 83 },
						{ 65.8, 64.6, 83 },
						{ 66.0, 67.8, 83 },
					},
				}), 
				n(50997,  {	-- Bornak the Gorer
					["coords"] = {
						{ 59.6, 17.4, 83 },
						{ 62.4, 24.8, 83 },
					},
				}), 
				n(50995,  {	-- Bruiser
					["coord"] = { 65.6, 42.8, 83 },
				}), 
				o(240616, {	-- Frozen Supplies
					["description"] = "|cff66ccffLoot the Frozen Supplies in a nook at the base of the pillar.|r",
					["model"] = 874403,
					["coord"] = { 68.0, 73.9, 83 },
					["g"] = {	
						i(122224),	-- Music Roll: Mountains
					},
				}), 					
				n(50993,  {	-- Gal'dorak
					["coord"] = { 35.6, 48.8, 83 },
				}), 
				n(10196,  {	-- General Colbatann
					["coords"] = {
						{ 55.8, 64.6, 83 },
						{ 57.2, 65.8, 83 },
						{ 58.6, 65.6, 83 },
						{ 59.4, 65.0, 83 },
						{ 60.6, 64.0, 83 },
						{ 62.8, 63.6, 83 },
					},
				}), 
				n(10199,  {	-- Grizzle Snowpaw
					["coord"] = { 68.6, 50.2, 83 },
				}), 
				n(50819,  {	-- Iceclaw
					["coord"] = { 52.0, 18.8, 83 },
				}), 
				n(10198,  {	-- Kashoch the Reaver
					["coord"] = { 61.2, 83.8, 83 },
				}), 
				n(50353,  {	-- Manas
					["coord"] = { 64.0, 80.0, 83 },
				}), 
				n(10197,  {	-- Mezzir the Howler
					["coord"] = { 24.2, 51.6, 83 },
				}), 
				n(50348,  {	-- Norissis
					["coord"] = { 59.6, 24.0, 83 },
				}), 
				n(14457,  {	-- Princess Tempestria
					["description"] = "This rare was only available during the Elemental Invasions.",
					["u"] = REMOVED_FROM_GAME,
					["g"] = {
						un(REMOVED_FROM_GAME, i(21548)),	-- Pattern: Stormshroud Gloves
						un(REMOVED_FROM_GAME, i(18678)), 	-- Tempestria's Frozen Necklace
						un(REMOVED_FROM_GAME, i(18679)),	-- Frigid Ring
					},
				}),
				n(50788,  {	-- Quetzl
					["coord"] = { 67.0, 83.6, 83 },
				}), 
				n(10200,  {	-- Rak'shiri
					["coords"] = {
						{ 47.6, 18.2, 83 },
						{ 47.0, 19.6, 83 },
						{ 46.2, 18.6, 83 },
					},
				}),		
				n(50346,  {	-- Ronak
					["coord"] = { 59.6, 42.8, 83 },
				}), 
				n(10741,  {	-- Sian-Rotam
					["coord"] = { 45.8, 17.6, 83 },
				}), 
				n(51028,  {	-- The Deep Tunneler
					["coord"] = { 50.6, 72.2, 83 },
				}),
			}),
		}),
	}),
};
