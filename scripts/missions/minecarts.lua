local mod = mod_loader.mods[modApi.currentMod]
local path = mod.resourcePath
local customAnim = mod.libs.customAnim

-- add sprites anims and maps
for i = 0, 19 do
	modApi:addMap(path .."maps/minecart".. i ..".map")
end

--carts
modApi:appendAsset("img/effects/minecart_R.png",path.."img/effects/minecart_R.png")
modApi:appendAsset("img/effects/minecart_U.png",path.."img/effects/minecart_U.png")

--tunnels
modApi:appendAsset("img/units/mission/tunnel_l.png",path.."img/units/mission/tunnel_l.png")
modApi:appendAsset("img/units/mission/tunnel_l_broken.png",path.."img/units/mission/tunnel_l_broken.png")
modApi:appendAsset("img/units/mission/tunnel_l_top.png",path.."img/units/mission/tunnel_l_top.png")
modApi:appendAsset("img/units/mission/tunnel_r.png",path.."img/units/mission/tunnel_r.png")
modApi:appendAsset("img/units/mission/tunnel_r_broken.png",path.."img/units/mission/tunnel_r_broken.png")
modApi:appendAsset("img/units/mission/tunnel_r_top.png",path.."img/units/mission/tunnel_r_top.png")

local a = ANIMS
a.nautilus_tunnel_l = a.BaseUnit:new{ Image = "units/mission/tunnel_l.png", PosX = -28, PosY = -11 }
a.nautilus_tunnel_l_broken = a.BaseUnit:new{ Image = "units/mission/tunnel_l_broken.png", PosX = -28, PosY = -11 }
a.nautilus_tunnel_top_l = a.BaseUnit:new{ Image = "units/mission/tunnel_l_top.png", PosX = -28, PosY = -11, Time = 3.0, Loop = false, Layer = LAYER_FRONT }

a.nautilus_tunnel_r = a.BaseUnit:new{ Image = "units/mission/tunnel_r.png", PosX = -28, PosY = -12 }
a.nautilus_tunnel_r_broken = a.BaseUnit:new{ Image = "units/mission/tunnel_r_broken.png", PosX = -28, PosY = -12 }
a.nautilus_tunnel_top_r = a.BaseUnit:new{ Image = "units/mission/tunnel_r_top.png", PosX = -28, PosY = -12, Time = 3.0, Loop = false, Layer = LAYER_FRONT }
-- , Layer = LAYER_FRONT

-- mission
Mission_Nautilus_Minecarts = Mission_Infinite:new{ 
	Name = "Minecart Railway",
	Objectives = Objective("Have 2 Minecarts pass without crashing",2),
	MapTags = {"minecart"},
	TurnLimit = 4,
	MinecartRandom = 0,
	UseBonus = false,
	FreeCarts = 0,
}

function Mission_Nautilus_Minecarts:StartMission()
	local zone = extract_table(Board:GetZone("Tunnels"))
	local tunnels = {"Nautilus_Tunnel_Pawn1_","Nautilus_Tunnel_Pawn2_"}
	for _, p in ipairs(zone) do
		local spriteDir = (p.x == 0) and 'r' or 'l'
		local pawn = PAWN_FACTORY:CreatePawn(random_removal(tunnels)..spriteDir)
		-- customAnim:add(p,'nautilus_tunnel_top_'..spriteDir)
		Board:AddPawn(pawn, p)
	end
	-- get random tunnel to shoot a minecart
	local choices = {1,2}
	self.MinecartRandom = random_removal(choices)
end

function Mission_Nautilus_Minecarts:UpdateObjectives()
	local status = self.FreeCarts >= 2 and OBJ_COMPLETE or OBJ_STANDARD
	Game:AddObjective(string.format("Have 2 Minecarts pass without crashing (%s/2 Minecarts)",tostring(self.FreeCarts)),status, REWARD_REP, 2)
end

function Mission_Nautilus_Minecarts:GetCompletedObjectives()
	if self.FreeCarts == 1 then
		return Objective("Have 2 Minecarts pass without crashing (1/2 Minecarts)", 1, 2)
	elseif self.FreeCarts >= 2 then
		return Objective("Have 2 Minecarts pass without crashing (2/2 Minecarts)", 2, 2)
	end
	
	return Objective("Have 2 Minecarts pass without crashing (0/2 Minecarts)", 0, 2)
end

------- UNITS AND SKILLS FOR THE MISSION -------------------
Nautilus_Tunnel_Pawn1_l = 
{
	Name = "Tunnel",
	Health = 1,
	Neutral = true,
	Image = "nautilus_tunnel_l",
	MoveSpeed = 0,
	SkillList = { "Nautilus_Tunnel_Spawn1" },
	-- DefaultTeam = TEAM_PLAYER,
	IgnoreSmoke = true,
	IgnoreFlip = true,
	IgnoreFire = true,
	SoundLocation = "/support/train",
	Pushable = false,
	-- Corporate = true,
	Corpse = true,
	SpaceColor = false,
	IsPortrait = false
}
AddPawn("Nautilus_Tunnel_Pawn1_l") 

