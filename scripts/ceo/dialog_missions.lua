
return {
	-- Nautilus Missions
	
	--[[
	blast charges -> the player must explode some blast charges.
	chasms -> the player must create chasm tiles (for whatever reason, mining maybe?)
	crumbling cave -> the cave is colapsing (tiles falling), no objective
	vek excavation -> the player must excavate and kill a special fossilized vek
	rail layer -> a drill train that can move through mountains leaves a rail trail
	falling mountains -> environment effect that drop cracked mountains on the board, no objective
	incinerator -> the player must drop 2 Vek into the incinerator (a fancy chasm)
	mining -> the player must excavate 10 minerals from special tiles
	spikes -> the board will spawn with spikes (mine that deal 1 damage), no objective.
	tremors -> environment effect that cracks lots of tiles, no objective.]]--
	
	
	Mission_Nautilus_Minecarts_Briefing = {"The minecarts are vital to keep our operation running. Try not to get in their way, will you?"},
	Mission_Nautilus_Minecarts_Success = {"It looks like most of the minecarts made it through unscathed. You have our tanks, #squad".},
	Mission_Nautilus_Minecarts_Partial = {"What? Only one minecart made it through?"},
	Mission_Nautilus_Minecarts_Failure = {"That was a total disaster, we needed those resources!"},
	
	Mission_Nautilus_Incinerator_Briefing = {"The Incinerator are vital to keep our operation running. Try not to get in their way, will you?"},
	Mission_Nautilus_Incinerator_Success = {"It looks like most of the Incinerator made it through unscathed. You have our tanks, #squad".},
	Mission_Nautilus_Incinerator_Partial = {"What? Only one minecart made it through?"},
	Mission_Nautilus_Incinerator_Failure = {"That was a total disaster, we needed those resources!"},
	
	Mission_Nautilus_Falling_Mountains_Briefing = {"The Falling_Mountains are vital to keep our operation running. Try not to get in their way, will you?"},
	Mission_Nautilus_Falling_Mountains_Success = {"It looks like most of the Falling_Mountains made it through unscathed. You have our tanks, #squad".},
	Mission_Nautilus_Falling_Mountains_Partial = {"What? Only one minecart made it through?"},
	Mission_Nautilus_Falling_Mountains_Failure = {"That was a total disaster, we needed those resources!"},
	
	Mission_Nautilus_Digging_Briefing = {"The Digging are vital to keep our operation running. Try not to get in their way, will you?"},
	Mission_Nautilus_Digging_Success = {"It looks like most of the Digging made it through unscathed. You have our tanks, #squad".},
	Mission_Nautilus_Digging_Partial = {"What? Only one minecart made it through?"},
	Mission_Nautilus_Digging_Failure = {"That was a total disaster, we needed those resources!"},
	
	Mission_Nautilus_Crumbling_Briefing = {"The Crumbling are vital to keep our operation running. Try not to get in their way, will you?"},
	Mission_Nautilus_Crumbling_Success = {"It looks like most of the Crumbling made it through unscathed. You have our tanks, #squad".},
	Mission_Nautilus_Crumbling_Partial = {"What? Only one minecart made it through?"},
	Mission_Nautilus_Crumbling_Failure = {"That was a total disaster, we needed those resources!"},
	
	Mission_Nautilus_Spikes_Briefing = {"The Spikes are vital to keep our operation running. Try not to get in their way, will you?"},
	Mission_Nautilus_Spikes_Success = {"It looks like most of the Spikes made it through unscathed. You have our tanks, #squad".},
	Mission_Nautilus_Spikes_Partial = {"What? Only one minecart made it through?"},
	Mission_Nautilus_Spikes_Failure = {"That was a total disaster, we needed those resources!"},
	
	Mission_Nautilus_Charges_Briefing = {"The Charges are vital to keep our operation running. Try not to get in their way, will you?"},
	Mission_Nautilus_Charges_Success = {"It looks like most of the Charges made it through unscathed. You have our tanks, #squad".},
	Mission_Nautilus_Charges_Partial = {"What? Only one minecart made it through?"},
	Mission_Nautilus_Charges_Failure = {"That was a total disaster, we needed those resources!"},
	
	Mission_Nautilus_Drilltrain_Briefing = {"The Drilltrain are vital to keep our operation running. Try not to get in their way, will you?"},
	Mission_Nautilus_Drilltrain_Success = {"It looks like most of the Drilltrain made it through unscathed. You have our tanks, #squad".},
	Mission_Nautilus_Drilltrain_Partial = {"What? Only one minecart made it through?"},
	Mission_Nautilus_Drilltrain_Failure = {"That was a total disaster, we needed those resources!"},
	
	Mission_Nautilus_Chasms_Briefing = {"The Chasms are vital to keep our operation running. Try not to get in their way, will you?"},
	Mission_Nautilus_Chasms_Success = {"It looks like most of the Chasms made it through unscathed. You have our tanks, #squad".},
	Mission_Nautilus_Chasms_Partial = {"What? Only one minecart made it through?"},
	Mission_Nautilus_Chasms_Failure = {"That was a total disaster, we needed those resources!"},
	
	Mission_Nautilus_Tremors_Briefing = {"The Tremors are vital to keep our operation running. Try not to get in their way, will you?"},
	Mission_Nautilus_Tremors_Success = {"It looks like most of the Tremors made it through unscathed. You have our tanks, #squad".},
	Mission_Nautilus_Tremors_Partial = {"What? Only one minecart made it through?"},
	Mission_Nautilus_Tremors_Failure = {"That was a total disaster, we needed those resources!"},
	


	-- Universal Missions
	Mission_Train_Briefing = {},
	Mission_Train_Success = {},
	Mission_Train_Failure = {},
	Mission_Train_Partial = {},
	Mission_Train_TrainStopped = {},
	Mission_Train_TrainDestroyed = {},
	
	--[[Mission_Volatile_Briefing = {},
	Mission_Volatile_Success = {},
	Mission_Volatile_Failure = {},
	
	Mission_BlobBoss_Briefing = {},
	Mission_BlobBoss_Success = {},
	Mission_BlobBoss_Failure = {},
	
	Mission_SpiderBoss_Briefing = {},
	Mission_SpiderBoss_Success = {},
	Mission_SpiderBoss_Failure = {},
	
	Mission_BotBoss_Briefing = {},
	Mission_BotBoss_Success = {},
	Mission_BotBoss_Tower = {},
	Mission_BotBoss_Boss = {},

	-- Unknown
	Mission_Block_Reminder = {},

	-- Archive
	Mission_Airstrike_Briefing = {},
	Mission_Airstrike_Success = {},
	Mission_Airstrike_Incoming = {},
	
	Mission_Tanks_Briefing = {},
	Mission_Tanks_Success = {},
	Mission_Tanks_Failure = {},
	Mission_Tanks_Partial = {},
	Mission_Tanks_Activated = {},
	Mission_Tanks_PartialActivated = {},
	
	Mission_Satellite_Briefing = {},
	Mission_Satellite_Success = {},
	Mission_Satellite_Failure = {},
	Mission_Satellite_Partial = {},
	Mission_Satellite_Destroyed = {},
	Mission_Satellite_Imminent = {},
	Mission_Satellite_Launch = {},
	
	Mission_Artillery_Briefing = {},
	Mission_Artillery_Success = {},
	Mission_Artillery_Failure = {},
	
	Mission_Dam_Briefing = {},
	Mission_Dam_Success = {},
	Mission_Dam_Failure = {},
	Mission_Dam_Reminder = {},
	Mission_Dam_Destroyed = {},
	
	Mission_Tides_Briefing = {},
	Mission_Tides_Success = {},
	
	Mission_Mines_Vek = {},

	-- RST
	Mission_Force_Briefing = {},
	Mission_Force_Success = {},
	Mission_Force_Failure = {},
	Mission_Force_MountainsAlive = {},
	Mission_Force_VekAlive = {},
	Mission_Force_Reminder = {},
	
	Mission_Holes_Briefing = {},
	Mission_Holes_Success = {},
	
	Mission_Lightning_Briefing = {},
	Mission_Lightning_Success = {},
	Mission_Lightning_Strike_Vek = {},
	
	Mission_Terraform_Briefing = {},
	Mission_Terraform_Success = {},
	Mission_Terraform_Failure = {},
	Mission_Terraform_Incomplete = {},
	Mission_Terraform_Destroyed = {},
	Mission_Terraform_Attacks = {},
	
	Mission_Cataclysm_Briefing = {},
	Mission_Cataclysm_Success = {},
	Mission_Cataclysm_Falling = {},
	
	Mission_Crack_Briefing = {},
	Mission_Crack_Success = {},
	
	-- Earth mover
	Mission_Filler_Briefing = {},
	Mission_Filler_Success = {},
	Mission_Filler_Failure = {},
	
	Mission_Solar_Briefing = {},
	Mission_Solar_Success = {},
	Mission_Solar_Failure = {},
	Mission_Solar_Partial = {},
	Mission_Solar_Destroyed = {},
	
	Mission_Bomb_Briefing = {},
	Mission_Bomb_Success = {},
	Mission_Bomb_Failure = {},
	Mission_Bomb_Partial = {},

	-- Pinnacle
	Mission_FreezeBots_Briefing = {},
	Mission_FreezeBots_Success = {},
	Mission_FreezeBots_Failure = {},
	Mission_FreezeBots_Freed = {},
	Mission_FreezeBots_Dead = {},
	
	Mission_BotDefense_Briefing = {},
	Mission_BotDefense_Success = {},
	Mission_BotDefense_Failure = {},
	Mission_BotDefense_Partial = {},
	
	Mission_Factory_Briefing = {},
	Mission_Factory_Success = {},
	Mission_Factory_Failure = {},
	Mission_Factory_Partial = {},
	Mission_Factory_Destroyed = {},
	Mission_Factory_Spawning = {},
	
	Mission_Reactivation_Briefing = {},
	Mission_Reactivation_Success = {},
	Mission_Reactivation_Thawed = {},
	
	Mission_SnowBattle_Briefing = {},
	Mission_SnowBattle_Success = {},
	
	Mission_Stasis_Briefing = {},
	Mission_Stasis_Success = {},
	
	Mission_Freeze_Mines_Briefing = {},
	Mission_Freeze_Mines_Success = {},
	Mission_Freeze_Mines_Vek = {},
	
	Mission_FreezeBldg_Briefing = {},
	Mission_FreezeBldg_Success = {},
	Mission_FreezeBldg_Failure = {},
	
	Mission_SnowStorm_Briefing = {},
	Mission_SnowStorm_Success = {},
	Mission_SnowStorm_FrozenVek = {},
	Mission_SnowStorm_FrozenMech = {},
	
	BotKilled_Self = {},
	BotKilled_Obs = {},

	-- Detritus
	Mission_Barrels_Briefing = {},
	Mission_Barrels_Success = {},
	Mission_Barrels_Failure = {},
	Mission_Barrels_Destroyed = {},
	
	Mission_Disposal_Briefing = {},
	Mission_Disposal_Success = {},
	Mission_Disposal_Failure = {},
	Mission_Disposal_Destroyed = {},
	Mission_Disposal_Activated = {},
	Mission_Disposal_Disposal = {},
	Mission_Disposal_Mountains = {},
	
	Mission_AcidTank_Briefing = {},
	Mission_AcidTank_Success = {},
	Mission_AcidTank_Failure = {},
	
	Mission_Acid_Briefing = {},
	Mission_Acid_Success = {},
	
	Mission_Power_Briefing = {},
	Mission_Power_Success = {},
	Mission_Power_Failure = {},
	Mission_Power_Partial = {},
	Mission_Power_Destroyed = {},
	
	Mission_Belt_Briefing = {},
	Mission_Belt_Success = {},
	Mission_Belt_Mech = {},
	
	Mission_Teleporter_Briefing = {},
	Mission_Teleporter_Success = {},
	Mission_Teleporter_Mech = {},
	
	-- Meridia Mission Events.
	Mission_lmn_Convoy_Destroyed = {},
	Mission_lmn_FlashFlood_Flood = {},
	Mission_lmn_Geyser_Launch_Mech = {},
	Mission_lmn_Geyser_Launch_Vek = {},
	Mission_lmn_Volcanic_Vent_Erupt_Vek = {},
	Mission_lmn_Wind_Push = {},
	
	Mission_lmn_Runway_Imminent = {},
	Mission_lmn_Runway_Crashed = {},
	Mission_lmn_Runway_Takeoff = {},
	Mission_lmn_Greenhouse_Destroyed = {},
	Mission_lmn_Geothermal_Plant_Destroyed = {},
	Mission_lmn_Hotel_Destroyed = {},
	Mission_lmn_Agroforest_Destroyed = {},
	
	-- Final Mission (Jessica Kern only)
	MissionFinal_Start = {},
	MissionFinal_StartResponse = {},
	MissionFinal_FallStart = {},
	MissionFinal_FallResponse = {},
	MissionFinal_Pylons = {},
	MissionFinal_Bomb = {},
	MissionFinal_BombResponse = {},
	MissionFinal_CaveStart = {},
	MissionFinal_BombDestroyed = {},
	MissionFinal_BombArmed = {},]]
}
