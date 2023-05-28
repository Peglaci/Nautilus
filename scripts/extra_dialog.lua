
local extraDialog = {
	-- Archive generic
	Archive = {
		Mission_Nautilus_CrumblingReaction = {
			"We have to hurry, the ground is falling!",
			"The ground is shaking, commander!",
		},
		Mission_Nautilus_ExcavatorDestroyed = {
			"That Excavator wasn't very durable.",
			"That Excavator's scrap.",
		},
		Mission_Nautilus_DrillerDestroyed = {
			"That Driller wasn't very durable.",
			"That Driller's scrap.",
		},
		Mission_Nautilus_BlastChargeDestroyed = {
			"That Blast Charge's scrap.",
		},
		Mission_Nautilus_BlastChargeExploded = {
			"Blast Charge detonated!",
		},
		Mission_Nautilus_RailLayerDamaged = {
			"Rail Layer took a hit... but it's not irreparable.",
			"Rail Layer took some damage, but Nautilus engineering teams could patch it up.",
		},
		Mission_Nautilus_RailLayerDestroyed = {
			"Nautilus isn't going to like this one bit...",
			"That's it for Nautilus' new supply line.",
		},
	},
	
	-- RST generic
	Rust = {
		Mission_Nautilus_CrumblingReaction = {
			"Are we in R.S.T.?",
			"Feels like home.",
		},
		Mission_Nautilus_ExcavatorDestroyed = {
			"That Excavator just blew up.",
			"Tanaka's Excavator is down.",
		},
		Mission_Nautilus_DrillerDestroyed = {
			"That Driller wasn't very durable.",
			"That Driller's scrap.",
		},
		Mission_Nautilus_BlastChargeDestroyed = {
			"Blast Charge disabled.",
			"Blast Charge's gone.",
		},
		Mission_Nautilus_BlastChargeExploded = {
			"That Blast Charge blew up!"
		},
		Mission_Nautilus_RailLayerDamaged = {
			"The Rail Layer is hit, but not destroyed. Yet.",
			"Rail Layer damaged, commander, but not destroyed.",
		},
		Mission_Nautilus_RailLayerDestroyed = {
			"The Rail Layer's gone. Leave it.",
			"Rail Layer's dead, Nautilus can bury it after we're done here.",
		},
	},
	
	-- Pinnacle generic
	Pinnacle = {
		Mission_Nautilus_CrumblingReaction = {
			"[ Seismic activity detected ]",
			"[ Cave unstable. Caution is advised ]",
		},
		Mission_Nautilus_ExcavatorDestroyed = {
			"[ Excavator ally has been destroyed ]",
			"[ Excavator is offline ]",
		},
		Mission_Nautilus_DrillerDestroyed = {
			"[ Driller ally has been destroyed ]",
			"[ Driller is offline ]",
		},
		Mission_Nautilus_BlastChargeDestroyed = {
			"[ Blast Charge has been desabled ]"
		},
		Mission_Nautilus_BlastChargeExploded = {
			"[ Blast Charge has been detonated ]"
		},
		Mission_Nautilus_RailLayerDamaged = {
			"[ Rail Layer is damaged ]",
		},
		Mission_Nautilus_RailLayerDestroyed = {
			"[ Rail Layer is destroyed ]",
			"[ Rail Layer is irreparable ]",
		},
	},
	
	-- Detritus generic
	Detritus = {
		Mission_Nautilus_CrumblingReaction = {
			"This doesn't look good.",
			"This whole thing is going down!",
		},
		Mission_Nautilus_ExcavatorDestroyed = {
			"That Excavator wasn't very durable.",
			"We'll have to continue without the Excavator.",
		},
		Mission_Nautilus_DrillerDestroyed = {
			"That Driller wasn't very durable.",
			"That Driller's scrap.",
		},
		Mission_Nautilus_BlastChargeDestroyed = {
			"Blast Charge destroyed."
		},
		Mission_Nautilus_BlastChargeExploded = {
			"Blast Charge exploded!."
		},
		Mission_Nautilus_RailLayerDamaged = {
			"The Rail Layer is disabled, but Nautilus should be able to fix it.",
			"The Rail Layer's partially damaged, but not destroyed.",
		},
		Mission_Nautilus_RailLayerDestroyed = {
			"The Rail Layer's destroyed. Not even Nautilus could get it running again.",
			"CEO Tanaka won't be happy about the loss of the Rail Layer.",
		},
	},
	
	-- AI generic
	Artificial = {
		Mission_Nautilus_CrumblingReaction = {
			"Alert: Cave collapsing",
		},
		Mission_Nautilus_ExcavatorDestroyed = {
			"Update: Excavator unit destroyed",
		},
		Mission_Nautilus_DrillerDestroyed = {
			"That Driller wasn't very durable.",
			"That Driller's scrap.",
		},
		Mission_Nautilus_BlastChargeDestroyed = {
			"That Blast Charge was destroyed without exploding."
		},
		Mission_Nautilus_BlastChargeExploded = {
			"That Blast Charge went boom."
		},
		Mission_Nautilus_RailLayerDamaged = {
			"Scanning: Rail Layer schematics\nDiagnostic: Recoverable",
		},
		Mission_Nautilus_RailLayerDestroyed = {
			"Update: Rail Layer destroyed\nObjective: Failed",
		},
	},

	-- Archimedes
	Aquatic = {
		Mission_Nautilus_CrumblingReaction = {
			"As expected, the structural integrity of this cave is failing.",
			"The cave is collapsing. Unsurprising, given the precarious conditions it is maintained.",
		},
		Mission_Nautilus_ExcavatorDestroyed = {
			"Excavator unit destroyed, what a waste.",
		},
		Mission_Nautilus_DrillerDestroyed = {
			"That Driller wasn't very durable.",
			"That Driller's scrap.",
		},
		Mission_Nautilus_BlastChargeDestroyed = {
			"That Blast Charge was destroyed without exploding."
		},
		Mission_Nautilus_BlastChargeExploded = {
			"That Blast Charge went boom."
		},
		Mission_Nautilus_RailLayerDamaged = {
			"That Excavator wasn't very durable.",
		},
		Mission_Nautilus_RailLayerDestroyed = {
			"That Excavator wasn't very durable.",
		},
	},
	
	-- Abe Isamu
	Assassin = {
		Mission_Nautilus_CrumblingReaction = {
			"Things just got interesting.",
			"The higher the risk, the higher the reward.",
		},
		Mission_Nautilus_ExcavatorDestroyed = {
			"The Excavator is destroyed.",
		},
		Mission_Nautilus_DrillerDestroyed = {
			"That Driller wasn't very durable.",
			"That Driller's scrap.",
		},
		Mission_Nautilus_BlastChargeDestroyed = {
			"Gone with a whimper."
		},
		Mission_Nautilus_BlastChargeExploded = {
			"Fulfilled its purpose."
		},
		Mission_Nautilus_RailLayerDamaged = {
			"The Rail Layer is damaged, but may be salvaged after the battle.",
		},
		Mission_Nautilus_RailLayerDestroyed = {
			"We no longer need to protect the Rail Layer.",
			"It's gone. Forget about it.",
		},
	},
	
	-- Bethany Jones
	Genius = {
		Mission_Nautilus_CrumblingReaction = {
			"Look out! It's falling down!",
			"It started to fall, stay in the center, #squad!",
		},
		Mission_Nautilus_ExcavatorDestroyed = {
			"No! We've lost the Excavator!",
			"Excavator unit's disabled!",
		},
		Mission_Nautilus_DrillerDestroyed = {
			"That Driller wasn't very durable.",
			"That Driller's scrap.",
		},
		Mission_Nautilus_BlastChargeDestroyed = {
			"That Blast Charge was destroyed without exploding."
		},
		Mission_Nautilus_BlastChargeExploded = {
			"That Blast Charge went boom."
		},
		Mission_Nautilus_RailLayerDamaged = {
			"That Excavator wasn't very durable.",
		},
		Mission_Nautilus_RailLayerDestroyed = {
			"That Excavator wasn't very durable.",
		},
	},
	
	-- Henry Kwan
	Hotshot = {
		Mission_Nautilus_CrumblingReaction = {
			"Not sure you noticed, but the ground is falling.",
			"Just follow me, I'll get us through this in one piece.",
		},
		Mission_Nautilus_ExcavatorDestroyed = {
			"Okay, who let the Excavator get destroyed?",
			"Did we really need that Excavator? We got this, #squad.",
		},
		Mission_Nautilus_DrillerDestroyed = {
			"That Driller wasn't very durable.",
			"That Driller's scrap.",
		},
		Mission_Nautilus_BlastChargeDestroyed = {
			"That Blast Charge was destroyed without exploding."
		},
		Mission_Nautilus_BlastChargeExploded = {
			"That Blast Charge went boom."
		},
		Mission_Nautilus_RailLayerDamaged = {
			"That Excavator wasn't very durable.",
		},
		Mission_Nautilus_RailLayerDestroyed = {
			"That Excavator wasn't very durable.",
		},
	},
	
	-- Chen Rong
	Leader = {
		Mission_Nautilus_CrumblingReaction = {
			"Watch your step, #squad. No sudden movements.",
			"Brace yourselves! The cave is collapsing!",
		},
		Mission_Nautilus_ExcavatorDestroyed = {
			"Excavator's been destroyed!",
			"We lost the Excavator unit",
		},
		Mission_Nautilus_DrillerDestroyed = {
			"That Driller wasn't very durable.",
			"That Driller's scrap.",
		},
		Mission_Nautilus_BlastChargeDestroyed = {
			"That Blast Charge was destroyed without exploding."
		},
		Mission_Nautilus_BlastChargeExploded = {
			"That Blast Charge went boom."
		},
		Mission_Nautilus_RailLayerDamaged = {
			"That Excavator wasn't very durable.",
		},
		Mission_Nautilus_RailLayerDestroyed = {
			"That Excavator wasn't very durable.",
		},
	},
	
	-- Isaac Jones
	Medic = {
		Mission_Nautilus_CrumblingReaction = {
			"T-this doesn't f-feel safe at all.",
			"We s-shouldn't be here. The c-c-cave is t-too unstable!",
		},
		Mission_Nautilus_ExcavatorDestroyed = {
			"Excavator's been d-d-destroyed!",
			"We've l-lost the Excavator!",
		},
		Mission_Nautilus_DrillerDestroyed = {
			"The D-driller's been d-destroyed!",
			"We've lost the D-driller!",
		},
		Mission_Nautilus_BlastChargeDestroyed = {
			"That B-blast Charge is disabled.",
			"The Blast Charge is d-defused.",
		},
		Mission_Nautilus_BlastChargeExploded = {
			"B-blast Charge exploded!",
			"That Blast Charge d-detonated!",
		},
		Mission_Nautilus_RailLayerDamaged = {
			"The Rail Layer d-doesn't look completely d-damaged. Maybe someone can repair it?",
			"The Rail Layer's d-d-damage isn't extensive, b-b-but it won't be moving for a while.",
		},
		Mission_Nautilus_RailLayerDestroyed = {
			"I d-d-don't think anything could repair that Rail Layer now.",
			"Not even a f-f-full Nautilus engineering team could repair that Rail Layer.",
		},
	},
	
	-- Silica
	Miner = {
		Mission_Nautilus_CrumblingReaction = {
			"Structural integrity of cave chamber compromised.",
			"Imminent collapse of cave system detected. Searching possible escape routes.",
		},
		Mission_Nautilus_ExcavatorDestroyed = {
			"Unauthorized destruction of Nautilus property detected.",
			"Nautilus Excavator destroyed.",
		},
		Mission_Nautilus_DrillerDestroyed = {
			"That Driller wasn't very durable.",
			"That Driller's scrap.",
		},
		Mission_Nautilus_BlastChargeDestroyed = {
			"That Blast Charge was destroyed without exploding."
		},
		Mission_Nautilus_BlastChargeExploded = {
			"That Blast Charge went boom."
		},
		Mission_Nautilus_RailLayerDamaged = {
			"That Excavator wasn't very durable.",
		},
		Mission_Nautilus_RailLayerDestroyed = {
			"That Excavator wasn't very durable.",
		},
	},
	
	-- Ralph Karlsson
	Original = {
		Mission_Nautilus_CrumblingReaction = {
			"Watch out, #squad! This damn thing is going down!",
			"The cave is collapsing, watch out #squad!",
		},
		Mission_Nautilus_ExcavatorDestroyed = {
			"Excavator's wrecked!",
			"Dammit! We lost our Excavator.",
		},
		Mission_Nautilus_DrillerDestroyed = {
			"That Driller wasn't very durable.",
			"That Driller's scrap.",
		},
		Mission_Nautilus_BlastChargeDestroyed = {
			"That Blast Charge was destroyed without exploding."
		},
		Mission_Nautilus_BlastChargeExploded = {
			"That Blast Charge went boom."
		},
		Mission_Nautilus_RailLayerDamaged = {
			"That Excavator wasn't very durable.",
		},
		Mission_Nautilus_RailLayerDestroyed = {
			"That Excavator wasn't very durable.",
		},
	},
	
	-- Prospero
	Recycler = {
		Mission_Nautilus_CrumblingReaction = {
			"Cave floor has partially collapsed due to unstable structural conditions.",
			"Cave partially collapsed. Increased seismic activity expected.",
		},
		Mission_Nautilus_ExcavatorDestroyed = {
			"Excavator unit has been recycled.",
			"Excavator unit recycled.",
		},
		Mission_Nautilus_DrillerDestroyed = {
			"That Driller wasn't very durable.",
			"That Driller's scrap.",
		},
		Mission_Nautilus_BlastChargeDestroyed = {
			"That Blast Charge was destroyed without exploding."
		},
		Mission_Nautilus_BlastChargeExploded = {
			"That Blast Charge went boom."
		},
		Mission_Nautilus_RailLayerDamaged = {
			"That Excavator wasn't very durable.",
		},
		Mission_Nautilus_RailLayerDestroyed = {
			"That Excavator wasn't very durable.",
		},
	},
	
	-- Harold Schmidt
	Repairman = {
		Mission_Nautilus_CrumblingReaction = {
			"I'm detecting multiple tremors... hold on!",
			"This is very unsafe. I hope Nautilus knows what it's doing.",
		},
		Mission_Nautilus_ExcavatorDestroyed = {
			"I... I could repair the Excavator, but the crew....",
			"Such a waste! The Excavator looks beyond repair.",
		},
		Mission_Nautilus_DrillerDestroyed = {
			"That Driller wasn't very durable.",
			"That Driller's scrap.",
		},
		Mission_Nautilus_BlastChargeDestroyed = {
			"That Blast Charge was destroyed without exploding."
		},
		Mission_Nautilus_BlastChargeExploded = {
			"That Blast Charge went boom."
		},
		Mission_Nautilus_RailLayerDamaged = {
			"That Excavator wasn't very durable.",
		},
		Mission_Nautilus_RailLayerDestroyed = {
			"That Excavator wasn't very durable.",
		},
	},
	
	-- Camila Vera
	Soldier = {
		Mission_Nautilus_CrumblingReaction = {
			"Commander, seismic readings are off the charts!",
			"The cave's trying to swallow us!",
		},
		Mission_Nautilus_ExcavatorDestroyed = {
			"Excavator's been destroyed, commander.",
			"Excavator's been lost, commander.",
		},
		Mission_Nautilus_DrillerDestroyed = {
			"That Driller wasn't very durable.",
			"That Driller's scrap.",
		},
		Mission_Nautilus_BlastChargeDestroyed = {
			"That Blast Charge was destroyed without exploding."
		},
		Mission_Nautilus_BlastChargeExploded = {
			"That Blast Charge went boom."
		},
		Mission_Nautilus_RailLayerDamaged = {
			"That Excavator wasn't very durable.",
		},
		Mission_Nautilus_RailLayerDestroyed = {
			"That Excavator wasn't very durable.",
		},
	},
	
	-- Gana
	Warrior = {
		Mission_Nautilus_CrumblingReaction = {
			"This cave system is losing structural integrity.",
			"Unsafe work conditions detected.",
		},
		Mission_Nautilus_ExcavatorDestroyed = {
			"Excavator's components have failed to defend it.",
			"Excavator's hull integrity has been found lacking.",
		},
		Mission_Nautilus_DrillerDestroyed = {
			"That Driller wasn't very durable.",
			"That Driller's scrap.",
		},
		Mission_Nautilus_BlastChargeDestroyed = {
			"That Blast Charge was destroyed without exploding."
		},
		Mission_Nautilus_BlastChargeExploded = {
			"That Blast Charge went boom."
		},
		Mission_Nautilus_RailLayerDamaged = {
			"That Excavator wasn't very durable.",
		},
		Mission_Nautilus_RailLayerDestroyed = {
			"That Excavator wasn't very durable.",
		},
	},
	
	-- Lily Reed
	Youth = {
		Mission_Nautilus_CrumblingReaction = {
			"Whoa, that chasm is HUGE! Better not get too close.",
			"Ground is shaking, guys!",
		},
		Mission_Nautilus_ExcavatorDestroyed = {
			"I think we just lost the Excavator.",
			"And there goes our Excavator."
		},
		Mission_Nautilus_DrillerDestroyed = {
			"I think we just lost the Driller.",
			"And there goes our Driller.",
		},
		Mission_Nautilus_BlastChargeDestroyed = {
			"Eh, no fun.",
			"No fireworks this time I guess.",
		},
		Mission_Nautilus_BlastChargeExploded = {
			"That Blast Charge went BOOM!",
			"Kapow! That's what I'm talking about!"
		},
		Mission_Nautilus_RailLayerDamaged = {
			"Looks like the Rail Layer's stopped... but at least it's not completely destroyed!",
		},
		Mission_Nautilus_RailLayerDestroyed = {
			"That things' next stop is the scrapyard... it's done for. Finito. Gone.",
		},
	},
	
	-- Kazaaakpleth
	Mantis = {
		Mission_Nautilus_CrumblingReaction = {
			"Kc'cht! Jjk!",
		},
		Mission_Nautilus_ExcavatorDestroyed = {
			"Tch'k; Jjk.",
		},
		Mission_Nautilus_DrillerDestroyed = {
			"Tch'k; Jjk.",
		},
		Mission_Nautilus_BlastChargeDestroyed = {
			"Tch'k; Jjk.",
		},
		Mission_Nautilus_BlastChargeExploded = {
			"Kc'cht! Jjk!",
		},
		Mission_Nautilus_RailLayerDamaged = {
			"Tch'k; Jjk.",
		},
		Mission_Nautilus_RailLayerDestroyed = {
			"Kc'cht! Jjk!",
		},
	},
	
	-- Adriane
	Rock = {
		Mission_Nautilus_CrumblingReaction = {
			":: NNN-HR! HrrrRNN! ::",
		},
		Mission_Nautilus_ExcavatorDestroyed = {
			":: Hnn? HnN! ::",
		},
		Mission_Nautilus_DrillerDestroyed = {
			":: Hnn? HnN! ::",
		},
		Mission_Nautilus_BlastChargeDestroyed = {
			":: Hnn? HnN! ::",
		},
		Mission_Nautilus_BlastChargeExploded = {
			":: NNN-HR! HrrrRNN! ::",
		},
		Mission_Nautilus_RailLayerDamaged = {
			":: Hnn? HnN! NNN-HR! ::",
		},
		Mission_Nautilus_RailLayerDestroyed = {
			":: NNN-HR! HrrrRNN! ::",
		},
	},
	
	-- Mafan
	Zoltan = {
		Mission_Nautilus_CrumblingReaction = {
			"\\ *::*:.*: //",
		},
		Mission_Nautilus_ExcavatorDestroyed = {
			"| .----. |",
		},
		Mission_Nautilus_DrillerDestroyed = {
			"| .----. |",
		},
		Mission_Nautilus_BlastChargeDestroyed = {
			"| .----. |",
		},
		Mission_Nautilus_BlastChargeExploded = {
			"\\ *::*:.*: //",
		},
		Mission_Nautilus_RailLayerDamaged = {
			"| .----. |",
		},
		Mission_Nautilus_RailLayerDestroyed = {
			"\\ *::*:.*: //",
		},
	},

	-- Kai
	Arrogant = {
		Mission_Nautilus_CrumblingReaction = {
			"Don't mind the shakes, nothing we can't handle.",
			"I can feel it in my teeth.",
		},
		Mission_Nautilus_ExcavatorDestroyed = {
			"Well that's a bust.",
			"Not ideal. Not ideal.",
		},
		Mission_Nautilus_DrillerDestroyed = {
			"Well that's a bust.",
			"Not ideal. Not ideal.",
		},
		Mission_Nautilus_BlastChargeDestroyed = {
			"Well that's a bust.",
			"Not ideal, but it works.",
		},
		Mission_Nautilus_BlastChargeExploded = {
			"This is almost fun, you know."
			"I can work with that."
		},
		Mission_Nautilus_RailLayerDamaged = {
			"Looks... salvageable?",
			"Rail Layer's almost done for. Almost.",
		},
		Mission_Nautilus_RailLayerDestroyed = {
			"Maybe they can sell it for scrap?",
			"That train had an even worse day than me!",
		},
	},

	-- Rosie
	Caretaker = {
		Mission_Nautilus_CrumblingReaction = {
			"We are losing ground! Literally.",
			"Oooh shake! Did the Earth move for you?!",
		},
		Mission_Nautilus_ExcavatorDestroyed = {
			"That Excavator may be done for, but we're not!",
			"That Excavator may be lost, but we keep fighting!",
		},
		Mission_Nautilus_DrillerDestroyed = {
			"That Driller wasn't very durable.",
			"That Driller's scrap.",
		},
		Mission_Nautilus_BlastChargeDestroyed = {
			"That Blast Charge was destroyed without exploding."
		},
		Mission_Nautilus_BlastChargeExploded = {
			"That Blast Charge went boom."
		},
		Mission_Nautilus_RailLayerDamaged = {
			"That Excavator wasn't very durable.",
		},
		Mission_Nautilus_RailLayerDestroyed = {
			"That Excavator wasn't very durable.",
		},
	},

	-- Morgan
	Chemical = {
		Mission_Nautilus_CrumblingReaction = {
			"At this rate we won't be up here for long.",
			"This is not looking good for the Vek. Or us.",
		},
		Mission_Nautilus_ExcavatorDestroyed = {
			"Excavator has been destroyed!",
			"Excavator is down!",
		},
		Mission_Nautilus_DrillerDestroyed = {
			"That Driller wasn't very durable.",
			"That Driller's scrap.",
		},
		Mission_Nautilus_BlastChargeDestroyed = {
			"That Blast Charge was destroyed without exploding."
		},
		Mission_Nautilus_BlastChargeExploded = {
			"That Blast Charge went boom."
		},
		Mission_Nautilus_RailLayerDamaged = {
			"That Excavator wasn't very durable.",
		},
		Mission_Nautilus_RailLayerDestroyed = {
			"That Excavator wasn't very durable.",
		},
	},

	-- Adam
	Delusional = {
		Mission_Nautilus_CrumblingReaction = {
			"The earth is trying to devour us!",
			"This cave doesn't scare me!",
		},
		Mission_Nautilus_ExcavatorDestroyed = {
			"We don't need that machine anyway!",
			"Feeble machine.",
		},
		Mission_Nautilus_DrillerDestroyed = {
			"That Driller wasn't very durable.",
			"That Driller's scrap.",
		},
		Mission_Nautilus_BlastChargeDestroyed = {
			"That Blast Charge was destroyed without exploding."
		},
		Mission_Nautilus_BlastChargeExploded = {
			"That Blast Charge went boom."
		},
		Mission_Nautilus_RailLayerDamaged = {
			"That Excavator wasn't very durable.",
		},
		Mission_Nautilus_RailLayerDestroyed = {
			"That Excavator wasn't very durable.",
		},
	}
}


