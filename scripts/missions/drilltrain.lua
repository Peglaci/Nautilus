local mod = mod_loader.mods[modApi.currentMod]
local path = mod.resourcePath

-- sprites and animations
modApi:appendAsset("img/units/mission/raillayer.png",path.."img/units/mission/raillayer.png")
modApi:appendAsset("img/units/mission/raillayer_a.png",path.."img/units/mission/raillayer_a.png")
modApi:appendAsset("img/units/mission/raillayer_damaged.png",path.."img/units/mission/raillayer_damaged.png")
modApi:appendAsset("img/units/mission/raillayer_broken.png",path.."img/units/mission/raillayer_broken.png")

local a = ANIMS

a.nautilus_train_drill = 				a.BaseUnit:new{ Image = "units/mission/raillayer.png", PosX = -46, PosY = -2 }
a.nautilus_train_drilla = 				a.BaseUnit:new{ Image = "units/mission/raillayer_a.png", PosX = -46, PosY = -2, NumFrames = 4 } 
a.nautilus_train_drill_broken = 		a.BaseUnit:new{ Image = "units/mission/raillayer.png", PosX = -46, PosY = -2 }
a.nautilus_train_drill_damaged = 		a.BaseUnit:new{ Image = "units/mission/raillayer_damaged.png", PosX = -46, PosY = -2 }
a.nautilus_train_drill_damaged_broken = a.BaseUnit:new{ Image = "units/mission/raillayer_broken.png", PosX = -46, PosY = -2 }

-- mission
Mission_Nautilus_Drilltrain = Mission_Infinite:new{
	Name = "Rail Layer",
	Objectives = Objective("Protect the Rail Layer",2),
	MapTags = {"train"},
	Train = -1,
	TrainLoc = Point(-1,-1),
	TurnLimit = 3,
	TrainStopped = false,
	UseBonus = false,
	TrainPawn = "Nautilus_Drilltrain_Pawn",
	TrainDamaged = "Nautilus_Drilltrain_Damaged",
}

function Mission_Nautilus_Drilltrain:StartMission()
	local train = PAWN_FACTORY:CreatePawn(self.TrainPawn)
	self.Train = train:GetId()
	Board:AddPawn(train,Point(4,6))
	
	for i = 0, 7 do
		local order = {4,3,5}
		for _,j in ipairs(order) do
			local curr = Point(j,i)
			Board:SetCustomTile(curr,"")
			local obstacle = true
			for j = DIR_START, DIR_END do
				local adj = curr + DIR_VECTORS[j]
				local ort = adj + DIR_VECTORS[(j+1)%4]
				if Board:IsBlocked(ort, PATH_PROJECTILE) or i > 5 then -- and Board:IsBlocked(adj, PATH_GROUND) then
					obstacle = false
				end
			end
			
			local choices = {true,false,false}
			choice = random_removal(choices)
			if choice then -- remove some obstacles
				obstacle = false
			end
			
			if obstacle then
				Board:SetTerrain(curr,TERRAIN_MOUNTAIN)
			else
				Board:SetTerrain(curr,0)
			end
		end
	end
	
	
end

function Mission_Nautilus_Drilltrain:IsTrainAlive()
	return Board:IsPawnAlive(self.Train)
end	

function Mission_Nautilus_Drilltrain:UpdateObjectives()
	local status1 = not self.TrainStopped and OBJ_STANDARD or OBJ_FAILED
	
	if status1 == OBJ_FAILED then
		local status2 = self:IsTrainAlive() and OBJ_STANDARD or OBJ_FAILED
		
		if status2 == OBJ_FAILED then
			Game:AddObjective("Protect the Rail Layer", status2, REWARD_REP, 2)
		else
			Game:AddObjective("Protect the damaged Rail Layer", status2, REWARD_REP, 2, 1)
		end
	else
		Game:AddObjective("Protect the Rail Layer",status1, REWARD_REP, 2)
	end
end

function Mission_Nautilus_Drilltrain:GetCompletedObjectives()
	if self:IsTrainAlive() then
		if self.TrainStopped then
			return Objective("Protect the damaged Rail Layer", 1, 2)
		else
			return self.Objectives
		end
	end
	
	return self.Objectives:Failed()
end

function Mission_Nautilus_Drilltrain:StopTrain()
	local trainPawn = Board:GetPawn(self.Train)
	if trainPawn then Board:RemovePawn(trainPawn) end
	
	local train = PAWN_FACTORY:CreatePawn(self.TrainDamaged)
	self.Train = train:GetId()
	Board:AddPawn(train,self.TrainLoc)
	self.TrainStopped = true
	
	--self:TriggerMissionEvent("TrainStopped")
