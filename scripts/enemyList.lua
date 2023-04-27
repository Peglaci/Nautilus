
-- create enemy list
local enemyList = easyEdit.enemyList:add("Nautilus_enemy_list_id")
local rst = easyEdit.enemyList:get("rst")

enemyList.name = "Nautilus"

enemyList:copy(rst)