Nautilus_Tunnel_Pawn1_r = 
{
	Name = "Tunnel",
	Health = 1,
	Neutral = true,
	Image = "nautilus_tunnel_r",
	MoveSpeed = 0,
	SkillList = { "Nautilus_Tunnel_Spawn1" },
	-- DefaultTeam = TEAM_PLAYER,
	IgnoreSmoke = true,
	IgnoreFlip = true,
	IgnoreFire = true,
	SoundLocation = "/support/train",
	Pushable = false,
	-- Corporate = true,
	Corpse = true,
	SpaceColor = false,
	IsPortrait = false
}
AddPawn("Nautilus_Tunnel_Pawn1_r") 

Nautilus_Tunnel_Pawn2_l = 
{
	Name = "Tunnel",
	Health = 1,
	Neutral = true,
	Image = "nautilus_tunnel_l",
	MoveSpeed = 0,
	SkillList = { "Nautilus_Tunnel_Spawn2" },
	-- DefaultTeam = TEAM_PLAYER,
	IgnoreSmoke = true,
	IgnoreFlip = true,
	IgnoreFire = true,
	-- Armor = true,
	-- ExtraSpaces = { Point(0,1) },
	SoundLocation = "/support/train",
	Pushable = false,
	-- Corporate = true,
	Corpse = true,
	SpaceColor = false,
	IsPortrait = false
}
AddPawn("Nautilus_Tunnel_Pawn2_l") 

Nautilus_Tunnel_Pawn2_r = 
{
	Name = "Tunnel",
	Health = 1,
	Neutral = true,
	Image = "nautilus_tunnel_r",
	MoveSpeed = 0,
	SkillList = { "Nautilus_Tunnel_Spawn2" },
	-- DefaultTeam = TEAM_PLAYER,
	IgnoreSmoke = true,
	IgnoreFlip = true,
	IgnoreFire = true,
	-- Armor = true,
	-- ExtraSpaces = { Point(0,1) },
	SoundLocation = "/support/train",
	Pushable = false,
	-- Corporate = true,
	Corpse = true,
	SpaceColor = false,
	IsPortrait = false
}
AddPawn("Nautilus_Tunnel_Pawn2_r")

------------------------------------------

Nautilus_Tunnel_Spawn1 = Skill:new{
	Name = "Minecart Railway",
	Description = "Minecarts are moving at high speed, destroying the first thing they hit.",
	Class = "Enemy",
	AttackAnimation = "ExploArt2",
	LaunchSound = "/support/train/move",
	CrashSound = "/impact/dynamic/rock",
	TunnelN = 1,
	Dir = DIR_DOWN,
	CartArt = "effects/minecart",--"effects/shot_fist",
	CustomTipImage = "Nautilus_Tunnel_Spawn1_Tip",
	TipImage = {
		Unit = Point(2,0),
		Enemy = Point(2,3),
		Target = Point(2,1),
		CustomPawn = "Nautilus_Tunnel_Pawn1_l"
	},
}

Nautilus_Tunnel_Spawn2 = Nautilus_Tunnel_Spawn1:new{
	TunnelN = 2,
	Dir = DIR_UP,
	CustomTipImage = "Nautilus_Tunnel_Spawn2_Tip",
	TipImage = {
		Unit = Point(2,0),
		Enemy = Point(2,2),
		Target = Point(2,1),
		CustomPawn = "Nautilus_Tunnel_Pawn2_l"
	},
}

function Nautilus_Tunnel_Spawn1:GetTargetArea(point)
	local ret = PointList()
	local vec = VEC_DOWN
	if point.x == 0 then vec = VEC_RIGHT end
	ret:push_back(point + vec)
	return ret
end

SkillEffect["Nautilus_AddQueuedProjectile"] = function(self, ...) -- add our own queued projectile
	local fx = SkillEffect()
	fx["AddProjectile"](fx, ...)
	self.q_effect:AppendAll(fx.effect)
end

