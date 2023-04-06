-- mission Mission_Nautilus_Digging
--Mission By: NamesAreHard: NAH

local mod = mod_loader.mods[modApi.currentMod]
--assets (go to line 62)
local writepath = "img/units/mission/"
local readpath = mod.resourcePath .. writepath
local imagepath = writepath:sub(5,-1)
local a = ANIMS

--Might need space around borders??

local name = "wall_L"
modApi:appendAsset(writepath..name..".png", readpath..name..".png")
modApi:appendAsset(writepath..name.."a.png", readpath..name.."a.png")
modApi:appendAsset(writepath..name.."_emerge.png", readpath..name.."_emerge.png")
--modApi:appendAsset(writepath.."DNT_"..name.."_death.png", readpath.."DNT_"..name.."_death.png")
--modApi:appendAsset(writepath.."DNT_"..name.."_Bw.png", readpath.."DNT_"..name.."_Bw.png")

local base = a.BaseUnit:new{Image = imagepath .. name..".png", PosX = -29, PosY = -7}
local baseEmerge = a.BaseEmerge:new{Image = imagepath ..name.."_emerge.png", PosX = -23, PosY = -6, NumFrames = 8}

a.securitywall_U = base
a.securitywall_U = baseEmerge
a.securitywall_U = base:new{ Image = imagepath..name.."a.png", NumFrames = 1 }
--a.securitywall_U = base:new{ Image = imagepath..name.."_death.png", NumFrames = 5, Lengths = {.15,.15,.15,.15,.8}, Loop = false }
--a.securitywall_U = base:new{ Image = imagepath..name.."_Bw.png", PosY = 0} --Only if there's a boss

local base = a.BaseUnit:new{Image = imagepath .. name..".png", PosX = -12, PosY = -23}
local baseEmerge = a.BaseEmerge:new{Image = imagepath ..name.."_emerge.png", PosX = -28, PosY = -5, NumFrames = 8}

a.securitywall_D = base
a.securitywall_D = baseEmerge
a.securitywall_D = base:new{ Image = imagepath..name.."a.png", NumFrames = 1 }

--COPY PASTE WOOO, this could have a bit more refrences to each other but still wouldn't help much

local name = "wall_R"
modApi:appendAsset(writepath..name..".png", readpath..name..".png")
modApi:appendAsset(writepath..name.."a.png", readpath..name.."a.png")
modApi:appendAsset(writepath..name.."_emerge.png", readpath..name.."_emerge.png")
--modApi:appendAsset(writepath.."DNT_"..name.."_death.png", readpath.."DNT_"..name.."_death.png")
--modApi:appendAsset(writepath.."DNT_"..name.."_Bw.png", readpath.."DNT_"..name.."_Bw.png")

local base = a.BaseUnit:new{Image = imagepath .. name..".png", PosX = -12, PosY = -7}
local baseEmerge = a.BaseEmerge:new{Image = imagepath ..name.."_emerge.png", PosX = -23, PosY = -6, NumFrames = 8}

a.securitywall_L = base
a.securitywall_L = baseEmerge
a.securitywall_L = base:new{ Image = imagepath..name.."a.png", NumFrames = 1 }
--a.securitywall_L = base:new{ Image = imagepath..name.."_death.png", NumFrames = 5, Lengths = {.15,.15,.15,.15,.8}, Loop = false }
--a.securitywall_L = base:new{ Image = imagepath..name.."_Bw.png", PosY = 0} --Only if there's a boss

local base = a.BaseUnit:new{Image = imagepath .. name..".png", PosX = -29, PosY = -23}
local baseEmerge = a.BaseEmerge:new{Image = imagepath ..name.."_emerge.png", PosX = -23, PosY = -5, NumFrames = 8}

a.securitywall_R = base
a.securitywall_R = baseEmerge
a.securitywall_R = base:new{ Image = imagepath..name.."a.png", NumFrames = 1 }


Mission_Nautilus_Walls = Mission_Infinite:new{
  Name = "Security Walls",
  Objectives = Objective("Trigger All the Pressure Plates",2),
  Plates = 4,
  Triggered = 0,
  BlockedUnits = {"Jelly_Explode", "Dung"},
}

