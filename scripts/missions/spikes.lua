local mod = mod_loader.mods[modApi.currentMod]

modApi:appendAsset("img/effects/explo_spikes.png",mod.resourcePath.."img/effects/explo_spikes.png")
modApi:appendAsset("img/effects/spike.png",mod.resourcePath.."img/effects/spike.png")
Location["effects/spike.png"] = Point(-20,0)

ANIMS.Nautilus_explo_spikes = Animation:new{
	Image = "effects/explo_spikes.png",
	NumFrames = 10,
	Time = 0.075,
	PosX = -24,
	PosY = -4
}


TILE_TOOLTIPS = {
	Nautilus_Spike_Text = {"Crystal Spikes", "Deals 1 Damage to units that move onto its tile."},	
}

local mine_damage = SpaceDamage(1)
mine_damage.sSound = "Science_KO_Crack_OnKill"
mine_damage.sAnimation = "Nautilus_explo_spikes"
Nautilus_Spike_Mine = { Image = "effects/spike.png", Damage = mine_damage, Tooltip = "Nautilus_Spike_Text", Icon = "effects/spike.png", UsedImage = ""}

Mission_Nautilus_Spikes = Mission_Infinite:new{ 
	Name = "Spikes",
	MineCount = 9, 
	GlobalSpawnMod = 1,
	SpawnStartMod = 0,
	BonusPool = {BONUS_GRID, BONUS_MECHS, BONUS_KILL_FIVE, BONUS_BLOCK, BONUS_SELFDAMAGE},--removed pacifist (unreasonably hard) + debris (crowded map as-is)
	MineType = "Nautilus_Spike_Mine",
	BlockedUnits = {"Jelly_Explode", "Dung"},
	MineLocations = {},
}

function Mission_Nautilus_Spikes:StartMission()
	self.MineLocations = {}
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
end	