
-- create island
local island = easyEdit.island:add("Nautilus_island_id")

island.name = "Nautilus"

-- appends all assets in the path relative to mod's resource path
island:appendAssets("img/island/")

-- see the easyEdit wiki for details on everything below
island.shift = Point(14,13)
island.magic = Point(145,102)

island.regionData = {
	RegionInfo(Point(25,76), Point(-5, -24), 100),
	RegionInfo(Point(124,80), Point(0, -30), 100),
	RegionInfo(Point(198,73), Point(0, -20), 100),
	RegionInfo(Point(273,86), Point(-10, -10), 100),
	RegionInfo(Point(56,146), Point(0, -20), 100),
	RegionInfo(Point(139,144), Point(0, -30), 100),
	RegionInfo(Point(252,170), Point(20, -55), 100),
	RegionInfo(Point(353,144), Point(-10, -20), 100)
}

island.network = {
	{1,4},
	{0,2,4,5},
	{1,3,5},
	{2,6,7,5},
	{0,1,5},
	{1,2,3,4,6},
	{3,5,7},
	{3,6}
}
