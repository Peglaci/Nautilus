Mission_Nautilus_Crystals = Mission_Infinite:new{
  Name = "Crystals",
  Crystals = 4,
  Crystal1 = nil,
  Crystal2 = nil,
  CrystalsDestroyed = 0,
  Objectives = Objective("Destroy 4 Crystals", 2),
}

function Mission_Nautilus_Crystals:StartMission()
  local crystal = PAWN_FACTORY:CreatePawn("Crystal_Pawn")
  Board:AddPawn(crystal)
  self.Crystal1 = crystal:GetId()
  crystal = PAWN_FACTORY:CreatePawn("Crystal_Pawn")
  Board:AddPawn(crystal)
  self.Crystal2 = crystal:GetId()
end

function Mission_Nautilus_Crystals:UpdateObjectives()
  local status = self.Crystals <= self.CrystalsDestroyed and OBJ_COMPLETE or OBJ_STANDARD
  Game:AddObjective(string.format("Destroy %s Crystals\n%s/%s destroyed",self.Crystals,self.CrystalsDestroyed,self.Crystals), status, REWARD_REP, 2)
end

function Mission_Nautilus_Crystals:GetCompletedObjectives()
  if self.Crystals <= self.CrystalsDestroyed then
    return self.Objectives
  elseif self.CrystalsDestroyed >= 2 then
    return Objective(string.format("Destroy %s Crystals\n%s/%s destroyed",self.Crystals,self.CrystalsDestroyed,self.Crystals),1,2)
  else
    return self.Objectives:Failed()
  end
end

function Mission_Nautilus_Crystals:NextTurn()
    if Game:GetTeamTurn() == TEAM_PLAYER and Game:GetTurnCount() == 3 and Board:IsPawnAlive(self.Crystal) then
      --PrepareVoiceEvent("Mission_Cavern_Reminder")
    end
end

function Mission_Nautilus_Crystals:UpdateMission()
  if not Board:IsPawnAlive(self.Crystal1) or not Board:IsPawnAlive(self.Crystal2) then
    self.CrystalsDestroyed = self.CrystalsDestroyed + 1
    local crystal = PAWN_FACTORY:CreatePawn("Crystal_Pawn")
    Board:AddPawn(crystal)
    if not Board:IsPawnAlive(self.Crystal1) then
      self.Crystal1 = crystal:GetId()
    elseif not Board:IsPawnAlive(self.Crystal2) then
      self.Crystal2 = crystal:GetId()
    end
  end
end

Crystal_Pawn =
{
    Health = 1,
    Neutral = true,
    Image = "ShieldTank1",
    MoveSpeed = 0,
    DefaultTeam = TEAM_NONE,
    IsPortrait = false
}

AddPawn("Crystal_Pawn")
