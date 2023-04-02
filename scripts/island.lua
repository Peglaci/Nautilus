
-- create island
local island = easyEdit.island:add("Nautilus_island_id")

island.name = "Nautilus"

-- appends all assets in the path relative to mod's resource path
island:appendAssets("img/island/")

-- see the easyEdit wiki for details on everything below
island.shift = Point(14,13)
island.magic = Point(150,100)

island.regionData = {
	RegionInfo(Point(0,0), Point(-260, -140), 100),
	RegionInfo(Point(0,0), Point(-60, -120), 100),
	RegionInfo(Point(0,0), Point(130, -110), 100),
	RegionInfo(Point(0,0), Point(280, -50), 100),
	RegionInfo(Point(0,0), Point(-225, -20), 100),
	RegionInfo(Point(0,0), Point(-60, 10), 100),
	RegionInfo(Point(0,0), Point(130, 10), 100),
	RegionInfo(Point(0,0), Point(300, 80), 100)
}

island.network = {
	{1,4},
	{0,2,4,5},
	{1,3,6},
	{2,6,7},
	{0,4,5},
	{1,4,6},
	{2,3,5,7},
	{3,6}
}
