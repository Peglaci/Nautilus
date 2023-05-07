
local path = GetParentPath(...)
local dialog = require(path.."dialog")
local dialog_missions = require(path.."dialog_missions")

-- create personality
local personality = CreatePilotPersonality("Nautilus_ceo_label", "Kin Tanaka") --Second argument is CEO name, don't change the first
personality:AddDialogTable(dialog)
personality:AddDialogTable(dialog_missions)

-- create ceo
local ceo = easyEdit.ceo:add("Nautilus_ceo_id")
ceo:setPersonality(personality)
ceo:setPortrait("img/ceo/portrait.png")
ceo:setOffice("img/ceo/office.png", "img/ceo/office_small.png")
--ceo:setFinalMission("Mission_Train")
