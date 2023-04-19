local mod = mod_loader.mods[modApi.currentMod]
local options = mod_loader.currentModContent[mod.id].options
local customAnim = mod.libs.customAnim

local TILESET = "Nautilus_tileset_id"
local a = ANIMS

modApi:appendAsset("img/combat/background.png",mod.resourcePath.."img/combat/background.png")
modApi:appendAsset("img/combat/background_fade.png",mod.resourcePath.."img/combat/background_fade.png")

a.cave_background = Animation:new {
	Image = "combat/background.png",
	NumFrames = 1,
	Time = 0.1,
	PosX = -(474/2), --width / 2
	PosY = -84,
	Loop = true,
	Layer = ANIMS.LAYER_FLOOR,
}

a.cave_background_fade_out = a.cave_background:new {
	Image = "combat/background_fade.png",
	NumFrames = 6,
	Time = .4,
	Loop = false,
}

a.cave_background_fade_in = a.cave_background_fade_out:new {
	Frames = {5,4,3,2,1}, --For some reason if given frame 6 it starts full opacity
}

local fadein = a.cave_background_fade_in
local fading = false

local function IsBackground()
	return options.Nautilus_CaveBackground and options.Nautilus_CaveBackground.enabled and modApi:getCurrentTileset() == TILESET
end

local function HOOK_AddBackground(mission)
  if IsBackground() then
		Board:AddAnimation(Point(0,0),"cave_background_fade_in",ANIM_NO_DELAY)
		fading = true
		modApi:scheduleHook((fadein.Time*(fadein.NumFrames-1))*1000, function() -- minus 1 cause it uses one less frame
			customAnim:add(Point(0,0),"cave_background")
			fading = false
			--Board:AddAnimation(Point(0,0),"cave_background",ANIM_NO_DELAY)
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
		if mission and IsBackground() and not customAnim:get(Point(0,0),"cave_background") and not fading then
			customAnim:add(Point(0,0),"cave_background")
		end
	end)
end

local function HOOK_RemoveBackground(mission)
	if customAnim:get(Point(0,0),"cave_background") and modApi:getCurrentTileset() == TILESET then
		customAnim:rem(Point(0,0),"cave_background")
		Board:AddAnimation(Point(0,0),"cave_background_fade_out",ANIM_NO_DELAY)
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
