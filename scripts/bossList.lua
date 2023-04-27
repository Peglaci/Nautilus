
-- create boss list
local bossList = easyEdit.bossList:add("Nautilus_boss_list_id")
local rst = easyEdit.bossList:get("rst")

bossList.name = "Nautilus"

bossList:copy(rst)
