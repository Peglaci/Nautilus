
local path = GetParentPath(...)
local pilot_dialog = require(path.."pilot_dialog")

local mod = modApi:getCurrentMod()
local resourcePath = mod.resourcePath

-- add pilot images
modApi:appendAsset("img/portraits/npcs/Nautilus.png", resourcePath.."img/corp/pilot.png")
modApi:appendAsset("img/portraits/npcs/Nautilus_2.png", resourcePath.."img/corp/pilot_2.png")
modApi:appendAsset("img/portraits/npcs/Nautilus_blink.png", resourcePath.."img/corp/pilot_blink.png")

-- create personality
local personality = CreatePilotPersonality("Nautilus_Pilot_Label")
personality:AddDialogTable(pilot_dialog)

-- add our personality to the global personality table
Personality["Nautilus_pilot_personality_id"] = personality

-- create pilot
-- reference the personality we created
-- reference the pilot images we added
CreatePilot{
	Id = "Nautilus_pilot_id",
	Personality = "Nautilus_pilot_personality_id",
	Rarity = 0,
	Cost = 1,
	Portrait = "npcs/Nautilus1",
	Voice = "/voice/rust",
}

modApi:addPilotDrop{id = "Nautilus_pilot_id", recruit = true }
