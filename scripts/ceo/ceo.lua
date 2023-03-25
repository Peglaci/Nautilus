
local path = GetParentPath(...)
local dialog = require(path.."dialog")
local dialog_missions = require(path.."dialog_missions")

-- create personality
local personality = CreatePilotPersonality("example_ceo_label", "Kin Tanaka")
personality:AddDialogTable(dialog)
personality:AddDialogTable(dialog_missions)

-- create ceo
local ceo = easyEdit.ceo:add("example_ceo_id")
ceo:setPersonality(personality)
ceo:setPortrait("img/ceo/portrait.png")
ceo:setOffice("img/ceo/office.png", "img/ceo/office_small.png")
ceo:setFinalMission("Mission_Train")


