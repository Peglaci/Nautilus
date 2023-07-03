-- mission Mission_Nautilus_Digging
--Mission By: NamesAreHard: NAH
--[[
"Normal Missions"
Mission Definition:
Name = Name of the mission
Objectives = Objective()

]]

--TODO:
--Sounds

--Board:SetCustomTile(choice,"square_missilesilo.png")
local this = {id = "Mission_Nautilus_Digging"}
local mod = mod_loader.mods[modApi.currentMod]
local previewer = mod.libs.weaponPreview
local trait = require(mod.scriptPath..'libs/trait')

--IMAGES
modApi:appendAsset("img/effects/burrow_openclose.png",mod.resourcePath.."img/effects/burrow_openclose.png") --Thanks to Metalocif for the animation
modApi:appendAsset("img/units/mission/excavator.png", mod.resourcePath .."img/units/mission/excavator.png")
modApi:appendAsset("img/units/mission/excavator_a.png", mod.resourcePath .."img/units/mission/excavator_a.png")
modApi:appendAsset("img/units/mission/excavatorw.png", mod.resourcePath .."img/units/mission/excavatorw.png")
modApi:appendAsset("img/units/mission/excavator_d.png", mod.resourcePath .."img/units/mission/excavator_d.png")

modApi:appendAsset("img/weapons/excavatorbucket.png", mod.resourcePath.. "img/weapons/excavatorbucket.png")

modApi:appendAsset("img/tileset/ground_buried_firefly.png", mod.resourcePath .."img/tileset/ground_buried_firefly.png")
modApi:appendAsset("img/tileset/ground_buried_scarab.png", mod.resourcePath .."img/tileset/ground_buried_scarab.png")
modApi:appendAsset("img/tileset/ground_buried_scorpion.png", mod.resourcePath .."img/tileset/ground_buried_scorpion.png")
modApi:appendAsset("img/tileset/ground_buried_empty.png", mod.resourcePath .."img/tileset/ground_buried_empty.png")

modApi:appendAsset("img/portraits/enemy/CrystalFirefly.png", mod.resourcePath .."img/portraits/enemy/firefly.png")
modApi:appendAsset("img/units/mission/firefly.png", mod.resourcePath .."img/units/mission/firefly.png")
modApi:appendAsset("img/units/mission/fireflya.png", mod.resourcePath .."img/units/mission/fireflya.png")
modApi:appendAsset("img/units/mission/firefly_emerge.png", mod.resourcePath .."img/units/mission/firefly_emerge.png")
modApi:appendAsset("img/units/mission/firefly_death.png", mod.resourcePath .."img/units/mission/firefly_death.png")

modApi:appendAsset("img/portraits/enemy/CrystalScorpion.png", mod.resourcePath .."img/portraits/enemy/scorpion.png")
modApi:appendAsset("img/units/mission/scorpion.png", mod.resourcePath .."img/units/mission/scorpion.png")
modApi:appendAsset("img/units/mission/scorpiona.png", mod.resourcePath .."img/units/mission/scorpiona.png")
modApi:appendAsset("img/units/mission/scorpion_emerge.png", mod.resourcePath .."img/units/mission/scorpion_emerge.png")
modApi:appendAsset("img/units/mission/scorpion_death.png", mod.resourcePath .."img/units/mission/scorpion_death.png")

modApi:appendAsset("img/portraits/enemy/CrystalScarab.png", mod.resourcePath .."img/portraits/enemy/scarab.png")
modApi:appendAsset("img/units/mission/scarab.png", mod.resourcePath .."img/units/mission/scarab.png")
modApi:appendAsset("img/units/mission/scaraba.png", mod.resourcePath .."img/units/mission/scaraba.png")
modApi:appendAsset("img/units/mission/scarab_emerge.png", mod.resourcePath .."img/units/mission/scarab_emerge.png")
modApi:appendAsset("img/units/mission/scarab_death.png", mod.resourcePath .."img/units/mission/scarab_death.png")

