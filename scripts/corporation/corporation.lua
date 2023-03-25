
-- create corporation
local corporation = easyEdit.corporation:add("example_corporation_id")
corporation.Name = "Example Corporation Display Name"
corporation.Bark_Name = "Example Corporation Dialog Name"
corporation.Description = "Example Corporation Description"
corporation.Color = GL_Color(57,87,38)
corporation.Map = { "/music/grass/map" }
corporation.Music = {
	"/music/grass/combat_delta",
	"/music/grass/combat_gamma",
	"/music/sand/combat_guitar",
}

-- reference the pilot id created in pilot.lua
corporation.Pilot = "example_pilot_id"
