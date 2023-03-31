-- mission Mission_Nautilus_Incinerator
--Mission By: NamesAreHard: NAH

--Assets:
local mod = mod_loader.mods[modApi.currentMod]

modApi:appendAsset("img/units/mission/incinerator.png",mod.resourcePath.."img/units/mission/incinerator.png")

ANIMS.Incinerator = Animation:new {
	Image = "units/mission/incinerator.png",
	NumFrames = 6,
	Time = 0.2,
	PosX = -29,
	PosY = 0,
  Loop = true,
  Layer = ANIMS.LAYER_BACK,
}

Mission_Nautilus_Incinerator = Mission_Auto:new{
  Name = "Incinerator",
  Environment = "Env_Incinerator",
  Objectives = Objective("Incinerate 2 Vek",1),
  Incinerated = 0,
}

Env_Incinerator = Environment:new{
  Name = "Incinerator",
  Text = "The incinerator shreds any units standing on its tile.",
  CombatName = "INCINERATOR",
	CombatIcon = "combat/tile_icon/tile_conveyor.png", --CHANGE
  StratText = "INCINERATOR",
	Incinerator = nil,
}

function Env_Incinerator:MarkBoard()
  local point = self.Incinerator
  --Board:SetCustomTile(point,"conveyor"..self.BeltsDir[i]..".png")
  Board:MarkSpaceDesc(point,"Nautilus_Incinerator",EFFECT_DEADLY) --Text in TILE_TOOLTIPS
  --Board:SetTerrainIcon(point,"arrow_"..self.BeltsDir[i])
end

function Env_Incinerator:Start()
  local choices = {}

  --Find all possible places
  for i=3,5 do --Temporary, look at how other things add things to random places
    for j=2,5 do
      local point = Point(i,j)
      if self:IsValidTarget(point) then
        choices[#choices+1] = Point(i,j)
      end
    end
  end
  --Choose one randomly
  if #choices ~= 0 then
		local choice = random_removal(choices)
    self.Incinerator = choice
    Board:AddAnimation(choice,"Incinerator",ANIM_NO_DELAY) --This animation loops forever
    Board:BlockSpawn(choice,BLOCKED_PERM)
	else
    LOG("AAAAAAA") --There should always be a valid spot
  end

  self:MarkBoard()
end

function Environment:IsEffect()
  return self.Incinerator ~= nil --If there's an incinerator run the effect
end

function Env_Incinerator:ApplyEffect()
  local effect = SkillEffect()
  local damage = SpaceDamage(self.Incinerator,DAMAGE_DEATH)
  damage.sScript = string.format([[
    local pawn = Board:GetPawn(%s)
    local mission = GetCurrentMission()
    if pawn and pawn:GetTeam() == TEAM_ENEMY then
      mission.Incinerated = mission.Incinerated + 1
    end
  ]], damage.loc:GetString())
  effect:AddDamage(damage)
  effect:AddBounce(damage.loc,3)
  Board:AddEffect(effect)

  return false
end

function Mission_Nautilus_Incinerator:GetCompletedObjectives()
  if self.Incinerated >= 2 then
    return self.Objectives
  else
    return self.Objectives:Failed()
  end
end

function Mission_Nautilus_Incinerator:UpdateObjectives()
	local status = self.Incinerated >= 2 and OBJ_COMPLETE or OBJ_STANDARD
	Game:AddObjective(string.format("Incinerate 2 Vek\n(%s/2 incinerated)",tostring(self.Incinerated)),status, REWARD_REP, 1)
end
