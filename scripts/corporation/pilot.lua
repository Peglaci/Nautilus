
local path = GetParentPath(...)
local pilot_dialog = require(path.."pilot_dialog")

local mod = modApi:getCurrentMod()
local resourcePath = mod.resourcePath

-- add pilot images
modApi:appendAsset("img/portraits/npcs/lmn_jungle1.png", resourcePath.."img/corp/pilot.png")
modApi:appendAsset("img/portraits/npcs/lmn_jungle1_2.png", resourcePath.."img/corp/pilot_2.png")
modApi:appendAsset("img/portraits/npcs/lmn_jungle1_blink.png", resourcePath.."img/corp/pilot_blink.png")

-- create personality
local personality = CreatePilotPersonality("Example_Pilot_Label")
personality:AddDialogTable(pilot_dialog)

-- add our personality to the global personality table
Personality["example_pilot_personality_id"] = personality

-- create pilot
-- reference the personality we created
-- reference the pilot images we added
CreatePilot{
	Id = "example_pilot_id",
	Personality = "example_pilot_personality_id",
	Rarity = 0,
	Cost = 1,
	Portrait = "npcs/lmn_jungle1",
	Voice = "/voice/rust",
}
