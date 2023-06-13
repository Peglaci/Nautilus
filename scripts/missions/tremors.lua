-- mission Mission_Nautilus_Tremors
--Mission By: NamesAreHard: NAH

--Assets:
local mod = mod_loader.mods[modApi.currentMod]

Mission_Nautilus_Tremors = Mission_Auto:new{
  Name = "Tremors",
  Environment = "Env_Tremors",
  --Objectives = Objective("Incinerate 2 Vek",1),
}

Env_Tremors = Env_Attack:new{
  Name = "Tremors",
  Text = "Tremors cause cracks to form around a central point.",
  CombatName = "TREMORS",
	CombatIcon = "combat/tile_icon/tile_rock.png",
  StratText = "TREMORS",
  Removals = 2,
  Instant = true,
}

function Env_Tremors:MarkSpace(space,active)
	Board:MarkSpaceImage(space,self.CombatIcon, GL_Color(255,226,88,0.75))
	Board:MarkSpaceDesc(space,"NAH_Tremor")

	if active then
		Board:MarkSpaceImage(space,self.CombatIcon, GL_Color(255,150,150,0.75))
	end
end

function Env_Tremors:ApplyStart() --Runs once before the effect
	local effect = SkillEffect()
	effect:AddBoardShake(.5) --Time
  effect:AddDelay(.4) --Didn't work but eh whatever
	Board:AddEffect(effect)
end

function Env_Tremors:GetAttackEffect(location, effect) --When instant, passes in effect
	local damage = SpaceDamage(location, 0)
  damage.iCrack = EFFECT_CREATE
	effect:AddDamage(damage)
  effect:AddBounce(location,2)
  effect:AddBurst(location,"Emitter_Crack_Start",DIR_NONE)
  local odds = 50
  if math.random(1,100) <= odds then
    effect:AddDelay(.1)
  end

	return effect
end

function Env_Tremors:SelectSpaces()

  local choices = {}
  for i=2,6 do
    for j=1,6 do
      table.insert(choices,Point(i,j))
    end
  end

  local center = random_removal(choices)

  local base = extract_table(general_DiamondTarget(center,2)) --The base tiles, which will then be pruned
  for i=1,self.Removals do
    random_removal(base)
  end

  local ret = {}
  for k,v in ipairs(base) do
    local terrain = Board:GetTerrain(v)
    if not Board:IsBuilding(v) and not Board:IsPod(v) and terrain ~= TERRAIN_WATER and terrain ~= TERRAIN_HOLE then
      table.insert(ret,v)
    end
  end
  return randomize(ret) --Makes them crack in a random order
end
