-- mission Mission_Nautilus_Incinerator
--Mission By: NamesAreHard: NAH
--Note: These could be wrong, or I could be missing something. This is just the best I could find
--[[
Environment Mission Template and Example

There's a lot of shortcuts for environment stuff that you can find in scripts/enviornment.lua
but for the most part, doing it custom yourself is probably the best way to go.

Enviornment:new {
  Name = The name given in the top right corner when hovering the icon
  Text = The description text given in the top right corner when hovering the icon
  CombatName = The text that shows up in the top right corner, not when hovering
	CombatIcon = The icon that shows up in the top right corner
  StratText= The text that shows up on the mission select screen, along with the CombatIcon
  Image = ???
}
In case this wasn't enough, you STILL need more text.
Global_Texts = {
  TipTitle_Name = The name of the tooltip text on the selection screen when hovering,
  TipText_Name = The description of the tooltip text on the selection screen when hovering,
}
Don't forget the commas

Functions:
Enviornment:Start()
Runs at the start of the mission, before clicking on it
This is where you can initialize variables or put down anything that happens once
In my example, I decide where the incinerator is going to be, and block spawns there.

Enviornment:Plan()
Runs when enviornment is decided.
Not used in this example, since it stays the same every turn
return false if you're done or true to run it again
This function is more useful for basing it off of Env_Attack
Check scripts/enviornment.lua for more

Enviornment:IsEffect()
Runs during the enviornment phase to determine if an effect should be done
This function is more of a backup then anything, in case somehow no enviornment is created
return true to run ApplyEffect(), return false to not run ApplyEffect()

Enviornment:ApplyEffect()
Runs during the enviornment phase
Create an effect and then activiate it using Board:AddEffect()
return false if it's done, return true and it will run the function again

Enviornment:MarkSpace()
Runs every frame to mark spaces with the correct icons, descriptions, and more

Enviornment:IsValidTarget(space)
returns whether a space is a valid to put enviornment on
Has a default, but can be turned into any condition
Defualt:
local tile = Board:GetTerrain(space)
return Board:IsValid(space) and
not Board:IsPod(space) and
not Board:IsBuilding(space) and
(tile ~= TERRAIN_WATER or self.WaterTarget)
]]

--[[
Objectives:
In the mission definition, you give it the Objectives() Class
Here's what I found about it.
Objectives(string, int) The initial creation should use this
string: Name of the objective. This is what will show up when winning and on the select screen, but not in game
int: The amount of rep to give. There is no limit, but uh, use caution.
Objectives(string, int, int) The return in GetCompletedObjectives can return this to partially complete it
string: Name of the objective. This is what will show up when winning and on the select screen, but not in game
int: How many to reward
int: How much rep to give. There is no limit, but uh, use caution.
There are other types you can use, but I haven't looked into them

This is different from in game. Each mission should have two functions for in game

Mission:GetCompletedObjectives()
This is run at the end of the mission to check if you passed the objective
if you passed, return self.Objectives
if you failed, return self.Objectives:Failed()
if you partially won, return a new objecive with the same name, but with the second int, as stated above

Mission:UpdateObjectives()
This runs during the mission to update the sidebar.
Use Game:AddObjective(string, int, int, int, optional int)
string: The string to display. You can use string.format to have it edit itself during the mission, see example
int: The status, either OBJ_COMPLETE, OBJ_FAILED, or OBJ_STANDARD for neither state
int: The type of reward, REWARD_REP or REWARD_POWER
int: How many of the reward. This should match the previous.
int: How many of those stars are currently failed

What I haven't looked into:
Multiple Objectives in a mission
]]

-- mission Mission_Nautilus_Incinerator

--Assets:
local mod = mod_loader.mods[modApi.currentMod]

modApi:appendAsset("img/units/mission/incinerator.png",mod.resourcePath.."img/units/mission/incinerator.png")

ANIMS.Incinerator = Animation:new {
	Image = "units/mission/incinerator.png",
	NumFrames = 6,
	Time = 0.2,
	PosX = -29,
	PosY = 0,
  Loop = true,
  Layer = ANIMS.LAYER_BACK,
}

Mission_Nautilus_Incinerator = Mission_Auto:new{
  Name = "Incinerator",
  Environment = "Env_Incinerator",
  Objectives = Objective("Incinerate 2 Vek",1),
  Incinerated = 0,
}

Env_Incinerator = Environment:new{
  Name = "Incinerator",
  Text = "The incinerator shreds any units standing on its tile.",
  CombatName = "INCINERATOR",
	CombatIcon = "combat/tile_icon/tile_conveyor.png", --CHANGE
  StratText = "INCINERATOR",
	Incinerator = nil,
}

Global_Texts = {
  TipTitle_Env_Incinerator = "Incinerator",
  TipText_Env_Incinerator = "The incinerator will shred units on it",
}

TILE_TOOLTIPS = { --why is this not working now
  Nautilus_Incinerator = {"Incinerator","The incinerator will shred any unit standing here."}
}

function Env_Incinerator:MarkBoard()
  local point = self.Incinerator
  --Board:SetCustomTile(point,"conveyor"..self.BeltsDir[i]..".png")
  Board:MarkSpaceDesc(point,"Nautilus_Incinerator",EFFECT_DEADLY) --Text in TILE_TOOLTIPS
  --Board:SetTerrainIcon(point,"arrow_"..self.BeltsDir[i])
end

function Env_Incinerator:Start()
  local choices = {}

  --Find all possible places
  for i=3,5 do --Temporary, look at how other things add things to random places
    for j=2,5 do
      local point = Point(i,j)
      if self:IsValidTarget(point) then
        choices[#choices+1] = Point(i,j)
      end
    end
  end
  --Choose one randomly
  if #choices ~= 0 then
		local choice = random_removal(choices)
    self.Incinerator = choice
    Board:AddAnimation(choice,"Incinerator",ANIM_NO_DELAY) --This animation loops forever
    Board:BlockSpawn(choice,BLOCKED_PERM)
	else
    LOG("AAAAAAA") --There should always be a valid spot
  end

  self:MarkBoard()
end

function Environment:IsEffect()
  return self.Incinerator ~= nil --If there's an incinerator run the effect
end

function Env_Incinerator:ApplyEffect()
  local effect = SkillEffect()
  local damage = SpaceDamage(self.Incinerator,DAMAGE_DEATH)
  damage.sScript = string.format([[
    local pawn = Board:GetPawn(%s)
    local mission = GetCurrentMission()
    if pawn and pawn:GetTeam() == TEAM_ENEMY then
      mission.Incinerated = mission.Incinerated + 1
    end
  ]], damage.loc:GetString())
  effect:AddDamage(damage)
  effect:AddBounce(damage.loc,3)
  Board:AddEffect(effect)

  return false
end

function Mission_Nautilus_Incinerator:GetCompletedObjectives()
  if self.Incinerated >= 2 then
    return self.Objectives
  else
    return self.Objectives:Failed()
  end
end

function Mission_Nautilus_Incinerator:UpdateObjectives()
	local status = self.Incinerated >= 2 and OBJ_COMPLETE or OBJ_STANDARD
	Game:AddObjective(string.format("Incinerate 2 Vek\n(%s/2 incinerated)",tostring(self.Incinerated)),status, REWARD_REP, 1)
end
