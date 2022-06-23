---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

root("Zones", m(KUL_TIRAS, bubbleDown({ ["timeline"] =  { "added 8.2.0" } }, {
	m(MECHAGON, {
		n(ACHIEVEMENTS, {
			ach(13790, {	-- Armed for Action
				["description"] = "Each criteria can be earned by creating weapons with Rocket-Chief Fuselage during the |cFFffd200Toys for Destruction|r daily.",
				["g"] = {
					crit(1, {	-- Volatile Blaster
						["_quests"] = { 54090 },	-- Toys For Destruction
					}),
					crit(2, {	-- Ricket's Special Delivery
						["_quests"] = { 54090 },	-- Toys For Destruction
					}),
					crit(3, {	-- Lightning Zap 5000
						["_quests"] = { 54090 },	-- Toys For Destruction
					}),
					crit(4, {	-- Supercollider
						["_quests"] = { 54090 },	-- Toys For Destruction
					}),
					crit(5, {	-- Boltspitter
						["_quests"] = { 54090 },	-- Toys For Destruction
					}),
				},
			}),
			ach(13513, {	-- Available in Eight Colors (unlocks paint: Battletorn Blue)
				crit(1, {	-- Big-ol Bronze
					["_quests"] = { 55517 },	-- Paint Vial: Big-ol Bronze
				}),
				crit(2, {	-- Fel Mint Green
					["_quests"] = { 55452 },	-- Paint Vial: Fel Mint Green
				}),
				crit(3, {	-- Mechagon Gold
					["_quests"] = { 55455 },	-- Paint Vial: Mechagon Gold
				}),
				crit(4, {	-- Copper Trim
					["_quests"] = { 55456 },	-- Paint Vial: Copper Trim
				}),
				crit(5, {	-- Lemonade Steel
					["_quests"] = { 55454 },	-- Paint Vial: Lemonade Steel
				}),
				crit(6, {	-- Fireball Red
					["_quests"] = { 55451 },	-- Paint Vial: Fireball Red
				}),
				crit(7, {	-- Overload Orange
					["_quests"] = { 55457 },	-- Paint Vial: Overload Orange
				}),
			}),
			ach(13472),	-- Deep Pockets
			ach(13473, {	-- Diversed Investments
				crit(1),	-- Flame Turret
				crit(2),	-- Drill Rig
				crit(3),	-- Charging Station
				crit(4),	-- Rustbolt Armory
				crit(5),	-- Reclamation Rig
			}),
			ach(13623, {	-- Fighting on Two Fronts
				["collectible"] = false,
				["g"] = {
					crit(2),	-- Kill Players in Mechagon
				},
			}),
			ach(13482),	-- Head Financier of Mechagon
			ach(13555, {	-- Junkyard Tinkmaster
				-- Meta Achievement should symlink the contained Achievements from Source
				["sym"] = {
					{"select","achievementID",
						13476,	-- Junkyard Tinkerer
						13482,	-- Head Financier of Mechagon
					},
				},
				["g"] = {
					title(403),	-- Junkyard
				},
			}),
			ach(13477),	-- Junkyard Apprentice
			ach(13479, {	-- Junkyard Architect
				crit(1, {	-- Scrap Grenade
					["_quests"] = { 55101 },	-- Junkyard Tinkering and You
				}),
				crit(2, {	-- Scrap Trap
					["_quests"] = { 55030 },	-- Blueprint: Scrap Trap
				}),
				crit(3, {	-- Hundred-Fathom Lure
					["_quests"] = { 55055, }	-- Build a Bigger Fish Trap
				}),
				crit(4, {	-- Mechanocat Laser Pointer
					["_quests"] = { 55056 },	-- Blueprint: Mechanocat Laser Pointer
				}),
				crit(5, {	-- Canned Minnows
					["_quests"] = { 55057 },	-- Blueprint: Canned Minnows
				}),
				crit(6, {	-- Vaultbot Key
					["_quests"] = { 55058 },	-- Blueprint: Vaultbot Key
				}),
				crit(7, {	-- Emergency Repair Kit
					["_quests"] = { 55059 },	-- Blueprint: Emergency Repair Kit
				}),
				crit(8, {	-- Emergency Powerpack
					["_quests"] = { 55060 },	-- Blueprint: Emergency Powerpack
				}),
				crit(9, {	-- Mechano-Treat
					["_quests"] = { 55061 },	-- Blueprint: Mechano-Treat
				}),
				crit(10, {	-- Ultrasafe Transporter: Mechagon
					["_quests"] = { 55062 },	-- Blueprint: Ultrasafe Transporter: Mechagon
				}),
				crit(11, {	-- G99.99 Landshark
					["_quests"] = { 55063 },	-- Blueprint: G99.99 Landshark
				}),
				crit(12, {	-- Rustbolt Gramophone
					["_quests"] = { 55064 },	-- Blueprint: Rustbolt Gramophone
				}),
				crit(13, {	-- Rustbolt Kegerator
					["_quests"] = { 55065 },	-- Blueprint: Rustbolt Kegerator
				}),
				crit(14, {	-- Beastbot Powerpack
					["_quests"] = { 55066 },	-- Blueprint: Beastbot Powerpack
				}),
				crit(15, {	-- BAWLD-371
					["_quests"] = { 55068 },	-- Blueprint: BAWLD-371
				}),
				crit(16, {	-- Protocol Transference Device
					["_quests"] = { 55069 },	-- Blueprint: Protocol Transference Device
				}),
				crit(17, {	-- Emergency Rocket Chicken
					["_quests"] = { 55071 },	-- Blueprint: Emergency Rocket Chicken
				}),
				crit(18, {	-- Battle Box
					["_quests"] = { 55072 },	-- Blueprint: Battle Box
				}),
				crit(19, {	-- Rustbolt Resistance Insignia
					["_quests"] = { 55073 },	-- Blueprint: Rustbolt Resistance Insignia
				}),
				crit(20, {	-- Rustbolt Requisitions
					["_quests"] = { 55074 },	-- Blueprint: Rustbolt Requisitions
				}),
				crit(21, {	-- Scrapmaster's Blowtorch
					["_quests"] = { 56181 },	-- This One's On Me
				}),
				crit(22, {	-- Experimental Adventurer's Augment
					["_quests"] = { 56087 },	-- Blueprint: Experimental Adventurer Augment
				}),
				crit(23, {	-- Advanced Adventurer Augment
					["_quests"] = { 56145 },	-- Blueprint: Advanced Adventurer Augment
				}),
				crit(24, {	-- Extraordinary Adventurer Augment
					["_quests"] = { 56165 },	-- Blueprint: Extraordinary Adventurer Augment
				}),
				crit(25, {	-- Holographic Digitalization Relay
					["_quests"] = { 56086 },	-- Blueprint: Holographic Digitalization Relay
				}),
				crit(26, {	-- Personal Time Displayer
					["_quests"] = { 55070 },	-- Blueprint: Personal Time Displacer
				}),
				crit(27, {	-- Orange Spraybot
					["_quests"] = { 55075 },	-- Blueprint: Orange Spraybot
				}),
				crit(28, {	-- Green Spraybot
					["_quests"] = { 55076 },	-- Blueprint: Green Spraybot
				}),
				crit(29, {	-- Blue Spraybot
					["_quests"] = { 55077 },	-- Blueprint: Blue Spraybot
				}),
				crit(30, {	-- Utility Mechanoclaw
					["_quests"] = { 55078 },	-- Blueprint: Utility Mechanoclaw
				}),
				crit(31, {	-- Microbot XD
					["_quests"] = { 55079 },	-- Blueprint: Microbot XD
				}),
				crit(32, {	-- Anti-Gravity Pack
					["_quests"] = { 55081 },	-- Blueprint: Anti-Gravity Pack
				}),
				crit(33, {	-- Rustbolt Pocket Turrent
					["_quests"] = { 55082 },	-- Blueprint: Rustbolt Pocket Turret
				}),
				crit(34, {	-- Annoy-o-Tron Gang
					["_quests"] = { 55083 },	-- Blueprint: Annoy-o-Tron Gang
				}),
				crit(35, {	-- Encrypted Black Market Radio
					["_quests"] = { 55084 },	-- Blueprint: Encrypted Black Market Radio
				}),
				crit(36, {	-- Re-Procedurally Generated Punchcard
					["_quests"] = { 55067 },	-- Blueprint: Re-Procedurally Generated Punchcard
				}),
				crit(37, {	-- S.P.A.R.E. Crate
					["_quests"] = { 56740 },	-- S.P.A.R.E. Crates
				}),
			}),
			ach(13478, {	-- Junkyard Collector
				-- identical criteria as full achievement
				["sym"] = {{"select","achievementID",13479}},	-- Junkyard Architect
			}),
			ach(13474),	-- Junkyard Machinist
			ach(13686, {	-- Junkyard Melomaniac
				crit(1, {	-- Ode to Tinkertown
					["_quests"] = { 55534 },	-- Rustbolt Gramophone
				}),
				crit(2, {	-- Gnomeregan Forever
					["_quests"] = { 56515 },	-- Vinyl: Gnomeragan Forever
				}),
				crit(3, {	-- Mimiron's Brainstorm
					["_quests"] = { 56516 },	-- Vinyl: Mimiron's Brainstorm
				}),
				crit(4, {	-- Battle of Gnomeregan
					["_quests"] = { 56517 },	-- Vinyl: Battle of Gnomeregan
				}),
				crit(5, {	-- Depths of Ulduar
					["_quests"] = { 56518 },	-- Vinyl: Depths of Ulduar
				}),
				crit(6, {	-- Triumph of Gnomeregan
					["_quests"] = { 56519 },	-- Vinyl: Triumph of Gnomeregan
				}),
			}),
			ach(13475),	-- Junkyard Scavenger
			ach(13476),	-- Junkyard Tinkerer
			ach(13791, {	-- Making the Mount
				crit(1, {	-- Shop Project
					["_quests"] = { 55608 },	-- Shop Project
				}),
				crit(2, {	-- Right Bot for the Job
					["_quests"] = { 54086 },	-- Right Bot for the Job
				}),
				crit(3, {	-- Ready to Rumble
					["_quests"] = { 54929 },	-- Ready to Rumble
				}),
				crit(4, {	-- Knock 'Em Out The Box
					["_quests"] = { 55373 },	-- Knock 'Em Out The Box
				}),
				crit(5, {	-- A Little Leg Work
					["_quests"] = { 55697 },	-- A Little Leg Work
				}),
				crit(6, {	-- The Nuts and Bolts of It
					["_quests"] = { 54922 },	-- The Nuts and Bolts of It
				}),
				crit(7, {	-- Factory Refurbished
					["_quests"] = { 56168 },	-- Factory Refurbished
				}),
				crit(8, {	-- Grease the Wheels
					["_quests"] = { 54083 },	-- Grease The Wheels
				}),
				crit(9, {	-- Emission Free
					["_quests"] = { 56175 },	-- Emission Free
				}),
				crit(10, {	-- Test Drive
					["_quests"] = { 55696 },	-- Test Drive
				}),
				crit(11, {	-- Knock His Bot Off
					["_quests"] = { 55753 },	-- Knock His Bot Off
				}),
				crit(12, {	-- Drive it Away Today
					["_quests"] = { 55622 },	-- Drive It Away Today
				}),
			}),
			ach(13541, {	-- Mecha-Done
				-- Meta Achievement should symlink the contained Achievements from Source
				["sym"] = {
					{"select","achievementID",
						13553,	-- The Mechagonian Threat (A)
						13700,	-- The Mechagonian Threat (H)
						13556,	-- Outside Influences
						13513,	-- Available in Eight Colors
						13791,	-- Making the Mount
						13470,	-- Rest In Pistons
						13479,	-- Junkyard Architect
						13474,	-- Junkyard Machinist
						13686,	-- Junkyard Melomaniac
						13790,	-- Armed for Action
					},
				},
				["g"] = {
					i(168329),	-- Mechacycle Model W (MOUNT!)
				},
			}),
			ach(13556, {	-- Outside Influences
				crit(1),	-- Aid from Nordrassil
				crit(2),	-- One Gnome's Trash
				crit(3),	-- Clues Abound
				crit(4),	-- A Historical Mess
				crit(5),	-- A Growing Mystery
				crit(6),	-- Time for Heroics
				crit(7),	-- Strange Discovery
				crit(8),	-- Deck 'Em
				crit(9),	-- Bugs, Lots of 'Em!
				crit(10),	-- Pirates? I hate Those Guys!
				crit(11),	-- Rico's Rescue
				crit(12),	-- The Other Place
				crit(13),	-- The Final Act
				crit(14),	-- Abduction Reduction
				crit(15),	-- Aim High
				crit(16),	-- Pirates, Sea Monsters, Robots
				crit(17),	-- Go For The Gold
				crit(18),	-- The Family jewels
				crit(19),	-- Adapt, Improve, Overcome!
				crit(20),	-- Toys for Destruction
				crit(21),	-- Playtime's Over
				crit(22),	-- Battle Tested
				crit(23),	-- Be Kind, Rewind
				crit(24),	-- My Chicken are Not For Eating!
				crit(25),	-- Off-the-Books Brawlin'
				crit(26),	-- Discs of Norgannon
				crit(27),	-- Toys Like Us
				crit(28),	-- Waste Not
				crit(29),	-- Taking The Air Out
				crit(30),	-- Unprofitable Ventures
				crit(31),	-- A Direct Approach
				crit(32),	-- Cogfrenzy's Construction Frenzy
			}),
			ach(13470, {	-- Rest In Pistons
				crit(1),	-- Mechagnoian Nullfier
				crit(2),	-- The Scrap King
				crit(3),	-- Mecharantuala
				crit(4),	-- Jawbreaker
				crit(5),	-- Paol Pondwader
				crit(6),	-- Rumblerocks
				crit(7, {	-- Arachnoid Harvester
					["_npcs"] = { 151934, 154342 },
				}),
				crit(8),	-- Killsaw
				crit(9),	-- Fungarian Furor
				crit(10),	-- Foul Manifestations
				crit(11),	-- Deepwater Maw
				crit(12),	-- OOX-Avenger/MG
				crit(13),	-- Bonepicker
				crit(14),	-- Boggac Skullbash
				crit(15),	-- Uncle T'Rogg
				crit(16),	-- Seaspit
				crit(17),	-- Sparkqueen P'Emp
				crit(18),	-- Rustfeather
				crit(19),	-- Malfunctioning Beasetbot
				crit(20),	-- Crazed Trogg
				crit(21),	-- Earthbreaker Gulroc
				crit(22),	-- Ol' Big Tusk
				crit(23),	-- Gemicide
				crit(24),	-- Oxidized Leachbeast
				crit(25),	-- Boilburn
				crit(26),	-- The Kleptoboss
				crit(27),	-- Steel Singer Freza
				crit(28),	-- Gear Checker Cogstar
				crit(29),	-- Mr. Fixthis
				crit(30, {	-- Vaultbot
					["_npcs"] = { 150394 }, 	-- Armored Vaultbot
				}),
				crit(31),	-- Enforcer KX-T57
				crit(32),	-- The Rusty Prince
				crit(33),	-- Gorged Gear-Cruncher
				crit(34),	-- Caustic Mechaslime
				crit(35),	-- The Doppel Gang
				crit(36),	-- Scrapclaw
			}),
			ach(13553, {	-- The Mechagonian Threat (A)
				["sourceQuests"] = { 55609 },	-- Operation: Mechagon - The Mechoriginator
				["races"] = ALLIANCE_ONLY,
				["g"] = {
					crit(1),	-- The Legend of Mechagon
					crit(2),	-- Looking Inside
					crit(3),	-- Let's Get it Started
					crit(4),	-- You Must be This Height
					crit(5),	-- Report to Gila
					crit(6),	-- A Small Team
					crit(7),	-- The Start of Something Bigger
					crit(8),	-- Princely Visit
					crit(9),	-- The Resistance Needs YOU!
					crit(10),	-- Rescuing the Resistance
					crit(11),	-- My Father's Armies
					crit(12),	-- We Can Fix It
					crit(13),	-- Drill Rig Construction
					crit(14),	-- Send My Father a Message
					crit(15),	-- Welcome to the Resistance
					crit(16),	-- Operation: Mechagon - The Mechoriginator
				},
			}),
			ach(13700, {	-- The Mechagonian Threat (H)
				["sourceQuests"] = { 55609 },	-- Operation: Mechagon - The Mechoriginator
				["races"] = HORDE_ONLY,
				["g"] = {
					crit(1),	-- The Legend of Mechagon
					crit(2),	-- A Quick Ear Hustle
					crit(3),	-- This is Our Vault Now
					crit(4),	-- Let's Get it Started
					crit(5),	-- You Must be This Height
					crit(6),	-- Machinations for Mechagon
					crit(7),	-- Only the Best Will Do
					crit(8),	-- To Mechagon!
					crit(9),	-- Prospectus Bay
					crit(10),	-- We Come in Peace...and Profit
					crit(11),	-- The Resistance Needs YOU!
					crit(12),	-- Rescuing the Resistance
					crit(13),	-- My Father's Armies
					crit(14),	-- We Can Fix It
					crit(15),	-- Drill Rig Construction
					crit(16),	-- Send My Father a Message
					crit(17),	-- Welcome to the Resistance
					crit(18),	-- Operation: Mechagon - The Mechoriginator
				},
			}),
			petbattle(ach(13625, {	-- Mighty Minions of Mechagon
				crit(5, {	-- CK-9 Micro-Oppression Unit
					["crs"] = { 154926 },	-- CK-9 Micro-Oppression Unit
					["coord"] = { 65.4, 57.6, MECHAGON },
				}),
				crit(4, {	-- Creakclank
					["crs"] = { 154925 },	-- Creakclank
					["coord"] = { 59.2, 50.9, MECHAGON },
				}),
				crit(1, {	-- Gnomefeaster
					["crs"] = { 154922 },	-- Gnomefeaster
					["coord"] = { 64.7, 64.6, MECHAGON },
				}),
				crit(3, {	-- Goldenbot XD
					["crs"] = { 154924 },	-- Goldenbot XD
					["coord"] = { 60.6, 56.9, MECHAGON },
				}),
				crit(2, {	-- Sputtertube
					["crs"] = { 154923 },	-- Sputtertube
					["coord"] = { 60.7, 46.5, MECHAGON },
				}),
				crit(6, {	-- Unit 35
					["crs"] = { 154927 },	-- Unit 35
					["coord"] = { 51.1, 45.4, MECHAGON },
				}),
				crit(7, {	-- Unit 6
					["crs"] = { 154928 },	-- Unit 6
					["coord"] = { 39.5, 40.2, MECHAGON },
				}),
				crit(8, {	-- Unit 17
					["crs"] = { 154929 },	-- Unit 17
					["coord"] = { 72.1, 72.9, MECHAGON },
				}),
			})),
			ach(13708, {	-- Most Minis Wins
				crit(1),	-- Izira Gearsworn
				crit(2),	-- Wrenchbot
				crit(3),	-- Gazlowe
				crit(4),	-- Overspark
				crit(5),	-- Prince Erazmin
				crit(6),	-- Bondo Bigblock
				crit(7),	-- Cork Stuttguard
				crit(8),	-- Roadtrogg
				crit(9),	-- Naeno Megacrash
				crit(10),	-- Cogstar
				crit(11),	-- HK-8
				crit(12),	-- Blastatron
				crit(13),	-- King Mechagon
				crit(14),	-- Sapphronetta
			}),
			ach(13696, {	-- Scrappy's Best Friend
				["description"] = "When you find Scrappy, use an |Cff0070ddEnergy Cell|r to revive him and then feed him two |CffffffffMechano-Treats|r.  He runs around after being revived, so if you can't find him try using a /tar macro in the general Rustbolt area.",
				["coord"] = { 70.7, 36.3, MECHAGON },
				["g"] = {
					crit(1),	-- Revive Scrappy
					crit(2),	-- Feed Scrappy
				},
			}),
			ach(13489, {	-- Secret Fish of Mechagon
				["requireSkill"] = FISHING,
				["g"] = {
					i(167698),	-- Secret Fish Goggles
					crit(1, {	-- Bottom Feeding Stinkfish
						["_quests"] = { 55299 },
					}),
					crit(2, {	-- Bolted Steelhead
						["_quests"] = { 55305 },
					}),
					crit(3, {	-- Pond Hopping Springfish
						["_quests"] = { 55306 },
					}),
					crit(4, {	-- Shadowy Cave Eel
						["_quests"] = { 55307 },
					}),
					crit(5, {	-- Mechanical Blowfish
						["_quests"] = { 55308 },
					}),
					crit(6, {	-- Spitting Clownfish
						["_quests"] = { 55309 },
					}),
					crit(7, {	-- Sludge-Fouled Carp
						["_quests"] = { 55310 },
					}),
					crit(8, {	-- Energized Lighting Cod
						["_quests"] = { 55311 },
					}),
					crit(9, {	-- Solarsprocket Barbel
						["_quests"] = { 55312 },
					}),
					crit(10, {	-- Tasty Steelfin
						["_quests"] = { 55313 },
					}),
				},
			}),
			pvp(ach(13570)),	-- Tour of Duty: Mechagon
		}),
	}),
})));