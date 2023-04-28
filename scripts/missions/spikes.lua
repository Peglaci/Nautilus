local mod = mod_loader.mods[modApi.currentMod]

modApi:appendAsset("img/effects/explo_spikes.png",mod.resourcePath.."img/effects/explo_spikes.png")
modApi:appendAsset("img/effects/spike_emerge.png",mod.resourcePath.."img/effects/spike_emerge.png")

modApi:appendAsset("img/effects/spike.png",mod.resourcePath.."img/effects/spike.png")
Location["effects/spike.png"] = Point(-20,0)
modApi:appendAsset("img/effects/spike2.png",mod.resourcePath.."img/effects/spike2.png")
Location["effects/spike2.png"] = Point(-20,0)
modApi:appendAsset("img/effects/spikeicon.png",mod.resourcePath.."img/effects/spikeicon.png")
Location["effects/spikeicon.png"] = Point(-20,0)

modApi:appendAsset("img/combat/tile_icon/icon_spikes.png", mod.resourcePath .."img/combat/tile_icon/icon_spikes.png")
Location["combat/tile_icon/icon_spikes.png"] = Point(-27,2)


ANIMS.Nautilus_explo_spikes = Animation:new{
	Image = "effects/explo_spikes.png",
	NumFrames = 10,
	Time = 0.045,
	PosX = -24,
	PosY = -4
}

ANIMS.Nautilus_spike_emerge = Animation:new{
	Image = "effects/spike_emerge.png",
	NumFrames = 6,
	Time = 0.045,
	PosX = -20,
	PosY = -0
}

local mine_damage = SpaceDamage(1)
mine_damage.sSound = "Science_KO_Crack_OnKill"
mine_damage.sAnimation = "Nautilus_explo_spikes"
Nautilus_Spike_Mine = { Image = "effects/spike.png", Damage = mine_damage, Tooltip = "Nautilus_Spike_Text", Icon = "effects/spikeicon.png", UsedImage = ""}
Nautilus_Spike_Mine2 = { Image = "effects/spike2.png", Damage = mine_damage, Tooltip = "Nautilus_Spike_Text", Icon = "effects/spikeicon.png", UsedImage = ""}

Mission_Nautilus_Spikes = Mission_Infinite:new{ 
	Name = "Spikes",
	MineCount = 9, 
	GlobalSpawnMod = 1,
	SpawnStartMod = 0,
	BonusPool = {BONUS_GRID, BONUS_MECHS, BONUS_KILL_FIVE, BONUS_BLOCK, BONUS_SELFDAMAGE},--removed pacifist (unreasonably hard) + debris (crowded map as-is)
	MineType = "Nautilus_Spike_Mine",
	MineType2 = "Nautilus_Spike_Mine2",
	BlockedUnits = {"Jelly_Explode", "Dung"},
	MineLocations = {},
}

function Mission_Nautilus_Spikes:StartMission()
	self.MineLocations = {}
	-- MINE TYPE 1
	for i,v in ipairs(self.BlockedUnits) do
		self:GetSpawner():BlockPawns(v)
	end
	
	local choices = {}
	for i = 0, 7 do
		for j = 0, 7 do
			if 	Board:GetTerrain(Point(i,j)) == TERRAIN_ROAD or 
				Board:GetTerrain(Point(i,j)) == TERRAIN_FOREST or
				Board:GetTerrain(Point(i,j)) == TERRAIN_SAND then
			    choices[#choices+1] = Point(i,j)
			end
		end
	end
	
	self.MineCount = math.min(#choices,self.MineCount)
	for i = 1, self.MineCount do
		local point = random_removal(choices)
		self.MineLocations[#self.MineLocations+1] = point
		Board:SetTerrain(point,TERRAIN_ROAD)
		Board:SetItem(point,self.MineType)
	end
	-- MINE TYPE 2
	for i,v in ipairs(self.BlockedUnits) do
		self:GetSpawner():BlockPawns(v)
	end
	
	local choices = {}
	for i = 0, 7 do
		for j = 0, 7 do
			if 	Board:GetTerrain(Point(i,j)) == TERRAIN_ROAD or 
				Board:GetTerrain(Point(i,j)) == TERRAIN_FOREST or
				Board:GetTerrain(Point(i,j)) == TERRAIN_SAND then
			    choices[#choices+1] = Point(i,j)
			end
		end
	end
	
	self.MineCount = math.min(#choices,self.MineCount)
	for i = 1, self.MineCount do
		local point = random_removal(choices)
		self.MineLocations[#self.MineLocations+1] = point
		Board:SetTerrain(point,TERRAIN_ROAD)
		Board:SetItem(point,self.MineType2)
	end
end	