
-- create tileset
local tileset = easyEdit.tileset:add("example_tileset_id", "grass")

tileset.name = "Example"

-- appends all assets in the path relative to mod's resource path
tileset:appendAssets("img/tileset/")

-- display name of the tileset in game
tileset:setClimate("Example Climate")

-- percentage chance of a mission having rain
tileset:setRainChance(70)

-- percentage chance that a regular ground tile gets changed to the following
tileset:setEnvironmentChance{
	[TERRAIN_ACID] = 0,
	[TERRAIN_FOREST] = 30,
	[TERRAIN_SAND] = 10,
	[TERRAIN_ICE] = 0,
}

-- set custom tooltip text for various tile types
tileset:setTileTooltip{
	tile = "sand",
	title = "Example Puffshrooms",
	text = "If damaged, turns into Smoke. \nUnits in Smoke cannot attack or repair."
}
tileset:setTileTooltip{
	tile = "forest",
	title = "Example Jungle",
	text = "If damaged, lights on Fire."
}
tileset:setTileTooltip{
	tile = "forest_fire",
	title = "Example Jungle Fire",
	text = "Lights units on Fire. This fire was started when a Jungle Tile was damaged."
}
