local mod = mod_loader.mods[modApi.currentMod]
local customAnim = require(mod.scriptPath.."libs/customAnim")
require(mod.scriptPath.."libs/boardEvents")

--waterfall name and tileset
local TILESET = "Nautilus_tileset_id"
local WATERFALL = TILESET .. "_Waterfall"

----------------
-- ANIMATIONS --
----------------

-- Base waterfall
ANIMS[WATERFALL] = Animation:new{
	NumFrames = 3,
	Time = 0.19,
	Loop = true,
	Layer = LAYER_FLOOR--LAYER_BACK
}

--Perspective of the hole
ANIMS['0'..WATERFALL] = ANIMS[WATERFALL]:new{
    Image = "combat/tiles_"..TILESET.."/waterfall_D.png", PosX = -11, PosY = 7
}

ANIMS['1'..WATERFALL] = ANIMS[WATERFALL]:new{
    Image = "combat/tiles_"..TILESET.."/waterfall_R.png", PosX = -27, PosY = 7
}

ANIMS['2'..WATERFALL] = ANIMS[WATERFALL]:new{
    Image = "combat/tiles_"..TILESET.."/waterfall_U.png", PosX = -28, PosY = 25 
}

ANIMS['3'..WATERFALL] = ANIMS[WATERFALL]:new{
    Image = "combat/tiles_"..TILESET.."/waterfall_L.png", PosX = -10, PosY = 25
}

local order = {0,3,2,1} -- needed to align waterfall position and sprite display order

---------------
-- FUNCTIONS --
---------------

local EVENT_onTerrainChanged = function(point, newTerrain, oldTerrain)
	if modApi:getCurrentTileset() == TILESET then
		if false
			or newTerrain == TERRAIN_WATER
			or newTerrain == TERRAIN_HOLE
			or oldTerrain == TERRAIN_WATER
			or oldTerrain == TERRAIN_HOLE
		then
			for i,j in pairs(order) do -- re-do waterfalls on tile
				customAnim:Rem(mission,point,j..WATERFALL)
				if Board:GetTerrain(point) == TERRAIN_HOLE then
					local curr = point + DIR_VECTORS[i-1]
					if Board:IsValid(curr) then
						if Board:GetTerrain(curr) == TERRAIN_WATER and Board:GetTerrain(curr) ~= TERRAIN_ICE then
							if not Board:IsTerrain(curr,TERRAIN_LAVA) and not Board:IsAcid(curr) then
								customAnim:Add(mission,point,j..WATERFALL)
							end
						end
					end
				end
			end
			for d = DIR_START, DIR_END do -- re-do waterfalls on adjacent
				local loc = point + DIR_VECTORS[d]
				for i,j in pairs(order) do
					customAnim:Rem(mission,loc,j..WATERFALL)
					if Board:IsValid(loc) and Board:GetTerrain(loc) == TERRAIN_HOLE then
						local curr = loc + DIR_VECTORS[i-1]
						if Board:IsValid(curr) then
							if Board:GetTerrain(curr) == TERRAIN_WATER and Board:GetTerrain(curr) ~= TERRAIN_ICE then
								if not Board:IsTerrain(curr,TERRAIN_LAVA) and not Board:IsAcid(curr) then
									customAnim:Add(mission,loc,j..WATERFALL)
								end
							end
						end
					end
				end
			end
		end
	end
end

local EVENT_onAcidLava = function(point)
	if modApi:getCurrentTileset() == TILESET then
		if Board:GetTerrain(point) == TERRAIN_WATER then
			for i,j in pairs(order) do -- re-do waterfalls on tile
				customAnim:Rem(mission,point,j..WATERFALL)
				if Board:GetTerrain(point) == TERRAIN_HOLE then
					local curr = point + DIR_VECTORS[i-1]
					if Board:IsValid(curr) then
						if Board:GetTerrain(curr) == TERRAIN_WATER and Board:GetTerrain(curr) ~= TERRAIN_ICE then
							if not Board:IsTerrain(curr,TERRAIN_LAVA) and not Board:IsAcid(curr) then
								customAnim:Add(mission,point,j..WATERFALL)
							end
						end
					end
				end
			end
			for d = DIR_START, DIR_END do -- re-do waterfalls on adjacent
				local loc = point + DIR_VECTORS[d]
				for i,j in pairs(order) do
					customAnim:Rem(mission,loc,j..WATERFALL)
					if Board:IsValid(loc) and Board:GetTerrain(loc) == TERRAIN_HOLE then
						local curr = loc + DIR_VECTORS[i-1]
						if Board:IsValid(curr) then
							if Board:GetTerrain(curr) == TERRAIN_WATER and Board:GetTerrain(curr) ~= TERRAIN_ICE then
								if not Board:IsTerrain(curr,TERRAIN_LAVA) and not Board:IsAcid(curr) then
									customAnim:Add(mission,loc,j..WATERFALL)
								end
							end
						end
					end
				end
			end
		end
	end
end

local function HOOK_mapEntered(mission)
	for x = 0, 7 do
		for y = 0, 7 do
			local point = Point(x,y)
			for i,j in pairs(order) do -- re-do waterfalls on tile
				customAnim:Rem(mission,point,j..WATERFALL)
				if modApi:getCurrentTileset() == TILESET and Board:GetTerrain(point) == TERRAIN_HOLE then
					local curr = point + DIR_VECTORS[i-1]
					if Board:IsValid(curr) then
						if Board:GetTerrain(curr) == TERRAIN_WATER and Board:GetTerrain(curr) ~= TERRAIN_ICE then
							if not Board:IsTerrain(curr,TERRAIN_LAVA) and not Board:IsAcid(curr) then
								customAnim:Add(mission,point,j..WATERFALL)
							end
						end
					end
				end
			end
		end
	end
end

-- add hooks
local function EVENT_onModsLoaded()
	modApi:addTestMechEnteredHook(HOOK_mapEntered)
	modApi:addMissionStartHook(HOOK_mapEntered)
end

modApi.events.onModsLoaded:subscribe(EVENT_onModsLoaded)
BoardEvents.onTerrainChanged:subscribe(EVENT_onTerrainChanged)
BoardEvents.onAcidCreated:subscribe(EVENT_onAcidLava)
BoardEvents.onAcidRemoved:subscribe(EVENT_onAcidLava)
BoardEvents.onLavaCreated:subscribe(EVENT_onAcidLava)
BoardEvents.onLavaRemoved:subscribe(EVENT_onAcidLava)