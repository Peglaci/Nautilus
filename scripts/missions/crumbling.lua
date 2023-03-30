local mod = mod_loader.mods[modApi.currentMod]

Mission_Nautilus_Crumbling = Mission_Auto:new{
  Name = "Crumbling Cave",
  Environment = "Env_Nautilus_Crumbling",
  BonusPool = {BONUS_GRID, BONUS_MECHS, BONUS_KILL_FIVE, BONUS_SELFDAMAGE},
  -- Took out BONUS_BLOCK because it's hard in combination with environment
  -- Took out BONUS_PACIFIST because good luck with that
  TurnLimit = 4, --normal
  BlockSecret = true,
  --Objectives = Objective("Incinerate 2 Vek",1),
}

Env_Nautilus_Crumbling = Env_Attack:new{
  Name = "Crumbling Cave",
  Text = "The land slowly crumbles from the outside in.",
  CombatName = "CRUMBLING",
	CombatIcon = "combat/tile_icon/tile_crack.png",
  StratText = "CRUMBLING CAVE",
  Distance = 1, --Distance from edge
  Locations = {},
  Planned = {},
  Instant = true,
	--Image = "env_lightning",
}

Global_Texts = {
  TipTitle_Env_Nautilus_Crumbling = "Crumbling Cave",
  TipText_Env_Nautilus_Crumbling = "The land slowly crumbles from the outside in.",
}

TILE_TOOLTIPS = {
  NAH_Crumbling = {"Crumbling Tile","This tile will crumble out of existence."}
}

function Env_Nautilus_Crumbling:IsValidTarget(space)
  local tile = Board:GetTerrain(space)

	return Board:IsValid(space) and
			not Board:IsBuilding(space) and
			tile ~= TERRAIN_HOLE and
      tile ~= TERRAIN_MOUNTAIN and
      tile ~= TERRAIN_RUBBLE
end

function Env_Nautilus_Crumbling:PointIsEdge(point)
  local offset = Point(self.Distance,self.Distance)
  return false or
    not Board:IsValid(point+offset) or
    not Board:IsValid(point-offset)
end

function Env_Nautilus_Crumbling:MarkSpace(space,active)
  Board:MarkSpaceImage(space,self.CombatIcon, GL_Color(255,226,88,0.75))
	Board:MarkSpaceDesc(space,"NAH_Crumbling", EFFECT_DEADLY)

	if active then
		Board:MarkSpaceImage(space,self.CombatIcon, GL_Color(255,150,150,0.75))
	end
end

function Env_Nautilus_Crumbling:IsTurn()
  return Board:GetTurn() % 2 == 1
end

function Env_Nautilus_Crumbling:IsEffect()
	return self:IsTurn() and #self.Locations ~= 0
end

--Block initial location
function Env_Nautilus_Crumbling:Start()
  local board_size = Board:GetSize()
  for i=0,board_size.x-1 do
    for j=0,board_size.y-1 do
      local point = Point(i,j)
      if self:PointIsEdge(point) then
        Board:BlockSpawn(point,BLOCKED_TEMP) --Is working?
      end
    end
  end
end

Env_Nautilus_Crumbling.BasePlan = Env_Nautilus_Crumbling.Plan

function Env_Nautilus_Crumbling:Plan()
	if not self:IsTurn() then --We plan on the previous turn, so we want to see if it's not the right turn
    return self:BasePlan(self)
  end
  return false
end

function Env_Nautilus_Crumbling:ApplyStart() --Runs once before the effect
  self.Distance = self.Distance + 1
  local effect = SkillEffect()
  effect:AddBoardShake(1.5)
  effect:AddSound("/props/ground_break_line")
	Board:AddEffect(effect)

  local turn = Board:GetTurn()
  --BLOCK NEW SPAWNS
  modApi:conditionalHook(
  function()
    return Board:GetTurn() > turn+1--We got to wait like, forever cause block spawn hates me
  end,
  function()
    local board_size = Board:GetSize()
    for i=0,board_size.x-1 do
      for j=0,board_size.y-1 do
        local point = Point(i,j)
        if self:PointIsEdge(point) then
          Board:BlockSpawn(point,BLOCKED_PERM)--Is working?
        end
      end
    end
  end)
end

function Env_Nautilus_Crumbling:GetAttackEffect(location,effect) --When instant, passes in effect
  local damage = SpaceDamage(location)
	damage.iTerrain = TERRAIN_HOLE
	--damage.fDelay = 0.2
  effect:AddDamage(damage)
  return effect
end

function Env_Nautilus_Crumbling:SelectSpaces()
  local ret = {}
  local board_size = Board:GetSize()

  for i=0,board_size.x-1 do
    for j=0,board_size.y-1 do
      local point = Point(i,j)
      if self:PointIsEdge(point) and self:IsValidTarget(point) then --custom is valid needed
        ret[#ret+1] = point
        --Board:BlockSpawn(point,BLOCKED_PERM)
      end
    end
  end

  return ret
end
