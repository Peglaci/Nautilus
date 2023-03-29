
-- create structure list
local structureList = easyEdit.structureList:add("Nautilus_structure_list_id")

structureList.name = "Nautilus"

-- add our structures to the structure list
structureList:addAssets(
	"Str_MaterialsFacility",
	"Str_ThermalPile",
	"Str_Mine",

	"Str_Robotics",
	"Str_Research",
	"Str_Nimbus",
	"Str_Power",
	"Str_Power",
	"Str_Bar"
)