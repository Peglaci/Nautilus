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
  Layer = ANIMS.LAYER_FLOOR,
}

Mission_Nautilus_Incinerator = Mission_Auto:new{
  Name = "Incinerator",
  Objectives = Objective("Incinerate 2 Vek",1),
	Incinerator = Point(-1,-1),
  Incinerated = 0,
}

function Mission_Nautilus_Incinerator:IsValidTarget(space)
	local tile = Board:GetTerrain(space)

	return Board:IsValid(space) and
			not Board:IsPod(space) and
			not Board:IsBuilding(space) and
			tile ~= TERRAIN_WATER
end

function Mission_Nautilus_Incinerator:StartMission()
  local choices = {}

  --Find all possible places
  for i=3,5 do
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
		Board:SetTerrain(choice,TERRAIN_HOLE)
    Board:BlockSpawn(choice,BLOCKED_PERM)
	else
    LOG("This should never show up, @NamesAreHard#2501 on discord if you see it. Nautilus.") --There should always be a valid spot
  end
end

function Mission_Nautilus_Incinerator:UpdateMission()
	if self.Incinerator then
	  local point = self.Incinerator
	  Board:MarkSpaceDesc(point,"Nautilus_Incinerator",EFFECT_DEADLY) --Text in TILE_TOOLTIPS
	end
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

local function HOOK_PawnKilled(mission,pawn)
	if mission.Incinerator and mission.Incinerated ~= nil then
		local space = pawn:GetSpace()
		if space == mission.Incinerator and pawn:GetTeam() == TEAM_ENEMY then
			mission.Incinerated = mission.Incinerated+1

			local effect = SkillEffect()
		  effect:AddBoardShake(1.5)
			effect:AddDelay(1.8) --Add smoke
			local damage = SpaceDamage(mission.Incinerator)
			damage.sAnimation = "ExploAir1"
			effect:AddDamage(damage)
			Board:AddEffect(effect)
		end
	end
end

local function EVENT_onModsLoaded()
  modapiext:addPawnKilledHook(HOOK_PawnKilled)
end

modApi.events.onModsLoaded:subscribe(EVENT_onModsLoaded)
