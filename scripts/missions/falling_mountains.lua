-- mission Mission_Nautilus_Falling_Mountains
--Mission By: NamesAreHard: NAH

--Assets:
local mod = mod_loader.mods[modApi.currentMod]

modApi:appendAsset("img/combat/tile_icon/icon_stalactites.png", mod.resourcePath .."img/combat/tile_icon/icon_stalactites.png")
Location["combat/tile_icon/icon_stalactites.png"] = Point(-27,2)
modApi:appendAsset("img/units/mission/rock3.png", mod.resourcePath .."img/units/mission/rock3.png")
Location["units/mission/rock3.png"] = Point(-27,2)

Mission_Nautilus_Falling_Mountains = Mission_Auto:new{
  Name = "Stalactites",
  Environment = "Env_Falling_Mountains",
  --Objectives = Objective("Incinerate 2 Vek",1),
}

Env_Falling_Mountains = Env_Attack:new{
  Name = "Falling Mountains",
  Text = "Stalactites fall from the sky, killing any units they land on.",
  CombatName = "STALACTITES",
	CombatIcon = "combat/tile_icon/icon_stalactites.png",
  StratText = "STALACTITES",
	Random = random_int(2) --Randomizes which quarters it starts at
	--Image = "env_lightning",
}

function Env_Falling_Mountains:MarkSpace(space,active)
	Board:MarkSpaceImage(space,self.CombatIcon, GL_Color(255,226,88,0.75))
	Board:MarkSpaceDesc(space,"NAH_Falling_Mountain", EFFECT_DEADLY)

	if active then
		Board:MarkSpaceImage(space,self.CombatIcon, GL_Color(255,150,150,0.75))
	end
end

function Env_Falling_Mountains:ApplyStart() --Runs once before the effect
	local effect = SkillEffect()
	effect:AddBoardShake(2) --Time
	Board:AddEffect(effect)
end

function Env_Falling_Mountains:GetAttackEffect(location) --Runs for each location
	local effect = SkillEffect()

	local damage = SpaceDamage(location, DAMAGE_DEATH)
	damage.iTerrain = TERRAIN_MOUNTAIN
	damage.sScript = string.format([[
		local point = %s
		local oldTerrain = Board:GetTerrain(point)
		modApi:runLater(function()
			local pawn = Board:GetPawn(point)
			if pawn then
				Board:SetTerrain(point,oldTerrain)
			else
				Board:SetHealth(point,1,2)
			end
		end)
	]],location:GetString())

	effect:AddDropper(damage,"units/mission/rock3.png")
  effect:AddSound("/props/ground_break_tile")
  effect:AddDelay(.8)
  effect:AddSound("/impact/dynamic/rock")
	return effect
end

function Env_Falling_Mountains:SelectSpaces()
	local ret = {}
	local turn = Board:GetTurn() + self.Random
	local bad_quarters = self:GetQuarters()
	local quarters = {}
	local order = {1,2,4,3} --Reorder quarters, so that the quarters opposite are in 1 3 and 2 4
	for _, v in ipairs(order) do
		quarters[#quarters+1] = bad_quarters[v]
	end

	for i, v in ipairs(quarters) do
		if i%2 == turn%2 then
			ret[#ret+1] = random_element(v)
		end
	end

	return ret
end

--[[
function Mission_NAH_Incinerator:GetCompletedObjectives()
  if self.Incinerated >= 2 then
    return self.Objectives
  else
    return self.Objectives:Failed()
  end
end

function Mission_NAH_Incinerator:UpdateObjectives()
	local status = self.Incinerated >= 2 and OBJ_COMPLETE or OBJ_STANDARD
	Game:AddObjective(string.format("Incinerate 2 Vek\n(%s/2 incinerated)",tostring(self.Incinerated)),status, REWARD_REP, 1)
end
]]