end

function Mission_Nautilus_Drilltrain:UpdateMission()
	
	--if not self:IsTrainAlive() and self.TrainStopped then
	--	self:TriggerMissionEvent("TrainDestroyed")
--	end
	
	--if self.TrainStopped then trainDesc = "It is too damaged to continue. Defend it." end
	
	local trainPawn = Board:GetPawn(self.Train)
		
	if not self:IsTrainAlive() then
		if not self.TrainStopped then
			self:StopTrain()
			return
		end
	end
	
	if trainPawn == nil then
		return
	end
	
	self.TrainLoc = trainPawn:GetSpace()
	
	if self.TrainStopped then
		trainPawn:SetActive(false)
	end
end

------- UNIT AND SKILLS FOR THE MISSION -------------------

Nautilus_Drilltrain_Pawn = 
{
	Name = "Rail Layer",
	Health = 1,
	Neutral = true,
	Image = "nautilus_train_drill",
	MoveSpeed = 0,
	SkillList = { "Nautilus_Drilltrain_Move" }, --{'Train_Move'},
	DefaultTeam = TEAM_PLAYER,
	IgnoreSmoke = true,
	IgnoreFlip = true,
	IgnoreFire = true,
	ExtraSpaces = { Point(0,1) },
	SoundLocation = "/support/train",
	Pushable = false,
	Corporate = true,
	Corpse = true
}
AddPawn("Nautilus_Drilltrain_Pawn") 

Nautilus_Drilltrain_Damaged = 
{
	Name = "Damaged Rail Layer",
	Health = 1,
	Neutral = true,
	IgnoreFire = true,
	Image = "nautilus_train_drill_damaged",
	MoveSpeed = 0,
	SkillList = { },
	DefaultTeam = TEAM_PLAYER,
	Corpse = true,
	SoundLocation = "/support/train",
	ExtraSpaces = { Point(0,1) },
	Pushable = false,
	Corporate = true
}
AddPawn("Nautilus_Drilltrain_Damaged")

--------------------

Nautilus_Drilltrain_Move = Skill:new{
	Name = "Giga Drill",
	Description = "Move two tiles forward, drilling through obstacles and laying rails in its wake.",
	Class = "Enemy",
	AttackAnimation = "ExploArt2",
	LaunchSound = "/support/train_armored/move",
	TipImage = {
		Unit = Point(2,3),
		Target = Point(2,2),
		-- Hole = Point(2,2),
		Mountain = Point(2,1),
		CustomPawn = "Nautilus_Drilltrain_Pawn"
	}
}

function Nautilus_Drilltrain_Move:GetTargetArea(point)
	local ret = PointList()
	ret:push_back(point + VEC_UP)
	return ret
end

function Nautilus_Drilltrain_Move:GetSkillEffect(p1, p2)
	local ret = SkillEffect()
	
	local q_move = PointList()
	
	q_move:push_back(p1)
	
	local current = p2
	local damage = Point(-1,-1)
	for k = 1, 2 do
		if Board:GetTerrain(current) == TERRAIN_HOLE or Board:GetTerrain(current) == TERRAIN_WATER then -- kill with chasm or water
			ret:AddQueuedDamage(SpaceDamage(current - VEC_UP,DAMAGE_DEATH))
			break
		end
		
		local dam = SpaceDamage(current)
		if Board:GetPawn(current) then
			dam.iDamage = DAMAGE_DEATH
			ret:AddQueuedDamage(dam)
		elseif Board:GetTerrain(current) == TERRAIN_MOUNTAIN or Board:GetTerrain(current) == TERRAIN_BUILDING then
			ret:AddQueuedScript("Board:DamageSpace("..(current):GetString()..",DAMAGE_DEATH)")
			-- dam.iTerrain = 0
			-- ret:AddQueuedDamage(dam)
		end
		
		if Board:IsPawnSpace(current, false) and Board:GetPawn(current, false):IsCorpse() then
			ret:AddQueuedScript("Board:GetPawn("..current:GetString()..",false):FlyAway()")
		end
		
		ret:AddQueuedScript("Board:SetCustomTile("..(current-VEC_UP*2):GetString()..",'ground_rail.png')")
		
		q_move:push_back(current)
		current = current + VEC_UP
	end
	
	ret:AddQueuedCharge(q_move, FULL_DELAY)
	
	return ret
end

function Nautilus_Drilltrain_Move:GetTargetScore(p1, p2)
	return 100
end