
-- create mission list
local missionList = easyEdit.missionList:add("example_mission_list_id")

missionList.name = "Example"

local HIGH_THREAT = true
local LOW_THREAT = false

-- add our missions to the mission list
missionList:addMission("Mission_Fence", HIGH_THREAT)
missionList:addMission("Mission_Piston", HIGH_THREAT)
missionList:addMission("Mission_Train", HIGH_THREAT)
missionList:addMission("Mission_Laser", LOW_THREAT)
missionList:addMission("Mission_Wind", LOW_THREAT)
missionList:addMission("Mission_Trapped", LOW_THREAT)
