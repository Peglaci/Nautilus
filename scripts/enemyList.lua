
-- create enemy list
local enemyList = easyEdit.enemyList:add("example_enemy_list_id")

enemyList.name = "Example"

-- add our enemies to the enemy list
enemyList:addEnemy("Scorpion", "Core")
enemyList:addEnemy("Beetle", "Unique")
enemyList:addEnemy("Snowart", "Bot")
enemyList:addEnemy("Jelly_Explode", "Leaders")