modApi:appendAsset("img/units/mission/rock1.png", mod.resourcePath .."img/units/mission/rock1.png")
modApi:appendAsset("img/units/mission/rock1_death.png", mod.resourcePath .."img/units/mission/rock1_death.png")

local a = ANIMS
a.Nautilus_Excavator = a.BaseUnit:new{Image = "units/mission/excavator.png", PosX = -20, PosY = -9}
a.Nautilus_Excavatora = a.Nautilus_Excavator:new{Image = "units/mission/excavator_a.png", NumFrames = 4 }
a.Nautilus_Excavatord = a.Nautilus_Excavator:new{Image = "units/mission/excavator_d.png", NumFrames = 11, Loop = false, Time = 0.12}
a.Nautilus_Excavatorw = a.Nautilus_Excavator:new{Image = "units/mission/excavatorw.png", PosY = 0}

a.CrystalRock = a.BaseUnit:new{Image = "units/mission/rock1.png", PosX = -18, PosY = -1}
a.CrystalRockd = a.CrystalRock:new{ Image = "units/mission/rock1_death.png", PosX = -34, PosY = -9, NumFrames = 13, Time = 0.09, Loop = false }

a.CrystalFirefly = a.BaseUnit:new{Image = "units/mission/firefly.png", PosX = -18, PosY = -2 }
a.CrystalFireflya = a.CrystalFirefly:new{Image = "units/mission/fireflya.png", NumFrames = 4 }
a.CrystalFireflyd = a.CrystalFirefly:new{ Image = "units/mission/firefly_death.png", Loop = false, NumFrames = 8, Time = .14, PosX = -20, PosY = -2 }
a.CrystalFireflye = a.CrystalFirefly:new{Image = "units/mission/firefly_emerge.png", PosX = -23, PosY = -2, NumFrames = 10}

a.CrystalScorpion = a.BaseUnit:new{Image = "units/mission/scorpion.png", PosX = -16, PosY = -2 }
a.CrystalScorpiona = a.CrystalScorpion:new{Image = "units/mission/scorpiona.png", PosX = -15, PosY = -2, NumFrames = 4 }
a.CrystalScorpiond = a.CrystalScorpion:new{ Image = "units/mission/scorpion_death.png", PosX = -18, PosY = -5, Loop = false, NumFrames = 8, Time = .14 }
a.CrystalScorpione = a.CrystalScorpion:new{Image = "units/mission/scorpion_emerge.png", PosX = -24, PosY = -1, NumFrames = 10}

a.CrystalScarab = a.BaseUnit:new{Image = "units/mission/scarab.png", PosX = -18, PosY = -3}
a.CrystalScaraba = a.CrystalScarab:new{Image = "units/mission/scaraba.png", NumFrames = 4, PosX = -20, PosY = -3}
a.CrystalScarabd = a.CrystalScarab:new{ Image = "units/mission/scarab_death.png", Loop = false, NumFrames = 8, Time = .14, PosX = -21, PosY = -3 }
a.CrystalScarabe = a.CrystalScarab:new{Image = "units/mission/scarab_emerge.png", PosX = -23, PosY = -3, NumFrames = 10}


ANIMS.BurrowOpenClose = Animation:new{
    Image = "effects/burrow_openclose.png",
    NumFrames = 14,
    Frames = {1,2,3,4,5,6,7,8},
    Time = 0.07,
    PosX = -27,
    PosY = 0,
    Layer = LAYER_FLOOR        --lets you create an animation visually behind pawns
}

--MISSION
Mission_Nautilus_Digging = Mission_Infinite:new{
  Name = "Vek Excavation",
  Objectives = Objective("Dig up and Kill the Fossilized Vek",2),
  ExcavatorPawn = "NAH_Excavator",
  Excavator = nil,
  DigSite = Point(-1,-1),
  PawnId = nil,
  spawnPawn = nil,
  UseBonus = false,
}

