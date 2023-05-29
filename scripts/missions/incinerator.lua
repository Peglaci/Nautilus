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
  Layer = ANIMS.LAYER_FLOOR--LAYER_BACK,
}


Mission_Nautilus_Incinerator = Mission_Auto:new{
  Name = "Incinerator",
  Objectives = Objective("Incinerate 2 Vek",1),
	Incinerator = Point(-1,-1),
  Incinerated = 0,
  VekN = 2
}

function Mission_Nautilus_Incinerator:GetRequirement()
	if GetDifficulty() == DIFF_EASY then
		return 1
	else
		return 2
	end
end

function Mission_Nautilus_Incinerator:IsValidTarget(space)
	local ret = (not Board:IsUniqueBuilding(space) and not Board:IsPod(space))

	for i = DIR_START, DIR_END do -- check tiles around the incinerator
		local adj = space + DIR_VECTORS[i]
		local ort = adj + DIR_VECTORS[(i+1)%4]
		if Board:IsUniqueBuilding(adj) or Board:IsUniqueBuilding(ort) then
			ret = false
		end
	end

	return ret
	-- local tile = Board:GetTerrain(space)

	-- return Board:IsValid(space) and
			-- not Board:IsPod(space)-- and
			-- not Board:IsBuilding(space) and
			-- tile ~= TERRAIN_WATER
end

function Mission_Nautilus_Incinerator:StartMission()
	self.Objectives.text = "Incinerate "..self:GetRequirement().." Vek"
	--self.Objectives = Objective("Incinerate "..self:GetRequirement().." Vek",1)

  local choices = {}
  --Find all possible places
  for i=4,5 do
    for j=2,5 do
      local point = Point(i,j)
      if self:IsValidTarget(point) then
        choices[#choices+1] = Point(i,j)
      end
    end
  end
  --Find more places if none found
  if #choices == 0 then
    for i=3,6 do
      for j=2,5 do
        local point = Point(i,j)
        if self:IsValidTarget(point) then
          choices[#choices+1] = Point(i,j)
        end
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

		for i = DIR_START, DIR_END do -- clean tiles around the incinerator
			local adj = choice + DIR_VECTORS[i]
			local ort = adj + DIR_VECTORS[(i+1)%4]
			Board:SetTerrain(ort,0)
			Board:SetTerrain(adj,0)
		end

	else
    LOG("This should never show up, @NamesAreHard#2501 on discord if you see it. Nautilus.") --There should always be a valid spot
  end
end

function Mission_Nautilus_Incinerator:UpdateMission()
	-- if self.Incinerator then
	  -- local point = self.Incinerator
	  -- Board:MarkSpaceDesc(point,"Nautilus_Incinerator",EFFECT_DEADLY) --Text in TILE_TOOLTIPS
	-- end
end

function Mission_Nautilus_Incinerator:GetCompletedObjectives()
  if self.Incinerated >= self:GetRequirement() then
    return self.Objectives
  else
    return self.Objectives:Failed()
  end
end

function Mission_Nautilus_Incinerator:UpdateObjectives()
	local status = self.Incinerated >= self:GetRequirement() and OBJ_COMPLETE or OBJ_STANDARD
	Game:AddObjective(string.format("Incinerate %i Vek (%s/%i incinerated)",self:GetRequirement(),tostring(self.Incinerated),self:GetRequirement()),status, REWARD_REP, 1)
end

--toxs tooltips
local HOOK_onTileHighlighted = function(mission, point)
	-- Override chasm tile tooltip when highlighting Incinerator
	-- Board:MarkSpaceDesc is used by environment effects and could conflict
	mission = GetCurrentMission()
	if mission and mission.Incinerator and point == mission.Incinerator and Board:GetTerrain(point) == TERRAIN_HOLE then
		modApi.modLoaderDictionary["Tile_chasm_Title"] = TILE_TOOLTIPS.Nautilus_Incinerator[1]
		modApi.modLoaderDictionary["Tile_chasm_Text"] = TILE_TOOLTIPS.Nautilus_Incinerator[2]
	else
		modApi.modLoaderDictionary["Tile_chasm_Title"] = nil
		modApi.modLoaderDictionary["Tile_chasm_Text"] = nil
	end
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
  modapiext:addTileHighlightedHook(HOOK_onTileHighlighted)
end

modApi.events.onModsLoaded:subscribe(EVENT_onModsLoaded)
