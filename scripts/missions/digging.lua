-- mission Mission_Nautilus_Digging
--Mission By: NamesAreHard: NAH
--[[
"Normal Missions"
Mission Definition:
Name = Name of the mission
Objectives = Objective()

]]

--TODO:
--Excavator sounds, animations, and sprites, and weapon icon
--Dig Site Animation? How to mark?
--Other Excavator action: Dig up rocks, crack current tile and chuck
--Easy Edit Icons, need other art first

--Board:SetCustomTile(choice,"square_missilesilo.png")
local this = {id = "Mission_Nautilus_Digging"}
local mod = mod_loader.mods[modApi.currentMod]
local previewer = mod.libs.weaponPreview

modApi:appendAsset("img/effects/burrow_openclose.png",mod.resourcePath.."img/effects/burrow_openclose.png") --Thanks to Metalocif for the animation
modApi:appendAsset("img/units/mission/excavator.png", mod.resourcePath .."img/units/mission/excavator.png")
modApi:appendAsset("img/units/mission/excavator_a.png", mod.resourcePath .."img/units/mission/excavator_a.png")
modApi:appendAsset("img/units/mission/Rock1.png", mod.resourcePath .."img/units/mission/Rock1.png")


local a = ANIMS
a.Nautilus_Excavator = a.BaseUnit:new{Image = "units/mission/excavator.png", PosX = -24, PosY = -9}
a.Nautilus_Excavatora = a.Nautilus_Excavator:new{Image = "units/mission/excavator_a.png", NumFrames = 4 }

ANIMS.BurrowOpenClose = Animation:new{
    Image = "effects/burrow_openclose.png",
    NumFrames = 14,
    Frames = {1,2,3,4,5,6,7,8},
    Time = 0.07,
    PosX = -27,
    PosY = 0,
    Layer = LAYER_FLOOR        --lets you create an animation visually behind pawns
}

Mission_Nautilus_Digging = Mission_Infinite:new{
  Name = "Vek Excavation",
  Objectives = Objective("Dig up and kill the Fossilized Vek",1),
  EnemyPawn = "GlowingScorpion", --Probably Change, change in weapon
  ExcavatorPawn = "NAH_Excavator",
  Excavator = nil,
  DigSite = Point(-1,-1),
  PawnId = nil,
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
  Board:BlockSpawn(choice,BLOCKED_PERM)
  self.DigSite = choice
  Board:SetTerrain(choice,17) --This probably needs to be something more consistent
end

function Mission_Nautilus_Digging:UpdateMission()
  if self.DigSite then
    Board:MarkSpaceDesc(self.DigSite,"NAH_Dig_Site")
  end
end

function Mission_Nautilus_Digging:GetCompletedObjectives()
  if self.DigSite == Point(-1,-1) and not Board:IsPawnAlive(self.PawnId) then
    return self.Objectives
  else
    return self.Objectives:Failed()
  end
end

function Mission_Nautilus_Digging:UpdateObjectives()
  local status = (self.DigSite ~= Point(-1,-1) and not Board:IsPawnAlive(self.Excavator) and OBJ_FAILED) or
  (self.DigSite == Point(-1,-1) and not Board:IsPawnAlive(self.PawnId) and OBJ_COMPLETE) or
  OBJ_STANDARD
  Game:AddObjective("Excavate and Kill the Volatile Vek", status, REWARD_REP, 1)
end

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
  Description = "Crack the tile beneath you and throw a rock. If on the dig site, throw the Vek in it instead.",
  Class = "",
  Icon = "advanced/weapons/Prime_KO_Crack", --Change
  Damage = 0,
  LaunchSound = "/weapons/shift",
  EnemyPawn = "GlowingScorpion",
  Animation = "BurrowOpenClose",
  TipImage = {
    Unit = Point(2,2),
    Target = Point(2,1),
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
  local spawnPawn = "Wall"
  if (mission.DigSite and p1 == mission.DigSite) then --Board:IsTipImage() or
    spawnPawn = self.EnemyPawn
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
    ret:AddScript("GetCurrentMission().DigSite = nil")
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
