--for k,v in ipairs(GetCurrentMission().DigLocations) do LOG(k); LOG(v); end

local this = {id = "Mission_Nautilus_Mining"}
local mod = mod_loader.mods[modApi.currentMod]
local previewer = mod.libs.weaponPreview
local worldConstants = mod.libs.worldConstants

--TODO:
--Sounds
--Tip Image and Description

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
modApi:appendAsset("img/units/mission/rock_3_emerge.png", mod.resourcePath .."img/units/mission/rock_3_emerge.png")
modApi:appendAsset("img/units/mission/rock1_death.png", mod.resourcePath .."img/units/mission/rock1_death.png")

local a = ANIMS
a.Nautilus_Driller = a.BaseUnit:new{Image = "units/mission/drill.png", PosX = -18, PosY = 4}
a.Nautilus_Drillera = a.Nautilus_Driller:new{Image = "units/mission/drill_a.png", NumFrames = 4 }
a.Nautilus_Drillerd = a.Nautilus_Driller:new{Image = "units/mission/drill_d.png", PosX = -20, PosY = -2, NumFrames = 10, Loop = false, Time = 0.12}
a.Nautilus_Drillerw = a.Nautilus_Driller:new{Image = "units/mission/drill_w.png", PosY = 8}

a.CrystalRock1 = a.BaseUnit:new{Image = "units/mission/rock1.png", PosX = -18, PosY = -1}
a.CrystalRock1d = a.CrystalRock1:new{ Image = "units/mission/rock1_death.png", PosX = -34, PosY = -9, NumFrames = 13, Time = 0.09, Loop = false }
a.CrystalRock2 = a.BaseUnit:new{Image = "units/mission/rock2.png", PosX = -18, PosY = -1}
a.CrystalRock2d = a.CrystalRock2:new{ Image = "units/mission/rock1_death.png", PosX = -34, PosY = -9, NumFrames = 13, Time = 0.09, Loop = false }
a.CrystalRock3 = a.BaseUnit:new{Image = "units/mission/rock3.png", PosX = -18, PosY = -1}
a.CrystalRock3d = a.CrystalRock3:new{ Image = "units/mission/rock1_death.png", PosX = -34, PosY = -9, NumFrames = 13, Time = 0.09, Loop = false }
a.CrystalRock3e = a.BaseUnit:new{Image = "units/mission/rock_3_emerge.png", PosX = -23, PosY = 2, NumFrames = 6, Time = 0.07, Loop = false}

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
  Objectives = Objective("Excavate 6 Units of Minerals",2),
  DrillerPawn = "NAH_Driller",
  Driller = nil,
  DigLocations = nil,
  Crystals = 0,
  CrystalsNeeded = 6, --Also change text
  UseBonus = false,
}

function Mission_Nautilus_Mining:IsPointValid(space)
  local tile = Board:GetTerrain(space)
  --local dist = Board:GetPawn(self.Driller):GetSpace():Manhattan(space)
	return Board:IsValid(space) and
			not Board:IsPod(space) and
			not Board:IsBlocked(space,PATH_GROUND) and
      tile ~= TERRAIN_WATER
end

