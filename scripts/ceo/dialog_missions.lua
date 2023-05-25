
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
	
	
	Mission_Nautilus_Minecarts_Briefing = {"The minecarts are vital to keep our operation running. Try not to get in their way, will you?", "Those carts are our supply line. Keep them running smooth, #squad.", "Those minecarts are laden with ore - don't get in their way, for both our sakes."},
	Mission_Nautilus_Minecarts_Success = {"It looks like most of the minecarts made it through unscathed. You have our thanks, #squad", "Glad to see you were successful - an open supply line can only be good for Nautilus.", "Our telemetry shows that most of those carts got past the Vek gauntlet. Many thanks."},
	Mission_Nautilus_Minecarts_Partial = {"What? Only one minecart made it through?","I thought I told you how important it was to maintain our supply line! This will put us far behind schedule.", "This is a disappointment. An expensive failure." },
	Mission_Nautilus_Minecarts_Failure = {"That was a total disaster, we needed those resources!", "What a fiasco. We needed those tracks open to ensure the transport of resources across our site.", "Disastrous."},
	
	Mission_Nautilus_Incinerator_Briefing = {"There's a lot of space down here, but managing our trash is still key to efficient work. Enter: the Incinerator.", "A combination grinder, smelter, and industrial nano-disassembler. Our pride and joy - and one well suited for the destruction of the Vek.","We call it the Incinerator. Try it out, would you?"},
	Mission_Nautilus_Incinerator_Success = {"Just look at that thing go. Thanks for the show, #squad.", "Rest assured, we captured plenty of footage for our shareholders.", "That should make for some duly impressive stock footage. Well done." },
	Mission_Nautilus_Incinerator_Partial = {"Hmm. I can't help but feel like you didn't really put our machinery to the test.","You really couldn't find a better use for our industrial grinding equipment? Well, far be it from me to tell you how to do your jobs.","A shame, I would have preferred our machine got some more field testing."},
	Mission_Nautilus_Incinerator_Failure = {"I didn't think I needed to write you an instruction manual; Vek go in the top.","Did you miss the whirling, grinding destruction pit in your mission briefing?","That wasn't what was asked of you, #squad. Kindly pay attention to your mission briefings in the future."},
	
	Mission_Nautilus_Falling_Mountains_Briefing = {"The caverns here are incredibly unstable. Perhaps you can use that to your advantage.", "Be aware of loose stalactites. Your mechs might be powerful, but don't underestimate the elemental power of falling stone.", "Interesting factoid - some of these outcroppings above weigh in the range of trillions of tons. Use that to your advantage... carefully."},
--relevant?	Mission_Nautilus_Falling_Mountains_Success = {""},
--relevant?	Mission_Nautilus_Falling_Mountains_Partial = {""},
--relevant?	Mission_Nautilus_Falling_Mountains_Failure = {""},
	
	Mission_Nautilus_Digging_Briefing = {"We're getting some troubling readings from that Vek burrowed into that mineral patch. It seems to be... afflicting them, somehow. Please remove it, post haste.","I don't like the look of that strange Vek. Destroy it before it infects any more of our ore.","That Vek burrowed in there and began to spread its vile influence into the surrounding stone. Show it the error of its ways."},
	Mission_Nautilus_Digging_Success = {"What a mess. If nothing else, the resultant minerals should make for an interesting study.", "Well done. Now it's time to clean up the biohazardous remains.", "It shattered like glass. Fascinating, if grotesque."},
--relevant?	Mission_Nautilus_Digging_Partial = {""},
	Mission_Nautilus_Digging_Failure = {"Fools! Who knows what might happen if the infestation spread to the rest of the vein?", "That's... powerfully disappointing, to say the least. I expected better.", "With that Vek in the wild, we're sure to see more of that strange blight on our minerals going forward. An expensive mistake."},
	
	Mission_Nautilus_Mining_Briefing = {"The Vek have come upon us at an unfortunate time. There's a rich vein of material running beneath this site - protect our equipment while it excavates.", "We have a mining rig out there scheduled to mine a rich payload. Keep them safe while they work.","Keep that drill rig safe while they excavate. We have to meet our quotas!"},
	Mission_Nautilus_Mining_Success = {"Clean work, #squad. And now to weigh our prize.", "Just look at that shine. You've made me - er, us - a lot of money today, #squad.", "All in a day's work, ladies and gentlemen."},
	Mission_Nautilus_Mining_Partial = {"Hmm, our ore detectors are reading untapped veins. I suppose we'll have to wait until the Vek clear out to go back for whatever you left behind.", "You missed a spot. Several, really. Amateurs...", "Did you misread the brief? You missed several rich veins out there."},
	Mission_Nautilus_Mining_Failure = {"What a disaster. Now the whole area is clogged with Vek and off-limits.", "What a waste of fine material. I was hoping for better.", "Do you understand what you've cost us by not extracting those minerals? The valuation was off the charts..."},
	
		
	Mission_Nautilus_Crumbling_Briefing = {"Watch those floors, #squad. This whole area is unstable.", "We've undermined this whole sector. Watch your footing.", "You mechs' footfalls may be enough to start a chain reaction of collapse here. Be careful."},
