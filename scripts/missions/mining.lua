
local this = {id = "Mission_Nautilus_Mining"}
local mod = mod_loader.mods[modApi.currentMod]
local previewer = mod.libs.weaponPreview

--IMAGES
modApi:appendAsset("img/effects/burrow_openclose.png",mod.resourcePath.."img/effects/burrow_openclose.png") --Thanks to Metalocif for the animation
modApi:appendAsset("img/units/mission/drill.png", mod.resourcePath .."img/units/mission/drill.png")
modApi:appendAsset("img/units/mission/drill_a.png", mod.resourcePath .."img/units/mission/drill_a.png")
modApi:appendAsset("img/units/mission/drill_w.png", mod.resourcePath .."img/units/mission/drill_w.png")
modApi:appendAsset("img/units/mission/drill_d.png", mod.resourcePath .."img/units/mission/drill_d.png")

modApi:appendAsset("img/weapons/excavatorbucket.png", mod.resourcePath.. "img/weapons/excavatorbucket.png")

modApi:appendAsset("img/tileset/ground_mineral.png", mod.resourcePath .."img/tileset/ground_mineral.png")
modApi:appendAsset("img/tileset/ground_buried_empty.png", mod.resourcePath .."img/tileset/ground_buried_empty.png")

modApi:appendAsset("img/units/mission/rock1.png", mod.resourcePath .."img/units/mission/rock1.png")
modApi:appendAsset("img/units/mission/rock2.png", mod.resourcePath .."img/units/mission/rock2.png")
modApi:appendAsset("img/units/mission/rock3.png", mod.resourcePath .."img/units/mission/rock3.png")
modApi:appendAsset("img/units/mission/rock1_death.png", mod.resourcePath .."img/units/mission/rock1_death.png")

local a = ANIMS
a.Nautilus_Driller = a.BaseUnit:new{Image = "units/mission/drill.png", PosX = -18, PosY = 4}
a.Nautilus_Drillera = a.Nautilus_Driller:new{Image = "units/mission/drill_a.png", NumFrames = 4 }
a.Nautilus_Drillerd = a.Nautilus_Driller:new{Image = "units/mission/drill_d.png", PosX = -20, PosY = -2, NumFrames = 10, Loop = false, Time = 0.12}
a.Nautilus_Drillerw = a.Nautilus_Driller:new{Image = "units/mission/drill_w.png", PosY = 8}

a.CrystalRock1 = a.BaseUnit:new{Image = "units/mission/rock1.png", PosX = -18, PosY = -1}
a.CrystalRock1d = a.CrystalRock1:new{ Image = "units/mission/rock1_death.png", PosX = -34, PosY = -9, NumFrames = 13, Time = 0.09, Loop = false }
a.CrystalRock2 = a.BaseUnit:new{Image = "units/mission/rock2.png", PosX = -18, PosY = -1}
a.CrystalRockd2 = a.CrystalRock2:new{ Image = "units/mission/rock1_death.png", PosX = -34, PosY = -9, NumFrames = 13, Time = 0.09, Loop = false }
a.CrystalRock3 = a.BaseUnit:new{Image = "units/mission/rock3.png", PosX = -18, PosY = -1}
a.CrystalRockd3 = a.CrystalRock3:new{ Image = "units/mission/rock1_death.png", PosX = -34, PosY = -9, NumFrames = 13, Time = 0.09, Loop = false }

ANIMS.BurrowOpenClose = Animation:new{
    Image = "effects/burrow_openclose.png",
    NumFrames = 14,
    Frames = {1,2,3,4,5,6,7,8},
    Time = 0.07,
    PosX = -27,
    PosY = 0,
    Layer = LAYER_FLOOR        --lets you create an animation visually behind pawns
}

--ENEMY
CrystalRock1 =
	{
		Name = "Raw Ore",
		Health = 1,
		Neutral = true,
		MoveSpeed = 0,
		IsPortrait = false,
		Image = "CrystalRock1",
		SoundLocation = "/support/rock/",
		MoveSpeed = 0,
		DefaultTeam = TEAM_NONE,
		ImpactMaterial = IMPACT_ROCK
	}
AddPawn("CrystalRock1")

CrystalRock2 =
	{
		Name = "Pristine Ore",
		Health = 1,
		Neutral = true,
		MoveSpeed = 0,
		IsPortrait = false,
		Image = "CrystalRock2",
		SoundLocation = "/support/rock/",
		MoveSpeed = 0,
		DefaultTeam = TEAM_NONE,
		ImpactMaterial = IMPACT_ROCK
	}
AddPawn("CrystalRock2")

CrystalRock3 =
	{
		Name = "Exquisite Ore",
		Health = 1,
		Neutral = true,
		MoveSpeed = 0,
		IsPortrait = false,
		Image = "CrystalRock3",
		SoundLocation = "/support/rock/",
		MoveSpeed = 0,
		DefaultTeam = TEAM_NONE,
		ImpactMaterial = IMPACT_ROCK
	}
AddPawn("CrystalRock3")

--MISSION
Mission_Nautilus_Mining = Mission_Infinite:new{
  Name = "Mineral Excavation",
  Objectives = Objective("Excavate 10 Units of Minerals",1),
  DrillerPawn = "NAH_Driller",
  Driller = nil,
  DigSite = Point(-1,-1),
  PawnId = nil,
  spawnPawn = nil,
  DigLocations = {},
}