function Mission_Nautilus_Mining:StartMission()
  local loc = Board:AddPawn(self.DrillerPawn)
  self.Driller = Board:GetPawn(loc):GetId()
  self.DigLocations = {}

  local choices = {}
  local numDigSites = self.CrystalsNeeded*2+2  -- Number of dig sites to generate
  for k = 1, numDigSites do
    local validPoints = {}
    for i = 1, 6 do
      for j = 0, 7 do
        local point = Point(i, j)
        if self:IsPointValid(point) then
          validPoints[#validPoints + 1] = point
        end
      end
    end

    if #validPoints > 0 then
      local choice = random_removal(validPoints)
      --Board:BlockSpawn(choice, BLOCKED_PERM)
      self.DigLocations[#self.DigLocations + 1] = choice
      Board:ClearSpace(choice)
      Board:SetCustomTile(choice, "ground_mineral.png")
    end
  end
end


function Mission_Nautilus_Mining:UpdateMission()
  for i, p in ipairs(self.DigLocations) do
    Board:MarkSpaceDesc(p,"NAH_Minerals")
  end
end

function Mission_Nautilus_Mining:GetCompletedObjectives()
  if self.Crystals >= self.CrystalsNeeded then
    return self.Objectives
  elseif self.Crystals >= self.CrystalsNeeded/2 then
    return Objective(string.format("Excavate 6 Units of Crystals (Mined: %s)",self.Crystals),1,2)
  else
    return self.Objectives:Failed()
  end
end

function Mission_Nautilus_Mining:UpdateObjectives()
  local status = self.Crystals < self.CrystalsNeeded and not Board:IsPawnAlive(self.Driller) and OBJ_FAILED or
  (self.Crystals >= self.CrystalsNeeded and OBJ_COMPLETE) or
  OBJ_STANDARD
  Game:AddObjective(string.format("Excavate 6 Units of Crystals (Mined: %s)",self.Crystals), status, REWARD_REP, 2) --REWARD_TECH
end

NAH_Driller = {
  Name = "Driller",
  Health = 2,
  MoveSpeed = 4,
  Image = "Nautilus_Driller",
  SoundLocation = "/support/civilian_tank/", --Probably Change
  DefaultTeam = TEAM_PLAYER,
  SkillList = {"NAH_DrillerSkill"},
  Massive = true,
}
AddPawn("NAH_Driller")

NAH_DrillerSkill = Skill:new{
  Name = "Driller",
  Description = "Charges forward, excavating crystals as it goes.",
  Class = "",
  Icon = "weapons/excavatorbucket.png",
  Damage = 1,
  LaunchSound = "/support/train/move",
  Animation = "BurrowOpenClose",
  CustomTipImage = "NAH_DrillerSkill_Tip",
  TipDigSpace = Point(2,3),
  TipImage = {
		Unit = Point(2,4),
		Enemy = Point(2,1),
		Target = Point(2,1),
    CustomPawn = "NAH_Driller"
	}
}

function NAH_DrillerSkill:GetTargetArea(point)
  local ret = PointList()

	for i = DIR_START, DIR_END do
		for k = 1, 8 do
			local curr = DIR_VECTORS[i]*k + point
			if Board:IsValid(curr) and not Board:IsBlocked(curr, Pawn:GetPathProf()) then
				ret:push_back(DIR_VECTORS[i]*k + point)
      elseif Board:IsValid(curr) then
        ret:push_back(DIR_VECTORS[i]*k + point)
        break
			else
				break
			end
		end
	end

	return ret
end

function NAH_DrillerSkill:GetSkillEffect(p1,p2)
  local ret = SkillEffect()
  local pawn = Board:GetPawn(p1)
  local mission = GetCurrentMission()

  local dir = GetDirection(p2 - p1)
  local pathing = Pawn:GetPathProf()
  local target = GetProjectileEnd(p1,p2,pathing)
  local damage = nil
  local doDamage = true

  if not Board:IsBlocked(target,pathing) then -- dont attack an empty edge square, just run to the edge
		doDamage = false
		target = target + DIR_VECTORS[dir]
	end

  local distance = p1:Manhattan(target)

  local new_speed = .25
  worldConstants:setSpeed(ret,new_speed)
	ret:AddCharge(Board:GetSimplePath(p1, target - DIR_VECTORS[dir]), NO_DELAY)
  worldConstants:resetSpeed(ret)

  for i = 0, distance-2 do
    --First one is no delay so the delay is at the end
    local point = p1 + DIR_VECTORS[dir]*i
		ret:AddBounce(point, -3)

    local DigLocation = mission.DigLocations and list_contains(mission.DigLocations, point)
    if DigLocation then
      damage = SpaceDamage(point)
      damage.sPawn = "CrystalRock3"
      damage.sSound = "/enemy/digger_1/attack_queued" --Digger rock created
      ret:AddDamage(damage)
      ret:AddScript(string.format([[
        local mission = GetCurrentMission()
        local point = %s
        Board:SetCustomTile(point,"ground_buried_empty.png")
        remove_element(point, mission.DigLocations)
        mission.Crystals = mission.Crystals + 1
      ]],point:GetString()))
    end

    ret:AddDelay(0.08*worldConstants:getDefaultSpeed()/new_speed)
  end

  if doDamage then
    damage = SpaceDamage(target,self.Damage)
    damage.sAnimation = "explopush1_"..dir
    damage.sSound = "/impact/generic/explosion"
    ret:AddDamage(damage)
  end

  return ret
end


NAH_DrillerSkill_Tip = NAH_DrillerSkill:new{
}

--Lots of copy and paste in here, but things are different
function NAH_DrillerSkill_Tip:GetSkillEffect(p1,p2)
  local ret = SkillEffect()
  local pawn = Board:GetPawn(p1)

  local tip_dig_space = self.TipDigSpace
  Board:SetCustomTile(tip_dig_space, "ground_mineral.png")

  local dir = GetDirection(p2 - p1)
  local pathing = Pawn:GetPathProf()
  local target = GetProjectileEnd(p1,p2,pathing)
  local damage = nil

  local distance = p1:Manhattan(target)

  local new_speed = .25
  worldConstants:setSpeed(ret,new_speed)
	ret:AddCharge(Board:GetSimplePath(p1, target - DIR_VECTORS[dir]), NO_DELAY)
  worldConstants:resetSpeed(ret)

  for i = 0, distance-2 do
    --First one is no delay so the delay is at the end
    local point = p1 + DIR_VECTORS[dir]*i
		ret:AddBounce(point, -3)

    if point == tip_dig_space then
      damage = SpaceDamage(point)
      damage.sPawn = "CrystalRock3"
      ret:AddDamage(damage)
      ret:AddScript(string.format([[
        Board:SetCustomTile(%s,"ground_buried_empty.png")
      ]],point:GetString()))
    end

    ret:AddDelay(0.08*worldConstants:getDefaultSpeed()/new_speed)
  end

  damage = SpaceDamage(target,self.Damage)
  damage.sAnimation = "explopush1_"..dir
  ret:AddDamage(damage)

  return ret
end
