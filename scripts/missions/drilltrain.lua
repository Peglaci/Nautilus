Nautilus_Mission_Drilltrain = Mission_Infinite:new{
	Name = "Drill Train",
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

function Nautilus_Mission_Drilltrain:StartMission()
	local train = PAWN_FACTORY:CreatePawn(self.TrainPawn)
	self.Train = train:GetId()
	Board:AddPawn(train,Point(4,6))
	
	local choices = {TERRAIN_MOUNTAIN,TERRAIN_HOLE}
	local terrain = random_removal(choices)
	for i = 0, 7 do
		local curr = Point(4,i)
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
		if choice then -- %chance of obstacle
			obstacle = false
		end
		
		if obstacle then
			Board:SetTerrain(curr,terrain)
		else
			Board:SetTerrain(curr,0)
		end
	end
	
	
end

function Nautilus_Mission_Drilltrain:IsTrainAlive()
	return Board:IsPawnAlive(self.Train)
end	

function Nautilus_Mission_Drilltrain:UpdateObjectives()
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

function Nautilus_Mission_Drilltrain:GetCompletedObjectives()
	if self:IsTrainAlive() then
		if self.TrainStopped then
			return Objective("Protect the damaged Rail Layer", 1, 2)
		else
			return self.Objectives
		end
	end
	
	return self.Objectives:Failed()
end

function Nautilus_Mission_Drilltrain:StopTrain()
	local trainPawn = Board:GetPawn(self.Train)
	if trainPawn then Board:RemovePawn(trainPawn) end
	
	local train = PAWN_FACTORY:CreatePawn(self.TrainDamaged)
	self.Train = train:GetId()
	Board:AddPawn(train,self.TrainLoc)
	self.TrainStopped = true
	
	--self:TriggerMissionEvent("TrainStopped")
end

function Nautilus_Mission_Drilltrain:UpdateMission()
	
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
	Image = "train_armored",
	MoveSpeed = 0,
	SkillList = { "Nautilus_Drilltrain_Move" },
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
	Image = "train_dual_damaged",
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
		Enemy = Point(2,1),
		Target = Point(2,2),
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
		q_move:push_back(current)
		ret:AddQueuedDamage(SpaceDamage(current,DAMAGE_DEATH))
		
		if Board:IsPawnSpace(current, false) and Board:GetPawn(current, false):IsCorpse() then
			ret:AddQueuedScript("Board:GetPawn("..current:GetString()..",false):FlyAway()")
		end
		
		ret:AddQueuedScript("Board:SetTerrain("..(current-VEC_UP*2):GetString()..",0)")
		ret:AddQueuedScript("Board:SetCustomTile("..(current-VEC_UP*2):GetString()..",'ground_rail.png')")
		ret:AddQueuedScript("Board:SetTerrain("..current:GetString()..",0)")
		ret:AddQueuedScript("Board:SetCustomTile("..current:GetString()..",'ground_rail.png')")
		current = current + VEC_UP
	end
	
	ret:AddQueuedCharge(q_move, FULL_DELAY)
	
	return ret
end

function Nautilus_Drilltrain_Move:GetTargetScore(p1, p2)
	return 100
end