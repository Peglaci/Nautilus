
-- create boss list
local bossList = easyEdit.bossList:add("example_boss_list_id")

bossList.name = "Example"

-- add our boss missions to the boss list
bossList:addBoss("Mission_ScorpionBoss")
bossList:addBoss("Mission_HornetBoss")
bossList:addBoss("Mission_BlobBoss")