function Nautilus_Tunnel_Spawn1:GetSkillEffect(p1, p2)
	local ret = SkillEffect()
	local dir = self.Dir
	
	if p1.x == 0 then
		if dir == DIR_DOWN then dir = DIR_RIGHT end
		if dir == DIR_UP then dir = DIR_LEFT end
	end
	
	local mission = GetCurrentMission()
	
	local rand = 0
	if mission and mission.MinecartRandom then
		rand = mission.MinecartRandom
	end
	
	if rand == self.TunnelN then
		local pEnd = p2
		local blocked = false
		if dir == DIR_DOWN or dir == DIR_RIGHT then
			local pStart = p1+DIR_VECTORS[dir]
			pEnd = GetProjectileEnd(p1,p2,PATH_GROUND)
			if Board:IsBlocked(pEnd,PATH_GROUND) then blocked = true end
			
			local q_move = PointList()
			local curr = p1 - DIR_VECTORS[dir]*2
			while curr ~= pEnd do
				curr = curr + DIR_VECTORS[dir]
				q_move:push_back(curr)
			end
			if pStart ~= pEnd then
				ret:AddQueuedMove(q_move, NO_DELAY)
				p1 = pStart
			end
			
			if not Board:IsBlocked(pEnd,PATH_GROUND) then
				pEnd = pEnd + DIR_VECTORS[dir]
			end
			
		else
			local pLast = p1
			p1 = p1-DIR_VECTORS[dir]*7
			pEnd = GetProjectileEnd(p1-DIR_VECTORS[dir],p2,PATH_GROUND)
			if pEnd ~= pLast and Board:IsBlocked(pEnd,PATH_GROUND) then blocked = true end
			
			local q_move = PointList()
			local curr = p1 - DIR_VECTORS[dir]
			while curr ~= pEnd do
				q_move:push_back(curr)
				curr = curr + DIR_VECTORS[dir]
			end
			if pEnd ~= pLast then
				q_move:push_back(curr)
			end
			if p1 ~= pEnd then
				ret:AddQueuedMove(q_move, NO_DELAY)
			end
			
			if pEnd == pLast then
				pEnd = pEnd+DIR_VECTORS[dir]
			end
		end
		
		local cart = SpaceDamage(pEnd)
		if Board:IsValid(pEnd) and Board:IsBlocked(pEnd, PATH_PROJECTILE) then
			cart.iDamage = DAMAGE_DEATH
			cart.sAnimation = self.AttackAnimation
			cart.sSound = self.CrashSound
			ret:Nautilus_AddQueuedProjectile(p1, cart, self.CartArt, FULL_DELAY)
		else
			if dir == DIR_UP or dir == DIR_LEFT then cart.loc = pEnd-DIR_VECTORS[dir] end
			ret:Nautilus_AddQueuedProjectile(p1, cart, self.CartArt, FULL_DELAY)
			ret.q_effect:back().bHide = true
		end
		ret.q_effect:back().bHidePath = true
		
		if mission and mission.FreeCarts and not blocked then
			ret:AddQueuedScript('GetCurrentMission().FreeCarts = GetCurrentMission().FreeCarts + 1')
		end
	end
	
	return ret
end

function Nautilus_Tunnel_Spawn1:GetTargetScore(p1, p2)
	return 100
end


-- custom tip
Nautilus_Tunnel_Spawn1_Tip = Nautilus_Tunnel_Spawn1:new{}
Nautilus_Tunnel_Spawn2_Tip = Nautilus_Tunnel_Spawn2:new{}

function Nautilus_Tunnel_Spawn1_Tip:GetSkillEffect(p1,p2) -- for passive preview
	local ret = SkillEffect()
	
	local pStart = Point(0,0)
	local pEnd = Point(2,2)
	local q_move = PointList()
	if self.Dir == DIR_DOWN or self.Dir == DIR_LEFT then
		pStart = Point(2,1)
		pEnd = Point(2,3)
		q_move:push_back(Point(2,-1))
		q_move:push_back(Point(2,0))
		q_move:push_back(Point(2,1))
		q_move:push_back(Point(2,2))
		q_move:push_back(Point(2,3))
	else
		pStart = Point(2,6)
		q_move:push_back(Point(2,5))
		q_move:push_back(Point(2,4))
		q_move:push_back(Point(2,3))
		q_move:push_back(Point(2,2))
	end
	
	for y = 0,6 do
		Board:SetCustomTile(Point(2,y),'ground_rail.png')
	end
	
	ret:AddQueuedMove(q_move, NO_DELAY)
	
	local dam = SpaceDamage(pEnd,DAMAGE_DEATH)
	ret:Nautilus_AddQueuedProjectile(pStart,dam,self.CartArt, FULL_DELAY)
	ret.q_effect:back().bHidePath = true
	
	ret:AddDelay(1)
	
	return ret
end

Nautilus_Tunnel_Spawn2_Tip.GetSkillEffect = Nautilus_Tunnel_Spawn1_Tip.GetSkillEffect

----------- Hooks -----------
local HOOK_nextTurn = function(mission)
	if mission and mission.MinecartRandom and Game:GetTeamTurn() == TEAM_ENEMY then
		local choices = {1,2}
		mission.MinecartRandom = random_removal(choices)
	end
end

local function EVENT_onModsLoaded()
	modApi:addNextTurnHook(HOOK_nextTurn)
end

modApi.events.onModsLoaded:subscribe(EVENT_onModsLoaded)