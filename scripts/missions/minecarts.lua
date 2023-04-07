local mod = mod_loader.mods[modApi.currentMod]
local path = mod.resourcePath

for i = 0, 7 do
	modApi:addMap(path .."maps/minecart".. i ..".map")
end

Mission_Nautilus_Minecarts = Mission_Infinite:new{ 
	Name = "Minecart Railway",
	Objectives = Objective("Have 2 Minecarts pass without crashing",2),
	MapTags = {"minecart"},
	Tunnel1 = -1,
	Tunnel2 = -2,
	TunnelLoc1 = Point(3,0),
	TunnelLoc2 = Point(5,0),
	TurnLimit = 4,
	MinecartRandom = 0,
	UseBonus = false,
	FreeCarts = 0,
}

function Mission_Nautilus_Minecarts:StartMission()
	local tunnel = PAWN_FACTORY:CreatePawn("Nautilus_Tunnel_Pawn1")
	self.Tunnel1 = tunnel:GetId()
	Board:AddPawn(tunnel,self.TunnelLoc1)
	
	tunnel = PAWN_FACTORY:CreatePawn("Nautilus_Tunnel_Pawn2")
	self.Tunnel2 = tunnel:GetId()
	Board:AddPawn(tunnel,self.TunnelLoc2)
	
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
Nautilus_Tunnel_Pawn1 = 
{
	Name = "Tunnel",
	Health = 1,
	Neutral = true,
	Image = "terraformer1",
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
AddPawn("Nautilus_Tunnel_Pawn1") 

Nautilus_Tunnel_Pawn2 = 
{
	Name = "Tunnel",
	Health = 1,
	Neutral = true,
	Image = "terraformer2",
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

AddPawn("Nautilus_Tunnel_Pawn2") 

------------------------------------------

Nautilus_Tunnel_Spawn1 = Skill:new{
	Name = "Minecart Railway",
	Description = "Minecarts are moving at high speed, killing the first thing they hit.",
	Class = "Enemy",
	AttackAnimation = "ExploArt2",
	LaunchSound = "/support/train/move",
	TunnelN = 1,
	Dir = DIR_DOWN,
	CartArt = "effects/shot_fist",
	CustomTipImage = "Nautilus_Tunnel_Spawn1_Tip",
	TipImage = {
		Unit = Point(2,0),
		Enemy = Point(2,2),
		Target = Point(2,1),
		CustomPawn = "Nautilus_Tunnel_Pawn1"
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
		CustomPawn = "Nautilus_Tunnel_Pawn2"
	},
}

function Nautilus_Tunnel_Spawn1:GetTargetArea(point)
	local ret = PointList()
	ret:push_back(point + VEC_DOWN)
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
	local mission = GetCurrentMission()
	
	local rand = 0
	if mission and mission.MinecartRandom then
		rand = mission.MinecartRandom
	end
	
	if rand == self.TunnelN then
		local pEnd = p2
		local blocked = false
		if dir == DIR_DOWN or dir == DIR_LEFT then --self.TunnelN then
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
			end
			
			if not Board:IsBlocked(pEnd,PATH_GROUND) then
				pEnd = pEnd + DIR_VECTORS[dir]
			end
			
			local cart = SpaceDamage(pEnd)
			-- cart.sImageMark = "combat/icons/icon_arrow_2_glow.png"
			if Board:IsValid(pEnd) and Board:IsBlocked(pEnd, PATH_PROJECTILE) then
				cart.iDamage = DAMAGE_DEATH
				ret:AddQueuedProjectile(cart, self.CartArt, FULL_DELAY)
			else
				ret:AddQueuedProjectile(cart, self.CartArt, FULL_DELAY)
			end
			ret.q_effect:back().bHidePath = true
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
			
			local cart = SpaceDamage(pEnd)
			-- cart.sImageMark = "combat/icons/icon_arrow_0_glow.png"
			if Board:IsValid(pEnd) and Board:IsBlocked(pEnd, PATH_PROJECTILE) then
				cart.iDamage = DAMAGE_DEATH
				ret:Nautilus_AddQueuedProjectile(p1,cart, self.CartArt, FULL_DELAY)
			else
				ret:Nautilus_AddQueuedProjectile(p1,cart, self.CartArt, FULL_DELAY)
			end
			ret.q_effect:back().bHidePath = true
		end
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
		pStart = Point(2,0)
		q_move:push_back(Point(2,1))
		q_move:push_back(Point(2,2))
	else
		pStart = Point(2,6)
		q_move:push_back(Point(2,5))
		q_move:push_back(Point(2,4))
		q_move:push_back(Point(2,3))
		q_move:push_back(Point(2,2))
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