
local this = {}
local mod = mod_loader.mods[modApi.currentMod]
local resourcePath = mod.resourcePath
local path = mod.scriptPath.."missions/"

local function file_exists(name)
	local f = io.open(name, "r")
	if f then io.close(f) return true else return false end
end

local HIGH_THREAT = true
local LOW_THREAT = false

local BASE_MISSIONS = {
  {"Train", HIGH_THREAT},
  {"Laser", LOW_THREAT},
  {"Wind", LOW_THREAT},
  {"Trapped", LOW_THREAT},
}

local Nautilus_Missions = {
  {"Incinerator",LOW_THREAT}, --Incomplete
  {"Falling_Mountains",LOW_THREAT}, --Incomplete
  {"Digging",LOW_THREAT}, --Incomplete
  {"Crumbling",LOW_THREAT}, --Incomplete, testing
  {"Spikes",LOW_THREAT},
	--{"Walls",HIGH_THREAT}, --Incomplete   Taken out, at least for now
	{"Crystals",HIGH_THREAT}, --ChatGPT, incomplete
	{"Charges",HIGH_THREAT}, --incomplete
	{"Minecarts",HIGH_THREAT}, --incomplete
	{"Drilltrain",HIGH_THREAT}, --incomplete
	{"Chasms",HIGH_THREAT}, --incomplete
	{"Tremors",LOW_THREAT}
}

function this:init(mod)
  -- create mission list
  local missionList = easyEdit.missionList:add("Nautilus_mission_list_id")
  missionList.name = "Nautilus"

  for _, table in ipairs(BASE_MISSIONS) do
    local name = "Mission_"..table[1]
    local threat = table[2]
    missionList:addMission(name, threat)
  end

  for _, table in ipairs(Nautilus_Missions) do
    local name = table[1]
    local mission_name = "Mission_Nautilus_"..name
    local threat = table[2]
    require(path..string.lower(name))
    missionList:addMission(mission_name, threat)

    --Icons
    local icon = "img/strategy/mission/"..mission_name..".png"
    local small_icon = "img/strategy/mission/small/"..mission_name..".png"

    if file_exists(resourcePath..icon) then --Could convert to appendAssets?
      modApi:appendAsset(icon, resourcePath..icon)
    end
    if file_exists(resourcePath..small_icon) then
      modApi:appendAsset(small_icon, resourcePath..small_icon)
    end
  end

	require(path.."text")
end

return this
