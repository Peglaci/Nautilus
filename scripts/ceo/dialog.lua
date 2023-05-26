
-- Table of responses to various events.
return {
	--["Script ID"] = "CEO_Nautilus_ceo_id_1", -- don't think this is needed, but included for completeness.
	Welcome_Message = {
		"Greetings and salutations, #squad. Your assistance is begrudgingly accepted in clearing our mines of alien pests. Otherwise, stay out of our affairs.",
		"Welcome to our underground domain. We do not often rely on outside help, but the situation calls for it.",
		"It seems we have no choice but to accept your aid. Make no mistake, we are not friends, but our interests align.",
		"I offer a lukewarm welcome to you and your mecha pilots. Your skills may prove useful in eradicating the infestation, but rest assured we would be left alone.",
		"I extend my unwelcome welcome to you and your squadron. We may not see eye to eye, but we must work together for the sake of our operations.",
		"Welcome to the belly of the earth, where danger lurks around every corner. Your presence is tolerated, for now.",
		"Your arrival is not a cause for celebration, but a necessity. We must collaborate to cleanse our mines of these abominations.",
		"As much as it pains me to admit it, we need your help. Welcome to our underground base of operations.",
		"I offer a begrudging welcome to you and your team. Let us not waste any time and get to work.",		
	},
	Island_Perfect = {
		"The mines are clear, we can finally resume our operations. Help yourselves to some trinkets and clear out so we can get some work done.", 
		"Your work here is done. Our vaults are open to you, I suggest you leave before I change my mind about your usefulness. ",
		"Admirably done. I must say, I am relieved to see the back of you. Farewell, and don't come back.",
		"Well, you've done it. You've proven yourselves to be more than just a nuisance. Grab your treasures and go.",
		"I can't believe I'm saying this, but thank you for your help. Nautilus Heavy Industries owes you a debt of gratitude.",
		"Your technology and skills are impressive, but I hope we never have to call on you again. Take your rewards.",
		"I'll give credit where it's due. You've earned your pay this time.",
		"I'm amazed that your team was able to accomplish what we couldn't. Congratulations.",
		"You may have saved the day, but don't get too comfortable. We won't be needing your help again anytime soon.",
	},
	Region_Names = [[   
		Coreward Forge,
		Titanium Vault,
		Inferno Chamber,
		Crystal Caverns,
		Magma Tunnels,
		Lithium Labyrinth,
		Abyssal Drifts,
		Diamond Nexus,
		Riftfall,
		Zero Point,
		Chthonic Vastness, 
		Gamma Outpost,
		Omega Outpost,
		Sapphire Sanctum,
		Carbon Depths,
		Blackout Station,
		Radiant Repository,
		Iron Stronghold,
		Echoing Chambers,
		Chaos Chasm
	]], 
	
	-- Game States
	--Gamestart = {},
	--FTL_Found = {},
	--FTL_Start = {},
	--Gamestart_PostVictory = {},
	--Death_Revived = {},
	--Death_Main = {},
	Death_Response = {
		"Your recklessness has cost you dearly.",
		"I'm not happy about the loss of life, but maybe now you'll take this more seriously.", 
		"I hope this serves as a wake-up call for your team.",
		"Hrm.",
		"I offer my condolences, but it seems your team was not as invincible as you thought.",
	},
	Death_Response_AI = {
		"It's just a machine. Don't let it distract you from the task at hand.",
		"My condolences, but the loss of an AI is hardly a tragedy.",
		"The loss of a synthetic is unfortunate, but not unexpected.",
		"Maybe next time you'll invest in a better AI system.",
	},
	--TimeTravel_Win = {},
	Gameover_Start = {
		"Thanks for nothing. Your incompetence has sealed our fate.",
		"I don't even know where to begin. You've caused a disaster of unprecedented proportions.",
		"The Grid was our lifeline, and you let it slip away.", 
	},
	Gameover_Response = {
		"I'm not surprised at your failure, but that doesn't make it any less devastating.",
		"The end of the world is on your hands, and you'll have to live with that guilt forever.", 
		"I hope you can live with the consequences of your actions.",
		"Go on, run. You've doomed this world, but you have the luxury of escape.",
	},
	
	-- UI Barks
	--Upgrade_PowerWeapon = {},
	--Upgrade_NoWeapon = {},
	--Upgrade_PowerGeneric = {},
	
	-- Mid-Battle
	MissionStart = {
		"I hope you're ready to get your hands dirty. We have work to do.",
		"We're counting on you to get this done. Don't disappoint us.",
		"It's about time you showed up. Let's get to work.",
		"We've been waiting for you. Now let's see what you can do.",
		"I have faith in your abilities. Let's see if you live up to the hype.",
		"We know you're capable. Don't make us regret bringing you in.",
	},
	Mission_ResetTurn = {
		"I don't know what just happened, but I don't like it.",
		"The fact that you're messing around with the fundamental laws of physics is enough to make me question your entire operation.",
		"The implications of what just happened are too scary to contemplate.",
		"Your reckless breaching is going to get us all killed. Mark my words."
	},
	MissionEnd_Dead = {
		"I have to give credit where credit is due. You got em'.",
		"I'll admit, I was skeptical about your abilities, but you've proved me wrong. You're all incredibly skilled.",
		"I have to hand it to you, you're a force to be reckoned with.",
		"I may not be your biggest fan, but I can't deny that you're effective.",
	},
	MissionEnd_Retreat = {
		"Well, at least you managed to chase them away. I suppose that's something.",
		"We'll be lucky if they don't come back. Next time, make sure you finish the job.",
		"Impressive. But why didn't you finish the job and eliminate them once and for all?",
		"I would have preferred a more permanent solution, but I suppose chasing them away will have to do.",
		"You've done well, but don't let your success go to your heads. There's still work to be done.",
	},
	
	PodIncoming = {
		"What in the world is that thing? It's coming in hot!",
		"Get the retrieval teams ready. We need to secure that pod before anyone else does.",
		"I never thought I'd see the day when we'd be receiving gifts from the future.",
		"How unusual a thing you have found!",
	},
	PodResponse = {
		"I have a feeling this pod will be a game-changer for us. Let's get it open and see what we've got.",
		"The recovery of this pod could be a turning point for us. We'll have to wait and see.",
		"This is a major discovery for our company. I'm eager to get it opened and see what's inside.",
		"This is going to be a huge breakthrough for us.",
	},
	--PodCollected_Self = {},
	PodDestroyed_Obs = {
		"You had one job, and you failed. The destruction of that pod is on your hands.",
		"The destruction of that pod is a direct result of your incompetence. I hope you're ready to face the consequences.",
		"Well, I hope there wasn't anything in there that could have saved the world.",
	},
	--Secret_DeviceSeen_Mountain = {},
	--Secret_DeviceSeen_Ice = {},
	--Secret_DeviceUsed = {},
	--Secret_Arriving = {},
	Emerge_Detected = {
	"I don't care what it takes, #squad. You need to stop that Vek from emerging.",
	"The fate of our mining operation is in your hands, #squad. Don't let that Vek destroy everything we've built.", 
	"Force that bug back down.",
	},
	--Emerge_Success = {},
	--Emerge_FailedMech = {},
	--Emerge_FailedVek = {},

	-- Mech State
	--Mech_LowHealth = {},
	--Mech_Webbed = {},
	--Mech_Shielded = {},
	--Mech_Repaired = {},
	--Pilot_Level_Self = {},
	--Pilot_Level_Obs = {},
	--Mech_ShieldDown = {},

	-- Damage Done
	Vek_Drown = {
		"Looks like that Vek was out of their depth.",
		"Looks like that Vek's swimming lessons weren't up to par.",
		"Looks like that Vek couldn't swim with the big fish.",
	},
	Vek_Fall = {
		"Looks like they met their downfall. Good riddance to bad Vek.",
		"Their fall from grace was quite spectacular. Almost worth watching again.",
		"It's a long way down for those Vek. I hope they enjoy their trip to the bottom.",
		"They fell for our trap like the simple creatures they are.",
	},
	Vek_Smoke = {	
		"I don't think that Vek saw that coming... or anything else, for that matter.",
		"It's amazing how something as simple as smoke can take down a giant monster. Perhaps they should have invested in eye drops.",
		"Don't repeat their mistake, #squad.",
	},
	Vek_Frozen = {
		"Looks like that Vek just got cold feet. Or should I say, cold everything.",
		"Looks like that Vek just became a permanent ice sculpture. I hope they like the cold.",
		"I guess that's what happens when you can't take the heat. You get frozen solid.",
	},
	--VekKilled_Self = {},
	VekKilled_Obs = {
		"Well done. I suppose I underestimated your capabilities.",
		"Your tech is impressive, but nothing we couldn't develop ourselves.",
		"Just look at it crumple.",
		"I have to admit, watching that take down was quite satisfying.",
	},
	VekKilled_Vek = {
		"I can't believe we're being threatened by such foolish creatures. The Vek are a joke.",
		"It's almost sad watching them stumble around like fools. Almost.",
		"The Vek may be powerful, but they're not exactly tactical geniuses.",
		"The Vek are proving to be their own worst enemies.", 
		"It's almost too easy watching them take each other out.",
	},
	--DoubleVekKill_Self = {},
	DoubleVekKill_Obs = {
		"Well, I'll be damned. You time travellers might just be the key to clearing out these Vek for good.",
		"You've proven that you're not entirely useless. Maybe I'll keep you around a bit longer.",
		"I have to admit, your mecha technology is impressive. I wouldn't mind getting my hands on it.",
		"Impressive. I didn't think you had it in you.",
 		"If you keep this up, we might actually make some progress.",
	},
	DoubleVekKill_Vek = {
		"I'm not sure what's more amusing - the fact that the Vek are killing each other, or the fact that they're doing it by accident.",
		"Even the Vek are no match for the Vek, apparently.",
		"I'm surprised the Vek managed to take out more than one target at once, given their lack of tactical acumen.",
		"Would you look at that. I hope someone was recording.",
	},
	
	--MntDestroyed_Self = {},
	--MntDestroyed_Obs = {},
	--MntDestroyed_Vek = {},
	
	PowerCritical = {
		"If the Grid fails, we're all doomed. Don't let it get any lower.",
		"This is unacceptable. The Power Grid is the lifeblood of this operation. Keep it functioning properly.",
		"I don't want to hear excuses. The Power Grid needs to be back at acceptable levels, and it needs to happen now.",
		"What in the world is going on here? The Power Grid is critically low! How did you let this happen?",
	},
	--Bldg_Destroyed_Self = {},
	Bldg_Destroyed_Obs = {
		"I can't believe you just caused such a catastrophic loss of productivity.",
		"You're lucky we still need your help, because if it were up to me, you'd be gone.",
		"I hope you're proud of yourself. Your reckless actions have cost us dearly.",
		"This is an absolute disaster. The loss of life is unacceptable.",
	},
	Bldg_Destroyed_Vek = {
		"This is an outrage! How dare that Vek destroy our infrastructure and kill innocent people!",
		"The Vek have gone too far this time. We must make them pay for their crimes.",
		"We have lost valuable resources and manpower because of this attack. The Vek will pay.",
		"Monsters.",
	},
	Bldg_Resisted = {
		"I have to say, that was an impressive display of our technology's capabilities.",
		"That's the power of the Grid for you! Nothing can get through those shields!",
		"See that? That's the strength of our technology in action. Impressive, isn't it?",
		"Nice try. But not good enough!",
	},
	
	-- Generic Missions
	Mission_Generic_Briefing = {
		"The Vek have been causing us no end of trouble. It's about time someone dealt with them.", 
		"I'm not thrilled about outsiders interfering in our affairs, but I suppose desperate times call for desperate measures.", 
		"Let's get one thing straight: you may be here to help us, but you're still outsiders. Don't forget it.", 
		"We've managed to keep the Vek at bay for this long, but they're getting stronger every day. We need your help to put an end to them.", 
		"We've lost good people to the Vek. Don't take this mission lightly.",
		"I hope you're prepared for the dangers of these caverns. The Vek are not to be underestimated."
	},
	Mission_Generic_Success = {
		"Well, #squad, I'll give you credit where it's due - you got the job done.",
		"Excellent work on driving back the Vek. Your team's efforts have not gone unnoticed.", 
		"You have proven yourselves to be a formidable force against the Vek threat. Well done.",
		"Your mission was a success, and the Vek threat has been neutralized. Nautilus owes you a debt of gratitude.",
		"Your team's dedication and skill in defeating the Vek have earned the respect and admiration of my men. Don't let it get to your heads.",		
	},
	Mission_Generic_Failure = {
		"Your failure to conquer the Vek is unacceptable.",
		"I expected better from you, #squad. I'll revise my estimations downwards in the future.",
		"The Vek are a threat to our survival, and your incompetence has put us all at risk.",
		"You've let the Vek get the upper hand, and now we're all paying the price.",
		"This failure will not be forgotten, and it will not be forgiven.",
		"Your failure has cost us dearly; we can't afford to make any more mistakes.",
		"I trusted you to handle this discretely, and you've let me down.",
	},
	
	-- Unsure if these should be filled in or not.
	--Mission_Survive_Briefing = {},
	--Mission_Survive_Success = {},
	--Mission_Survive_Failure = {},
	
	-- >=3 grid damage during a mission.
	Mission_ExtremeDamage = {
		"I expected more from a team of professionals. Be assured that the cost of repairs will rest on your heads.", 
		"You've cost us a lot of time and money with your recklessness. It'll take us years to recover from this.", 
		"I hope you're ready to compensate us for the damage you caused out there. What a fiasco.", 
		"Your lack of regard for our facilities and personnel is inexcusable. Your actions - or inactions, I should say - have set back our operations significantly.", 
		"I'm deeply disappointed in your performance. This kind of damage is unacceptable and won't be tolerated in the future.",
	},
	Mission_Mechs_Dead = {
		"Your efforts will not be forgotten, nor will the sacrifices you've made.",
		"Your team fought like hell out there, and I respect that.",
		"I appreciate the sacrifices you and your team made to protect our equipment and people. Nautilus will remember your fallen.", 
		"You've proven yourselves to be true professionals, even in the face of overwhelming odds. Nautilus will remember your fallen.",
	},
	
	-- Generic Objectives
	-- Lose less than x mech health
	Mission_MechHealth_Briefing = {
		"Listen up, #squad. I want all of you to come back in one piece. Remember, repairs are expensive, so try to avoid getting hit!",
		"We need those mechs in top condition for the next mission, so avoid unnecessary damage.",
		"Your mechs are valuable assets, so take care of them. If you come back with damage, you better have a damn good reason for it.", 
		"Don't take unnecessary risks. We need those mechs intact. Remember, every scratch and dent is going to cost us.", 
		"I can't stress this enough: keep those mechs in one piece. We can't afford to be careless with our equipment. Keep your mechs in top shape.", 

	},
	Mission_MechHealth_Success = {
		"It's refreshing to work with a team that understands the value of not causing needless destruction.",
		"Your ability to avoid causing unnecessary damage shows a level of skill that I didn't think was possible.", 
		"I'm pleased to see that you understand the importance of being mindful of your surroundings.", 
		"I have to say, I'm impressed with the level of restraint you showed during the mission.",
		
	},
	Mission_MechHealth_Failure = {
		"I'm going to need an explanation for all this damage on my desk by the end of the day.",
		"I hope you have deep pockets, because repairing the mecha is not cheap.", 
		"I hope you enjoyed the thrill of battle, because those repairs are going to be expensive.", 
		"You may think you're invincible, but those repair costs are going to bring you back to reality.", 
	},
	
	-- Lose less than x grid
	Mission_GridHealth_Briefing = {
		"The Power Grid is our lifeline, so don't even think about putting it in danger.", 
		"I can't stress this enough: protect the Power Grid at all costs.", 
		"#squad, if the Power Grid goes down, we're all dead. So, be smart out there.", 
		"The Power Grid is critical to our survival. Do not let it be compromised.", 
		"Remember, the Power Grid is your number one priority. Don't forget it.",
	},
	Mission_GridHealth_Success = {
		"I'm pleased that you were able to complete the mission without causing any significant damage to the Grid.",
		"Your efforts to protect the Power Grid are appreciated. We owe you a debt of gratitude.",
		"You've shown that you have the skills and discipline necessary to protect the Power Grid. Keep up the good work.", 
		"The Power Grid is our lifeline, and you did an excellent job in safeguarding it. We couldn't have done it without you.", 
		"Your success in minimizing damage to the Power Grid has given us hope that we can weather this crisis.",
	},
	Mission_GridHealth_Failure = {
		"Your carelessness with the Power Grid has endangered us all. I expected better from a team of supposed professionals.", 
		"If you can't even protect the Grid, what good are you to us? You've put our entire operation in jeopardy with your incompetence.", 
		"I don't care about your excuses. The fact remains that you failed to protect the Grid.", 
		"Your disregard for the Power Grid is inexcusable. Do you have any idea what you've done? That's our lifeline.", 
	},
	
	-- Kill x enemies
	Mission_KillAll_Briefing = {
		"Listen up, pilots. Your mission is simple: Kill every last Vek in these mines.", 
		"We cannot afford to let even one of these creatures escape. The stakes are too high.", 
		"I don't care how tough these Vek are supposed to be. You're tougher.", 
		"We've lost too many good miners to these Vek. It's time to make them pay.", 
		"I don't want to hear any excuses. If even one Vek escapes, we'll be in big trouble.", 
		"You'll have the best equipment and technology at your disposal. Use it wisely.", 
	},
	Mission_KillAll_Success = {
		"I'm glad to see that our investment in you was not wasted. Your ruthlessness is unmatched.",
		"Well done. We sent you to kill Vek, and you did just that.",
		"Your precision in executing the mission was impressive. Not a single Vek escaped.", 
		"You've made it clear that we will not tolerate the Vek's presence. Well done.",
	},
	Mission_KillAll_Failure = {
		"The Vek will now spread throughout the area, and we have you to blame for that.", 
		"Your failure has made it clear that you are not fit for this task. Perhaps you could turn over your technology to someone better suited...",
		"You were tasked with a simple mission, and you failed spectacularly. Thanks to your failure, we'll be dealing with Vek incursions for years to come.", 
	 	"Your failure will cost us dearly, both in resources and in lives. The contamination caused by the Vek will have long-lasting effects.", 
	},
	
	-- Block x spawns
	Mission_Block_Briefing = {
		"We've identified several potential exit points, and it's your job to block them off before the Vek can get through.",
		"If the Vek make it to the surface, it'll be a disaster. We can't let that happen.", 
		"Do not, under any circumstances, let them up to the surface. Things are unstable enough as it is down here.",
		"#squad, you're the only thing standing between the Vek and the surface. Do not disappoint me.",
		
	},
	Mission_Block_Success = {
		"The tectonic stability of the area is a direct result of your successful mission. Congratulations.",
		"Your mission to block the Vek's exits was a roaring success. The company and the surrounding communities owe you a debt of gratitude.",
		"Now hopefully they stay down there.",
		"Great. The question now is where they're even *coming* from. What's deeper than Nautilus?",
	},
	Mission_Block_Failure = {
		 "Blocking the exits was supposed to prevent the Vek from emerging, but now the tectonic activity in the area is off the charts.",
		 "Their emergence has destabilized an already unstable area. I wouldn't be surprised if the whole place comes down on our heads.",
		 "Those tunnels are going to be pathways for future incursions, mark my words...",
		"Well, what's done is done. We need to find a way to fix the damage they've caused before it's too late.",
	},
	
	Mission_BossGeneric_Briefing = {
		 "The Vek is too powerful for our conventional weapons. You'll need to use all your skills to defeat it.", 
		"This Vek is unlike anything we've seen before. Be prepared for anything.", 
		"We're counting on you to take down this monster and protect our enterprise.", 
		"The fate of Nautilus rests on your shoulders. Get out there!", 
	},
	Mission_BossGeneric_Success = {
		"I'll make sure your payment is wired to you promptly. Now, if you don't mind, I have work to do.", 
		"Nautilus owes you a debt of gratitude, #squad. Now, please leave so I can start processing the corpse.",
		"That creature was a formidable opponent, but you made quick work of it. I'm impressed.",
		"You've done me a great service, but I'm afraid I don't have much time for gratitude. There's much work to be done yet.",
		"The bigger they are...",
	},
	Mission_BossGeneric_Tower = {
		"All gone. The work of decades, lost in a ruinous moment.",
		"*SIGNAL LOST*",
		"I don't know if Nautilus will ever recover from this loss...",
	},
	Mission_BossGeneric_Boss = {
		"That titan Vek may have escaped, but it's left a trail we can follow. We'll take it from here, #squad.",
		"You drove it off, barely. We need to gather our resources and prepare for its inevitable return.",
		"The Vek Boss may have retreated, but it's only a matter of time before it returns. Your efforts were commendable, but we need to stay vigilant.", 
	},
	
	-- Final mission
	MissionFinal_StartResponse = {
		"Deploying power Pylons, ladies and gentlemen. That should keep things running for long enough to end this.",
		"Pylons coming down. That should keep your mechs online, #squad.",
		"Pylons lighting up. That's all we have, so make it count.",
	},
	MissionFinal_FallStart = {
		"Seismic activity off the charts! Watch your footing!",		
		"How could we have missed that - sinkhole! Brace yourselves!",
		"Hold on tight, you're going down!",
	},
	MissionFinal_Pylons = {
		"These are the very last of our mobile relays. Once they're gone, they're gone.",
		"That's the best I can do, #squad. Make them count.",
		"The last of our Pylons. They should be enough. They'll have to be.",
	},
	MissionFinal_BombResponse = {
		"A little gift from Dr. Renfield. If you can keep this safe until it's finished priming, we'll win this yet.",
		"I can't even begin to describe what this bomb does. The specs were way beyond anything I've seen. Keep it safe.",		
		"This is, as I understand it, one hell of a bomb. Don't mess around, now.",
	},
	MissionFinal_BombDestroyed = {
		"Count yourselves fortunate we have a spare. Get your heads in the game, #squad!",		
		"Thoughtless cretins, these are expensive! Don't count on another!",			
		"How many of these do you think we have, guys? Stay focused!",
	},
	MissionFinal_BombArmed = {
		"That's it. It's over. Congratulations, and thank you.",		
		"It's time to leave, #squad. Thank you.",				
		"It's going to blow! Time to go, gang!",
	},
	
	
}