local mine_damage = SpaceDamage(0)

NAH_Pressure_Plate = {
  Image = "combat/mine.png",
  Damage = mine_damage,
  Tooltip = "NAH_Pressure_Plate_Text",
  Icon = "combat/icons/icon_mine_glow.png", --TODO
  UsedImage = "", --??
}

function Mission_Nautilus_Walls:IsPointValid(space)
  local tile = Board:GetTerrain(space)
	return Board:IsValid(space) and
			not Board:IsPod(space) and
			not Board:IsBuilding(space) and
      not Board:GetPawn(space) and
			tile ~= TERRAIN_WATER and
      tile ~= TERRAIN_MOUNTAIN
end

function Mission_Nautilus_Walls:StartMission()
  local rand = random_int(2) --random checkerboard each time

  choices = {}
  for i=2,5 do
    for j=1,6 do
      local point = Point(i,j)
      if self:IsPointValid(point) and (i+j)%2==rand then --Checkboard pattern, no adjacencies
        choices[#choices+1] = point
      end
    end
  end

  for _=1,self.Plates do
    local choice = random_removal(choices)
    Board:BlockSpawn(choice,BLOCKED_PERM)
    Board:SetItem(choice,"NAH_Pressure_Plate") --This probably needs to be something more consistent
  end
end

--[[
function Mission_Nautilus_Walls:UpdateMission()
  if self.DigSite then
    Board:MarkSpaceDesc(self.DigSite,"NAH_Dig_Site")
  end
end
]]

function Mission_Nautilus_Walls:GetCompletedObjectives()
  if self.Triggered >= 4 then
    return self.Objectives
  elseif self.Triggered >= 2 then
    return Objective(string.format("Trigger All the Pressure Plates (%s/%s triggered)",self.Triggered,self.Plates),1,2) --\n missing
  else
    return self.Objectives:Failed()
  end
end

--LOOK AT HALF COMPLETION
function Mission_Nautilus_Walls:UpdateObjectives()
  local status = OBJ_STANDARD
  Game:AddObjective("Trigger All the Pressure Plates", status, REWARD_REP, 2)
end


BoardEvents.onItemRemoved:subscribe(function(loc, removed_item)
  if removed_item == "NAH_Pressure_Plate"  then
    local mission = GetCurrentMission()
    mission.Triggered = mission.Triggered + 1
    local effect = SkillEffect()
    for i=DIR_START,DIR_END do
      local curr = loc + DIR_VECTORS[i]
      local dir = GetDirection(curr-loc)
      local pawn = Board:GetPawn(curr)

      local terrain = Board:GetTerrain(curr)
      if terrain ~= TERRAIN_WATER and terrain ~= TERRAIN_HOLE and not (pawn and pawn:IsGuarding()) then

        if pawn then --YEET
          local choices = extract_table(general_DiamondTarget(curr,2))
          local move = PointList()
          move:push_back(curr)
          local choice = random_removal(choices)
          while Board:IsBlocked(choice,PATH_MASSIVE) or Board:GetItem(choice) ~= "" or loc:Manhattan(choice) <= 1 do
            choice = random_removal(choices)
          end
          move:push_back(choice)
          effect:AddLeap(move,NO_DELAY)
        end

        local damage = SpaceDamage(curr)
        damage.sPawn = "Security_Wall_"..dir
        effect:AddDamage(damage)
      end
    end
    Board:AddEffect(effect)
  end
end)

Security_Wall_0 = Pawn:new{
  --Doesn't Change
  Name = "Secuirty Wall",
  Health = 1,
  MoveSpeed = 0,
  Pushable = false,
  DefaultTeam = TEAM_NONE,
  SpaceColor = false,
  IsPortrait = false,
  --SoundLocation
  --Changes
  Image = "securitywall_U",
}

Security_Wall_1 = Security_Wall_0:new{
  Image = "securitywall_R",
}

Security_Wall_2 = Security_Wall_0:new{
  Image = "securitywall_D",
}

Security_Wall_3 = Security_Wall_0:new{
  Image = "securitywall_L",
}
