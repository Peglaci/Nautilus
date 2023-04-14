
local objText = "End the mission with at least 8 chasm tiles on the board."

Mission_Nautilus_Chasms = Mission_Infinite:new{
	Name = "Chasms",
	CrackCount = 16, 
	GoalChasms = 8,
	Objectives = Objective(objText,2,2),
	UseBonus = false,
}

function Mission_Nautilus_Chasms:StartMission()
	local choices = {}
	for i = 0, 7 do
		for j = 0, 7 do
			if 	Board:GetTerrain(Point(i,j)) == TERRAIN_ROAD then
			    choices[#choices+1] = Point(i,j)
			end
		end
	end
	
	self.CrackCount = math.min(#choices,self.CrackCount)
	for i = 1, self.CrackCount do
		local point = random_removal(choices)
		Board:SetCracked(point,true)
	end
end

function Mission_Nautilus_Chasms:GetChasmCount()
	
	local count = 0
	for i = 0, 7 do
		for j = 0, 7 do
			if 	Board:IsTerrain(Point(i,j),TERRAIN_HOLE) then
			    count = count + 1
			end
		end
	end
	
	return count
	
end

function Mission_Nautilus_Chasms:GetCompletedObjectives()
	local chasms = self:GetChasmCount()
	local reward = self:GetReward(chasms)
	if chasms >= self.GoalChasms then
		return self.Objectives
	else
		return Objective(objText,tostring(chasms),"",reward,2)
	end

end

function Mission_Nautilus_Chasms:GetReward(chasms)
	if chasms >= self.GoalChasms then
		return 2
	elseif chasms < 4 then
		return 0
	else
		return 1
	end
end

function Mission_Nautilus_Chasms:UpdateObjectives()
	local status = OBJ_STANDARD
	local crackcount = self:GetChasmCount()
	if crackcount >= 8 then status = OBJ_COMPLETE end
	Game:AddObjective(objText.." ("..tostring(crackcount).."/8)", tostring(crackcount), "", status, REWARD_REP, 2)
end