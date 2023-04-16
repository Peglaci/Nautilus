
-- create corporation
local corporation = easyEdit.corporation:add("Nautilus_corporation_id")
corporation.Name = "Nautilus Heavy Industries" --Full name of island, displays on CEO intro screen
corporation.Bark_Name = "Nautilus" --Name of island used in most places like pilot barks etc.
corporation.Description = "Extending far below the surface of the earth, N.H.I. plumbs the depths seeking rare minerals. Watch for falling rocks." -- Description of island, seen on island select screen
corporation.Color = GL_Color(18,23,27)
corporation.Map = { "/music/grass/map" } --Music for island
corporation.Music = {
	"/music/grass/combat_delta", 		--Relics
	"/music/sand/combat_eastwood", 		--Cataclysm
	"/music/snow/combat_new", 			--Plasmodia (AE)
	"/music/acid/combat_detritus"		--A.C.I.D.
}

-- reference the pilot id created in pilot.lua
corporation.Pilot = "Nautilus_pilot_id"

----------------
-- music list --
----------------

-- OST: https://benprunty.bandcamp.com/album/into-the-breach-soundtrack
-- AE OST: https://benprunty.bandcamp.com/album/into-the-breach-advanced-edition-soundtrack

-- Archive
-- "/music/grass/map"				--Old Earth (Map)
-- "/music/grass/combat_delta"		--Relics
-- "/music/grass/combat_gamma"		--Antiquity Row
-- "/music/sand/combat_guitar"		--Old War Machines
-- "/music/grass/combat_new"		--Kai Miller (AE)

-- R.S.T.
-- "/music/sand/map"				--Red Sand (Map)
-- "/music/sand/combat_western"		--The Blast Garden
-- "/music/sand/combat_eastwood"	--Cataclysm
-- "/music/sand/combat_montage"		--Rusting Hulks
-- "/music/sand/combat_new"			--The Big One (AE)

-- Pinnacle
-- "/music/snow/map"				--Zenith
-- "/music/snow/combat_ice"			--Pinnacle Robotics
-- "/music/snow/combat_zimmer"		--Blitzkreig
-- "/music/snow/combat_train"		--Rift Riders
-- "/music/snow/combat_new"			--Plasmodia (AE)

-- Detritus
-- "/music/acid/map"				--Detritus
-- "/music/acid/combat_synth"		--The Wasteland
-- "/music/general/ominous_master"	--Reprocessing
-- "/music/acid/combat_detritus"	--A.C.I.D.
-- "/music/acid/combat_new"			--Mist Eaters(AE)


-- Game:TriggerSound()
