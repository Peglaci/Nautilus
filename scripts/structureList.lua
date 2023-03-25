
-- create structure list
local structureList = easyEdit.structureList:add("example_structure_list_id")

structureList.name = "Example"

-- add our structures to the structure list
structureList:addAssets(
	"Str_Agroforest",
	"Str_Depot",
	"Str_Genomics_Lab",
	"Str_Geothermal_Plant",
	"Str_Greenhouse",
	"Str_Hotel",
	"Str_Hydroponic_Farm",
	"Str_Lightning_Rod",
	"Str_Observatory",
	"Str_Outpost",
	"Str_Energy_Reserves",
	"Str_Storehouse"
)
