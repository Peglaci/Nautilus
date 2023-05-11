local mod = mod_loader.mods[modApi.currentMod]
local options = mod_loader.currentModContent[mod.id].options
local customAnim = mod.libs.customAnim

local TILESET = "Nautilus_tileset_id"
local a = ANIMS

local backgrounds = {
	"",
	"_chasm",
	"_water"
}

for _, background in ipairs(backgrounds) do
	modApi:appendAsset("img/combat/background"..background..".png",mod.resourcePath.."img/combat/background"..background..".png")
	modApi:appendAsset("img/combat/background"..background.."_fade.png",mod.resourcePath.."img/combat/background"..background.."_fade.png")
end

a.cave_background = Animation:new {
	Image = "combat/background.png",
	NumFrames = 1,
	Time = 0.19*3,
	PosX = -(474/2), --width / 2
	PosY = -84,
	Loop = true,
	Layer = ANIMS.LAYER_FLOOR,
}

a.cave_background_fade_out = a.cave_background:new {
	Image = "combat/background_fade.png",
	NumFrames = 10,
	Time = .3,
	Loop = false,
}

a.cave_background_fade_in = a.cave_background_fade_out:new {
	Frames = {9,8,7,6,5,4,3,2,1}, --For some reason if given frame 6 it starts full opacity
}

--Water
a.cave_background_water = a.cave_background:new {
	Image = "combat/background_water.png",
}
a.cave_background_water_fade_out = a.cave_background_fade_out:new {
	Image = "combat/background_water_fade.png",
}
a.cave_background_water_fade_in = a.cave_background_fade_in:new {
	Image = "combat/background_water_fade.png",
}
--Chasm
a.cave_background_chasm = a.cave_background:new {
	Image = "combat/background_chasm.png",
}
a.cave_background_chasm_fade_out = a.cave_background_fade_out:new {
	Image = "combat/background_chasm_fade.png",
}
a.cave_background_chasm_fade_in = a.cave_background_fade_in:new {
	Image = "combat/background_chasm_fade.png",
}

local fadein = a.cave_background_fade_in
local fading = false

--Functions
local function IsBackground()
	return options.Nautilus_CaveBackground and options.Nautilus_CaveBackground.enabled and modApi:getCurrentTileset() == TILESET
end

local function background_placed()
	return false or
		customAnim:get(Point(0,0),"cave_background") or
		customAnim:get(Point(0,0),"cave_background_water") or
		customAnim:get(Point(0,0),"cave_background_chasm")
end

local function remove_backgrounds()
	if not IsBackground() then return end
	customAnim:rem(Point(0,0),"cave_background")
	customAnim:rem(Point(0,0),"cave_background_water")
	customAnim:rem(Point(0,0),"cave_background_chasm")
end

local function add_backgrounds()
	if not IsBackground() then return end
	local terrain = Board:GetTerrain(Point(0,0))
	LOG(terrain)
	if terrain == TERRAIN_HOLE then
		customAnim:add(Point(0,0),"cave_background_chasm")
	elseif terrain == TERRAIN_WATER then
		customAnim:add(Point(0,0),"cave_background_water")
	else
		customAnim:add(Point(0,0),"cave_background")
	end
end

local function add_fade_in()
	if not IsBackground() then return end
	local terrain = Board:GetTerrain(Point(0,0))
	if terrain == TERRAIN_HOLE then
		Board:AddAnimation(Point(0,0),"cave_background_chasm_fade_in",ANIM_NO_DELAY)
	elseif terrain == TERRAIN_WATER then
		Board:AddAnimation(Point(0,0),"cave_background_water_fade_in",ANIM_NO_DELAY)
	else
		Board:AddAnimation(Point(0,0),"cave_background_fade_in",ANIM_NO_DELAY)
	end
	fading = true
end

local function add_fade_out()
	if not IsBackground() then return end
	local terrain = Board:GetTerrain(Point(0,0))
	if terrain == TERRAIN_HOLE then
		Board:AddAnimation(Point(0,0),"cave_background_chasm_fade_out",ANIM_NO_DELAY)
	elseif terrain == TERRAIN_WATER then
		Board:AddAnimation(Point(0,0),"cave_background_water_fade_out",ANIM_NO_DELAY)
	else
		Board:AddAnimation(Point(0,0),"cave_background_fade_out",ANIM_NO_DELAY)
	end
end

--HOOKS

local function HOOK_AddBackground(mission)
  if IsBackground() then
		add_fade_in()
		modApi:scheduleHook((fadein.Time*(fadein.NumFrames-1))*1000, function() -- minus 1 cause it uses one less frame
			add_backgrounds()
			fading = false
		end)
  end
end

local function customRunLater(delay, fn) --I hate everything
	if delay == 0 then
		fn()
	else
		modApi:runLater(function()
			customRunLater(delay-1,fn)
		end)
	end
end

--If you exit the game before the game saves, the anim doens't get saved. This checks for that.
local function HOOK_CheckBackground(screen)
	customRunLater(5,function()
		local mission = GetCurrentMission()
		if mission and IsBackground() and not background_placed() and not fading then --THIS PART ISN'T WORKING
			add_backgrounds()
		elseif mission and not IsBackground() then
			remove_backgrounds()
		end
	end)
end

local function HOOK_RemoveBackground(mission)
	if background_placed() and modApi:getCurrentTileset() == TILESET then
		remove_backgrounds()
		add_fade_out()
	end
end

--USE DIFFERENT BACKGROUNDS
local EVENT_onTerrainChanged = function(point, newTerrain, oldTerrain)
	if modApi:getCurrentTileset() == TILESET and point == Point(0,0) then
		remove_backgrounds()
		add_backgrounds()
	end
end

local function EVENT_onModsLoaded()
  modApi:addTestMechEnteredHook(HOOK_AddBackground)
  modApi:addMissionStartHook(HOOK_AddBackground)
	modApi:addMissionEndHook(HOOK_RemoveBackground)
	--modapiext:addGameLoadedHook(HOOK_CheckBackground)
end

modApi.events.onModsLoaded:subscribe(EVENT_onModsLoaded)

modApi.events.onContinueClicked:subscribe(HOOK_CheckBackground)

BoardEvents.onTerrainChanged:subscribe(EVENT_onTerrainChanged)
