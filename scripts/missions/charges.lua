-- mission Mission_Nautilus_Charges
--Mission By: NamesAreHard: NAH
--Could be a low threat mission, or made a little bit harder.

-- \n?


local mod = mod_loader.mods[modApi.currentMod]

--assets
modApi:appendAsset("img/units/mission/blastingcharge_on.png",mod.resourcePath.."img/units/mission/blastingcharge_on.png")
modApi:appendAsset("img/units/mission/blastingcharge_off.png",mod.resourcePath.."img/units/mission/blastingcharge_off.png")
modApi:appendAsset("img/units/mission/blastingcharge_warning.png",mod.resourcePath.."img/units/mission/blastingcharge_warning.png")

local a = ANIMS
a.BlastingCharge_Off = a.BaseUnit:new{Image = "units/mission/blastingcharge_off.png", PosX = -22, PosY = -2}
a.BlastingCharge_Offa = a.BlastingCharge_Off:new{Image = "units/mission/blastingcharge_on.png", NumFrames = 4} --Should never be seen
a.BlastingCharge_Offd = a.BlastingCharge_Off:new{Image = "effects/explo_fire1.png",Loop=false, NumFrames = 10, Time = 0.075, PosX = -27, PosY = -18}

a.BlastingCharge_On = a.BlastingCharge_Offa:new{Image = "units/mission/blastingcharge_warning.png", Time = .6} --Weirdness cause hacks
a.BlastingCharge_Ona = a.BlastingCharge_Offa:new{Image = "units/mission/blastingcharge_on.png", Time = .2}
a.BlastingCharge_Ond = a.BlastingCharge_Off:new{Image = "effects/explo_fire1.png",Loop=false, NumFrames = 10, Time = 0.075, PosX = -27, PosY = -18}

Mission_Nautilus_Charges = Mission_Infinite:new{
  Name = "Blast Charges",
  Objectives = Objective("Destroy All the Blast Charges",2),
  UseBonus = false,
  -- BonusPool = {BONUS_GRID, BONUS_MECHS, BONUS_BLOCK, BONUS_KILL_FIVE, BONUS_PACIFIST, BONUS_SELFDAMAGE},
  --Took out BONUS_DEBRIS (Vek Eggs) because there's already so many things on the board
  Count = 3, --Does nothing
  Ids = nil,
}

function Mission_Nautilus_Charges:IsPointValid(space)
  --Don't spawn next to another blast charge
  for i=DIR_START,DIR_END do
    local curr = space + DIR_VECTORS[i]
    local pawn = Board:GetPawn(curr)
    if pawn and list_contains(self.Ids, pawn:GetId())  then
      return false
    end
  end

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
  local zone1 = extract_table(general_DiamondTarget(Point(5,2),2))
  local zone2 = extract_table(general_DiamondTarget(Point(5,5),2))
  local zone3 = add_tables(zone1,zone2)
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
            modApi:runLater(function()
              Board:Ping(curr,GL_Color(255,162,0)) --Switches anim on same frame, kills ping
              Board:Ping(space,GL_Color(255,45,0))
              Game:TriggerSound("/ui/battle/buff_armor")
            end)
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
    if pawn then--and not modApi:IsTipImage() then
      local space = pawn:GetSpace()
      if pawn:IsPowered() then
        Board:MarkSpaceDesc(space,"NAH_Blast_Charge_Powered")
        if pawn:GetCustomAnim() ~= "BlastingCharge_On" then
          pawn:SetCustomAnim("BlastingCharge_On")
        end
      else
        Board:MarkSpaceDesc(space,"NAH_Blast_Charge_Unpowered")
        local on = false
        for i=DIR_START,DIR_END do
          local curr = space + DIR_VECTORS[i]
          local newpawn = Board:GetPawn(curr)
          if newpawn and newpawn:GetTeam() == TEAM_PLAYER then
            if not on and pawn:GetCustomAnim() ~= "BlastingCharge_On" then
              pawn:SetCustomAnim("BlastingCharge_On")
            end
            on = true
          end
        end
        if not on and pawn:GetCustomAnim() ~= "BlastingCharge_Off" then
          pawn:SetCustomAnim("BlastingCharge_Off")
        end
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
  local status = self:BlastChargesLeft() ~= 0 and OBJ_STANDARD or OBJ_COMPLETE --Not sure why I need ~= 0
  Game:AddObjective("Explode All the Blast Charges", status, REWARD_REP, 2)
end

NAH_Blast_Charge = Pawn:new{ --Maybe needs a description
  Name = "Blast Charge",
  Image = "BlastingCharge_Off",
  Health = 2,
  IgnoreSmoke = true,
	MoveSpeed = 0,
  Neutral = true,
  MoveSpeed = 0,
  Pushable = false,
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
  --damage.sAnimation = "explo_fire1" --In death animation
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
  
  if chance > 0.5 then
	  ret:AddVoice('Mission_Nautilus_BlastChargeExploded', -1)
  end
  
  return ret
end

local function customRunLater(delay, fn) --I hate everything again
	if delay == 0 then
		fn()
	else
		modApi:runLater(function()
			customRunLater(delay-1,fn)
		end)
	end
end

--SetCustomAnim is stupid
local function UpdateCharges(mission)
	customRunLater(5,function()
		local mission = GetCurrentMission()
		if mission.Name == "Blast Charges" then
      for _, id in ipairs(mission.Ids) do
        if Board:IsPawnAlive(id) then
          local pawn = Board:GetPawn(id)
          if pawn:GetCustomAnim() == "BlastingCharge_On" then
            pawn:SetCustomAnim("BlastingCharge_On") --Reset the custom anim
          end
        end
      end
		end
	end)
end

modApi.events.onContinueClicked:subscribe(UpdateCharges)
