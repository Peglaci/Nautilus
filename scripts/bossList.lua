
-- create boss list
local bossList = easyEdit.bossList:add("Nautilus_boss_list_id")

bossList.name = "Nautilus"

-- add our boss missions to the boss list
bossList:addBoss("Mission_ScorpionBoss")
bossList:addBoss("Mission_HornetBoss")
bossList:addBoss("Mission_BlobBoss")