function Mission_Nautilus_Digging:IsPointValid(space)
  local tile = Board:GetTerrain(space)
  local dist = Board:GetPawn(self.Excavator):GetSpace():Manhattan(space)
	return Board:IsValid(space) and
			not Board:IsPod(space) and
			not Board:IsBuilding(space) and
      not Board:GetPawn(space) and
      dist >= 5 and
      dist <= 8 and --Two moves away
			tile ~= TERRAIN_WATER
end

function Mission_Nautilus_Digging:StartMission()
  local loc = Board:AddPawn(self.ExcavatorPawn)
  self.Excavator = Board:GetPawn(loc):GetId()

  choices = {}
  for i=4,6 do
    for j=1,6 do
      local point = Point(i,j)
      if self:IsPointValid(point) then
        choices[#choices+1] = point
      end
    end
  end

  local choice = random_removal(choices)
  Board:ClearSpace(choice)
  Board:BlockSpawn(choice,BLOCKED_PERM)
  self.DigSite = choice
  local types = {{"ground_buried_scorpion.png","CrystalScorpion"},{"ground_buried_scarab.png","CrystalScarab"},{"ground_buried_firefly.png","CrystalFirefly"}}
  local type = random_removal(types)
  Board:SetCustomTile(choice,type[1])
  self.spawnPawn = type[2]
 -- Board:SetTerrain(choice,17) --This probably needs to be something more consistent
end

function Mission_Nautilus_Digging:UpdateMission()
  if self.DigSite then
    Board:MarkSpaceDesc(self.DigSite,"NAH_Dig_Site")
  end
end

function Mission_Nautilus_Digging:GetCompletedObjectives()
  if self.DigSite == Point(-1,-1) and not Board:IsPawnAlive(self.PawnId) then
    return self.Objectives
  elseif Board:IsPawnAlive(self.PawnId) then
    return Objective("Dig up and Kill the Fossilized Vek (not killed)",1,2)
  else
    return self.Objectives:Failed()
  end
end

function Mission_Nautilus_Digging:UpdateObjectives()
  local status = (self.DigSite ~= Point(-1,-1) and not Board:IsPawnAlive(self.Excavator) and OBJ_FAILED) or
  (self.DigSite == Point(-1,-1) and not Board:IsPawnAlive(self.PawnId) and OBJ_COMPLETE) or
  OBJ_STANDARD
  Game:AddObjective("Excavate and Kill the Fossilized Vek", status, REWARD_REP, 2)
end

--ENEMY
CrystalRock =
	{
		Name = "Rock",
		Health = 1,
		Neutral = true,
		MoveSpeed = 0,
		IsPortrait = false,
		Image = "CrystalRock",
		SoundLocation = "/support/rock/",
		MoveSpeed = 0,
		DefaultTeam = TEAM_NONE,
		ImpactMaterial = IMPACT_ROCK
	}
AddPawn("CrystalRock")

CrystalFirefly =
	{
		Name = "Fossil Firefly",
		Health = 4,
		Image = "CrystalFirefly",
		MoveSpeed = 3,
		SkillList = { "FireflyAtk1" },
		SoundLocation = "/enemy/firefly_soldier_1/",
		DefaultTeam = TEAM_ENEMY,
		--Portrait = "portraits/scorpion.png",
	}
AddPawn("CrystalFirefly")

CrystalScarab =
	{
		Name = "Fossil Scarab",
		Health = 4,
		Image = "CrystalScarab",
		MoveSpeed = 3,
		SkillList = { "ScarabAtk1" },
		SoundLocation = "/enemy/scarab_1/",
		DefaultTeam = TEAM_ENEMY,
		--Portrait = "portraits/scorpion.png",
	}
AddPawn("CrystalScarab")

CrystalScorpion =
	{
		Name = "Fossil Scorpion",
		Health = 4,
		Image = "CrystalScorpion",
		MoveSpeed = 3,
		SkillList = { "ScorpionAtk1" },
		SoundLocation = "/enemy/scorpion_soldier_1/",
		DefaultTeam = TEAM_ENEMY,
		--Portrait = "portraits/scorpion.png",
	}
AddPawn("CrystalScorpion")

function CrystalFirefly:GetDeathEffect(p)
  ret = SkillEffect()
  local points = {}
  for i=DIR_START,DIR_END do
    local curr = p + DIR_VECTORS[i]
    if Board:IsValid(curr) and not Board:IsBlocked(curr,PATH_GROUND) and Board:GetItem(curr) == "" then
      table.insert(points,curr)
    end
  end

  local animation = SpaceDamage(p)
  animation.sAnimation = "Nautilus_spike_emerge"
  for _, point in ipairs(points) do
    animation.loc = point
    ret:AddDamage(animation)
  end

  local anim = ANIMS.Nautilus_spike_emerge
  ret:AddDelay(anim.Time*anim.NumFrames)

  local damage = SpaceDamage(p)
  damage.sItem = "Nautilus_Spike_Mine"
  for _, point in ipairs(points) do
    damage.loc = point
    ret:AddDamage(damage)
  end

  return ret
end

CrystalScarab.GetDeathEffect = CrystalFirefly.GetDeathEffect
CrystalScorpion.GetDeathEffect = CrystalFirefly.GetDeathEffect

--Traits
trait:add{
	pawnType = "CrystalFirefly",
	icon = mod.resourcePath.."img/combat/traits/Nautilus_spikes_trait.png",
	--icon_offset = Point(0,-15),
	desc_title = "Spiky Insides",
	desc_text = "Explodes into Crystal Spikes on all adjacent tiles on death.",
}
trait:add{
	pawnType = "CrystalScarab",
	icon = mod.resourcePath.."img/combat/traits/Nautilus_spikes_trait.png",
	--icon_offset = Point(0,-15),
	desc_title = "Spiky Insides",
	desc_text = "Explodes into Crystal Spikes on all adjacent tiles on death.",
}
trait:add{
	pawnType = "CrystalScorpion",
	icon = mod.resourcePath.."img/combat/traits/Nautilus_spikes_trait.png",
	--icon_offset = Point(0,-15),
	desc_title = "Spiky Insides",
	desc_text = "Explodes into Crystal Spikes on all adjacent tiles on death.",
}


NAH_Excavator = {
  Name = "Excavator",
  Health = 2,
  MoveSpeed = 4,
  Image = "Nautilus_Excavator", --Change
  SoundLocation = "/support/civilian_tank/", --Probably Change
  DefaultTeam = TEAM_PLAYER,
  SkillList = {"NAH_ExcavatorSkill"},
  Massive = true,
}
AddPawn("NAH_Excavator")

NAH_ExcavatorSkill = Skill:new{
  Name = "Excavator",
  Description = "Crack the tile beneath you and throw a rock. If standing on the dig site, throw the Vek in it instead.",
  Class = "",
  Icon = "weapons/excavatorbucket.png",
  Damage = 0,
  LaunchSound = "/weapons/shift",
  ImpactSound = "/impact/dynamic/rock", --Doesn't seem to work properly; it's just in the effect now
  Animation = "BurrowOpenClose",
  TipImage = {
    Unit = Point(2,2),
    Target = Point(2,1),
    CustomPawn = "NAH_Excavator",
  }
}

function NAH_ExcavatorSkill:GetTargetArea(p1)
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

function NAH_ExcavatorSkill:GetSkillEffect(p1,p2)
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
	if Board:GetPawn(point):GetType() ~= "CrystalRock" then
		GetCurrentMission().PawnId = Board:GetPawn(point):GetId()
	end
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
  local dig_site = mission.DigSite and p1 == mission.DigSite
  if dig_site then
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

  --Add impact sound
  ret:AddDelay(.8)
  ret:AddSound("/impact/dynamic/rock")

  return ret
end

function this:init(mod)

end
