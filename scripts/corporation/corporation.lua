
-- create corporation
local corporation = easyEdit.corporation:add("Nautilus_corporation_id")
corporation.Name = "Nautilus Heavy Industries" --Full name of island, displays on CEO intro screen
corporation.Bark_Name = "Nautilus" --Name of island used in most places like pilot barks etc.
corporation.Description = "Extending far below the surface of the earth, N.H.I. plumbs the depths seeking rare minerals. Watch for falling rocks." -- Description of island, seen on island select screen
corporation.Color = GL_Color(18,23,27)
corporation.Map = { "/music/grass/map" } --Music for island
corporation.Music = {
	"/music/grass/combat_delta",
	"/music/grass/combat_gamma",
	"/music/sand/combat_guitar",
}

-- reference the pilot id created in pilot.lua
corporation.Pilot = "Nautilus_pilot_id"