function Mission_Nautilus_Mining:IsPointValid(space)
  self.DigLocations = {}
  local tile = Board:GetTerrain(space)
  local dist = Board:GetPawn(self.Driller):GetSpace():Manhattan(space)
	return Board:IsValid(space) and
			not Board:IsPod(space) and
			not Board:IsBuilding(space) and
      not Board:GetPawn(space) and
      dist >= 5 and
      dist <= 8 and --Two moves away
			tile ~= TERRAIN_WATER
end

function Mission_Nautilus_Mining:StartMission()
  local loc = Board:AddPawn(self.DrillerPawn)
  self.Driller = Board:GetPawn(loc):GetId()

  choices = {}
  for i=0,7 do
    for j=0,7 do
      local point = Point(i,j)
      if self:IsPointValid(point) then
        choices[#choices+1] = point
      end
    end
  end

  local choice = random_removal(choices)
  Board:BlockSpawn(choice,BLOCKED_PERM)
  self.DigSite = choice
  local types = {{"ground_mineral.png","CrystalRock1"},{"ground_mineral.png","CrystalRock2"},{"ground_mineral.png","CrystalRock3"}}
  local type = random_removal(types)
  Board:SetCustomTile(choice,type[1])
  self.spawnPawn = type[2]
end

function Mission_Nautilus_Mining:UpdateMission()
  if self.DigSite then
    Board:MarkSpaceDesc(self.DigSite,"NAH_Dig_Site")
  end
end

function Mission_Nautilus_Mining:GetCompletedObjectives()
  if self.DigSite == Point(-1,-1) and not Board:IsPawnAlive(self.PawnId) then
    return self.Objectives
  else
    return self.Objectives:Failed()
  end
end

function Mission_Nautilus_Mining:UpdateObjectives()
  local status = (self.DigSite ~= Point(-1,-1) and not Board:IsPawnAlive(self.Driller) and OBJ_FAILED) or
  (self.DigSite == Point(-1,-1) and not Board:IsPawnAlive(self.PawnId) and OBJ_COMPLETE) or
  OBJ_STANDARD
  Game:AddObjective("Excavate 10 Units of Minerals", status, REWARD_REP, 1) --REWARD_TECH
end

NAH_Driller = {
  Name = "Driller",
  Health = 2,
  MoveSpeed = 4,
  Image = "Nautilus_Driller", --Change
  SoundLocation = "/support/civilian_tank/", --Probably Change
  DefaultTeam = TEAM_PLAYER,
  SkillList = {"NAH_DrillerSkill"},
  Massive = true,
}
AddPawn("NAH_Driller")

NAH_DrillerSkill = Skill:new{
  Name = "Driller",
  Description = "Crack the tile beneath you and throw a rock. If on the dig site, throw the Vek in it instead.",
  Class = "",
  Icon = "weapons/excavatorbucket.png",
  Damage = 0,
  LaunchSound = "/weapons/shift",
  Animation = "BurrowOpenClose",
  TipImage = {
    Unit = Point(2,2),
    Target = Point(2,1),
  }
}

function NAH_DrillerSkill:GetTargetArea(p1)
  local ret = PointList()
  local mission = GetCurrentMission()
  for i=DIR_START,DIR_END do
    for j=1,2 do
      local point = p1+DIR_VECTORS[i]*j
      if Board:IsValid(point) and not Board:IsBlocked(point,PATH_GROUND) then
        ret:push_back(point)
      end
    end
  end
  return ret
end

function NAH_DrillerSkill:GetSkillEffect(p1,p2)
  local ret = SkillEffect()
  local pawn = Board:GetPawn(p1)
  local mission = GetCurrentMission()
  local spawnPawn = nil
  if (mission.DigSite and p1 == mission.DigSite) then --Board:IsTipImage() or
    spawnPawn = mission.spawnPawn
  end

  if not spawnPawn then
    spawnPawn = "CrystalRock"
  end

  --Animation:
  ret:AddScript(string.format([[
    Board:AddAnimation(%s,%q,ANIM_NO_DELAY)
  ]],p1:GetString(),self.Animation))

  ret:AddDelay(0.07*7) --Time of animation half way through

  --Send Self Away and Spawn Pawn
  ret:AddScript(string.format([[
    local pawn = Board:GetPawn(%s)
    local point = pawn:GetSpace()
    pawn:SetSpace(Point(-1,-1))
    Board:AddPawn(%q,point)
    GetCurrentMission().PawnId = Board:GetPawn(point):GetId()
  ]],tostring(pawn:GetId()),spawnPawn))

  local preview = SpaceDamage(p2,0)
  preview.sPawn = spawnPawn
  previewer:AddDamage(preview)

  --Add Leap
  ret:AddScript(string.format([[
    local effect = SkillEffect()
    local move = PointList()
    move:push_back(%s)
    move:push_back(%s)
    effect:AddLeap(move,NO_DELAY)
    Board:AddEffect(effect)
  ]],p1:GetString(),p2:GetString()))

  --Put self back
  ret:AddScript(string.format([[
    local pawn = Board:GetPawn(%s)
    pawn:SetSpace(%s)
  ]],tostring(pawn:GetId()),p1:GetString() ))

  --LOG(GetCurrentMission().DigSite)
  --Mission things
  if mission.DigSite and p1 == mission.DigSite then
    ret:AddScript([[
      local mission = GetCurrentMission()
      Board:SetCustomTile(mission.DigSite,"ground_buried_empty.png")
      mission.DigSite = nil
    ]])
  end

  --Reset Terrain and Crack Tile, animations etc.
  local damage = SpaceDamage(p1,0)
  damage.iTerrain = TERRAIN_ROAD
  damage.iCrack = EFFECT_CREATE
  ret:AddDamage(damage)

  return ret
end

function this:init(mod)

end