-- AE pilots don't use the old method; have to make old-style personalities
local AEpilots = {
	"Chemical",
	"Arrogant",
	"Caretaker",
	"Delusional",
}

for _, personalityId in ipairs(AEpilots) do
	if not Personality[personalityId] then
		local personality = CreatePilotPersonality(personalityId)
		Personality[personalityId] = personality
		
	end
end

for personalityId, dialogTable in pairs(extraDialog) do
	Personality[personalityId]:AddDialogTable(dialogTable)
end



-- add barks for things being killed
local pawns = {
	NAH_Excavator = "Mission_Nautilus_ExcavatorDestroyed",
	NAH_Driller = "Mission_Nautilus_DrillerDestroyed",
	NAH_Blast_Charge = "Mission_Nautilus_BlastChargeDestroyed",
	Nautilus_Drilltrain_Pawn = "Mission_Nautilus_RailLayerDamaged",
	Nautilus_Drilltrain_Damaged = "Mission_Nautilus_RailLayerDestroyed",
}

local function onModsLoaded()
	modapiext:addPawnKilledHook(function(mission, pawn)
		local pawnType = pawn:GetType()
		
		local voice = pawns[pawnType]		
		if not voice then return end
		
		-- exceptions
		if pawnType == "NAH_Blast_Charge" and pawn:IsActive() and Game:GetTeamTurn() == TEAM_ENEMY then return end -- don't trigger for blastcharge skill
		
		-- dew it
		local chance = math.random()
		if chance > 0.5 then
			local fx = SkillEffect()
			fx:AddVoice(voice, -1)
			Board:AddEffect(fx)
		end
	end)
end

modApi.events.onModsLoaded:subscribe(onModsLoaded)