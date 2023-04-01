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

local function HOOK_AddBackground(mission)
  if options.Nautilus_CaveBackground and options.Nautilus_CaveBackground.enabled and modApi:getCurrentTileset() == TILESET then
		Board:AddAnimation(Point(0,0),"cave_background_fade_in",ANIM_NO_DELAY)
		modApi:scheduleHook((fadein.Time*(fadein.NumFrames-1))*1000, function() -- minus 1 cause it uses one less frame
			--customAnim:add(Point(0,0),"cave_background")
			Board:AddAnimation(Point(0,0),"cave_background",ANIM_NO_DELAY) --THERE'S JUST NO FADE OUT TILL CUSTOMANIM IS FIXED
		end)
  end
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
end

modApi.events.onModsLoaded:subscribe(EVENT_onModsLoaded)
