local mod = mod_loader.mods[modApi.currentMod]
local options = mod_loader.currentModContent[mod.id].options
local customAnim = require(mod.scriptPath.."libs/customAnim")

local TILESET = "Nautilus_tileset_id"

modApi:appendAsset("img/combat/bg_temp1.png",mod.resourcePath.."img/combat/bg_temp1.png")
ANIMS.cave_background = Animation:new {
	Image = "combat/bg_temp1.png",
	NumFrames = 1,
	Time = 0.1,
	PosX = -(474/2), --width / 2
	PosY = -84,
	Loop = true,
	Layer = ANIMS.LAYER_FLOOR,
}

local function HOOK_AddBackground(mission)
  if options.Nautilus_CaveBackground and options.Nautilus_CaveBackground.enabled and modApi:getCurrentTileset() == TILESET then
    --customAnim:add(Point(0,0),"cave_background") --If we want to remove it later, but I don't think we do.
    --Just adding it normally allows it to stay at mission end, unless that is fixed
    Board:AddAnimation(Point(0,0),"cave_background",ANIM_NO_DELAY)
  end
end


local function EVENT_onModsLoaded()
  modApi:addTestMechEnteredHook(HOOK_AddBackground)
  modApi:addMissionStartHook(HOOK_AddBackground)
end

modApi.events.onModsLoaded:subscribe(EVENT_onModsLoaded)
