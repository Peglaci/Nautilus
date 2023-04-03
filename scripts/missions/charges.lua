-- mission Mission_Nautilus_Charges
--Mission By: NamesAreHard: NAH
--Could be a low threat mission, or made a little bit harder.

--Charges can spawn next to each other, okay?
-- \n?

local mod = mod_loader.mods[modApi.currentMod]

Mission_Nautilus_Charges = Mission_Infinite:new{
  Name = "Blast Charges",
  Objectives = Objective("Destroy All the Blast Charges",2),
  Count = 3, --Does nothing
  Ids = nil,
}

function Mission_Nautilus_Charges:IsPointValid(space)
  local tile = Board:GetTerrain(space)
	return Board:IsValid(space) and
			not Board:IsPod(space) and
			not Board:IsBuilding(space) and
      not Board:GetPawn(space) and
			tile ~= TERRAIN_WATER and
      tile ~= TERRAIN_MOUNTAIN
end


function Mission_Nautilus_Charges:StartMission()
  self.Ids = {}
  --ZONE THINGS
  local zone1 = extract_table(general_DiamondTarget(Point(5,1),2))
  local zone2 = extract_table(general_DiamondTarget(Point(5,6),2))
  local zone3 = add_tables(extract_table(general_DiamondTarget(Point(6,3),1)),extract_table(general_DiamondTarget(Point(6,4),1)))
  local zones = {zone1,zone2,zone3}
  local backup = extract_table(general_DiamondTarget(Point(4,4),7))


  for _, zone in ipairs(zones) do
    local choice = random_removal(zone)
    while not self:IsPointValid(choice) do
      if #zone ~= 0 then
        choice = random_removal(zone)
      else
        LOG("AAAAAAAAAAAAAAAAA @NamesAreHard#2501 please and thank you. Nautilus.")
        choice = random_removal(backup)
      end
    end

    Board:AddPawn("NAH_Blast_Charge",choice)
    local pawn = Board:GetPawn(choice)
    self.Ids[#self.Ids+1] = pawn:GetId()
    pawn:SetPowered(false)
    --Add mountain
  end
end

function Mission_Nautilus_Charges:NextTurn()
  if Game:GetTeamTurn() == TEAM_ENEMY then
    for _, id in ipairs(self.Ids) do
      local pawn = Board:GetPawn(id)
      if pawn and not pawn:IsPowered() then
        local space = pawn:GetSpace()
        for i=DIR_START,DIR_END do
          local curr = space + DIR_VECTORS[i]
          local newpawn = Board:GetPawn(curr)
          if newpawn and newpawn:GetTeam() == TEAM_PLAYER then
            pawn:SetPowered(true)
            Board:Ping(space,GL_Color(255,255,255))
            Board:Ping(curr,GL_Color(0,0,0))
            Game:TriggerSound("/ui/battle/buff_armor")
            break
          end
        end
      end
    end
  end
end

function Mission_Nautilus_Charges:UpdateMission()
  for _, id in ipairs(self.Ids) do
    local pawn = Board:GetPawn(id)
    if pawn then
      local space = pawn:GetSpace()
      if pawn:IsPowered() then
        Board:MarkSpaceDesc(space,"NAH_Blast_Charge_Powered")
      else
        Board:MarkSpaceDesc(space,"NAH_Blast_Charge_Unpowered")
      end
    end
  end
end

function Mission_Nautilus_Charges:BlastChargesLeft()
  local count = 0
  for _, id in ipairs(self.Ids) do
    if Board:IsPawnAlive(id) then
      count = count + 1
    end
  end
  return count
end

function Mission_Nautilus_Charges:GetCompletedObjectives()
  local left = self:BlastChargesLeft()
  if left > self.Count-2 then --Make a half way done.
    return Objective(string.format("Destroy All the Blast Charges - %s/%s destroyed",tostring(self.Count-left),tostring(self.Count)),0,2)
  elseif left ~= 0 then
    return Objective(string.format("Destroy All the Blast Charges - %s/%s destroyed",tostring(self.Count-left),tostring(self.Count)),1,2)
  else
    return self.Objectives
  end
end

function Mission_Nautilus_Charges:UpdateObjectives()
  local status = self:BlastChargesLeft() and OBJ_STANDARD or OBJ_COMPLETE
  Game:AddObjective("Explode All the Blast Charges", status, REWARD_REP, 2)
end

NAH_Blast_Charge = Pawn:new{ --Maybe needs a description
  Name = "Blast Charge",
  Image = "missile",
  Health = 2,
  IgnoreSmoke = true,
	MoveSpeed = 0,
  Neutral = true,
  MoveSpeed = 0,
  Pushable = false,
	SpaceColor = true,
	IsPortrait = false,
  DefaultTeam = TEAM_NONE,
  ImpactMaterial = IMPACT_METAL,
  SkillList = { "NAH_Blast_Charge_Skill" },
}
AddPawn("NAH_Blast_Charge")

NAH_Blast_Charge_Skill = SelfTarget:new{
  Name = "Blast Charge",
  Description = "Self destruct, destroying all adjacnt units. Building immune.",
  Explosion = "",
  TipImage = {
    Unit = Point(2,2),
    Enemy = Point(2,1),
    Target = Point(2,2),
    Friendly = Point(3,2),
    Building = Point(2,3),
    CustomPawn = "NAH_Blast_Charge"
  }
}

function NAH_Blast_Charge_Skill:GetSkillEffect(p1, p2)
  local ret = SkillEffect()

  local damage = SpaceDamage(p1, DAMAGE_DEATH)
  damage.sAnimation = "explo_fire1"
  ret:AddQueuedDamage(damage)

  for dir = DIR_START, DIR_END do
    local space = p1 + DIR_VECTORS[dir]
    if not Board:IsBuilding(space) then
  		local damage = SpaceDamage(space, DAMAGE_DEATH)
  		damage.sAnimation = "exploout2_"..dir
  		ret:AddQueuedDamage(damage)
    end
	end

  local crack = SpaceDamage(p1)
  crack.bHide = true
  crack.iCrack = EFFECT_CREATE
  ret:AddQueuedDamage(crack)

  return ret
end