--relevant?	Mission_Nautilus_Crumbling_Success = {""},
--relevant?	Mission_Nautilus_Crumbling_Partial = {""},
--relevant?	Mission_Nautilus_Crumbling_Failure = {""},
	
	Mission_Nautilus_Spikes_Briefing = {"Occasionally the minerals will push their way into the surface like this. Beautiful, but razor sharp.", "These crystal formations are liable to fracture into glass-sharp edges. They're hard enough and sharp enough to puncture even your armour - or Vek hide.","Ah, the crystal caves. Sometimes there's beauty even in these dank depths. But always danger. Always danger."},
--relevant?	Mission_Nautilus_Spikes_Success = {""},
--relevant?	Mission_Nautilus_Spikes_Partial = {""},
--relevant?	Mission_Nautilus_Spikes_Failure = {""},
	
	Mission_Nautilus_Charges_Briefing = {"This area was scheduled for clearing before a Vek incursion. It would be a big help if you activated the charges while you were out there.","Those blasting charges are no joke. Activate them, then clear out of there.", "This area is littered with blasting charges from a previous failed mining attempt. Detonating them would allow us to turn a profit on this fiasco."},
	Mission_Nautilus_Charges_Success = {"Great work, great work. I'll send in the excavators to clear the detritus and see what's been exposed by the blasts.","Well done. Time to see if those surveyors knew what they were talking about.","I think I see something glittering in the rubble. Heh, wishful thinking, maybe."},
	Mission_Nautilus_Charges_Partial = {"Well that's not to cut it. Now I'll need to send my own men out to clear the remaining charges. Time and expense I can't afford.","You missed a few of them. They must have been too hard to see out there, what with the bright orange hazard paint.","I'm still detecting disabled charges. Not good enough, #squad."},
	Mission_Nautilus_Charges_Failure = {"What a fiasco. The sector will be completely lost to the Vek at this rate.", "That was a lucrative opportunity for us, lost due to your failure.", "The failure to set those charges off will lead the Vek right to the heart of our operation."},
	
	Mission_Nautilus_Drilltrain_Briefing = {"The Rail Layer is my pride and joy. It'll tear through rock - and Vek - like butter.", "The Rail Layer could be a boon to your... work. Just put the Vek in front of it and wear a raincoat.", "We're going to lay some track right through this area. Keep out of the Rail Layer's way."},
	Mission_Nautilus_Drilltrain_Success = {"A nice, smooth path through a chaotic maze of rock. Well done, #squad.","Sensors reading that our new line is fully operational, excellent.","Straight as the edge of a knife. The Rail Layer does good work."},
	Mission_Nautilus_Drilltrain_Partial = {"The Rail Layer is tough, but not indestructible. Protect it until we can repair the damage.", "That's unfortunate. Quite unfortunate.", "Well, that's going to put us behind schedule."},
	Mission_Nautilus_Drilltrain_Failure = {"The Rail Layer is - was - critical to our operation! I'm livid, to say the least!", "That's going to put us enormously behind schedule - and over budget. I'm keeping tally of your failures.", "I suppose we'll go back to pickaxes and hand trucks to get through all this rock. Thanks for nothing."},
	
	Mission_Nautilus_Chasms_Briefing = {"This whole region is dangerously unstable. While you're out there, do your utmost to shatter that stone.", "We'd like to open a path to a lower layer. Would you mind doing the honours?", "All this overburden will need to go if we want to access the lower levels. Thankfully, we have a crew of powerful time travelling mechs standing by!"},
	Mission_Nautilus_Chasms_Success = {"A yawning crevasse, ready to be plumbed for treasures. Our thanks.", "Well done. If this 'saving the world' gig doesn't work out, perhaps there's a place for you and your rig at Nautilus.", "You can hear the wind whistling in the depths. Music to my ears."},
	--relevant?	Mission_Nautilus_Chasms_Partial = {""},
	Mission_Nautilus_Chasms_Failure = {"We needed this region clear for future work. More stable land means more potential Vek footholds in our deeper mines. Not acceptable.", "Hrm. Clearing that overburden would have made future work out there significantly easier.","I was counting on you to clear away that rubble, #squad. It'll take us ages to do the same."},
	
	Mission_Nautilus_Tremors_Briefing = {"Seismic activity down here is off the charts. Watch your footing.", "The ground is liable to give way under heavy footfalls. Stay cautious.", "Our systems are predicting tremors out there; expect sinkholes to open at inopportune times."},
--relevant?	Mission_Nautilus_Tremors_Success = {""},
--relevant?	Mission_Nautilus_Tremors_Partial = {""},
--relevant?	Mission_Nautilus_Tremors_Failure = {""},

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
