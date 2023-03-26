
-- create mission list
local missionList = easyEdit.missionList:add("Nautilus_mission_list_id")

missionList.name = "Nautilus"

local HIGH_THREAT = true
local LOW_THREAT = false

--[[ add our missions to the mission list like so
missionList:addMission("Mission_Easy", LOW_THREAT)
missionList:addMission("Mission_Hard", HIGH_THREAT)]]
missionList:addMission("Mission_Train", HIGH_THREAT)
missionList:addMission("Mission_Laser", LOW_THREAT)
missionList:addMission("Mission_Wind", LOW_THREAT)
missionList:addMission("Mission_Trapped", LOW_THREAT)
