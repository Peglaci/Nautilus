
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
	},
	
	-- AI generic
	Artificial = {
		Mission_Nautilus_CrumblingReaction = {
			"Alert: Cave collapsing",
		},
		Mission_Nautilus_ExcavatorDestroyed = {
			"Update: Excavator unit destroyed",
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
	},
	
	-- Ralph Karlsson
	Original = {
		Mission_Nautilus_CrumblingReaction = {
			"Watch out, #squad! This damn thing is going down!",
			"The cave is collapsing, whatch out #squad!",
		},
		Mission_Nautilus_ExcavatorDestroyed = {
			"Excavator's wrecked!",
			"Dammit! We lost our Excavator.",
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
	},
	
	-- Kazaaakpleth
	Mantis = {
		Mission_Nautilus_CrumblingReaction = {
			"Kc'cht! Jjk!",
		},
		Mission_Nautilus_ExcavatorDestroyed = {
			"Tch'k; Jjk.",
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
	},
	
	-- Mafan
	Zoltan = {
		Mission_Nautilus_CrumblingReaction = {
			"\\ *::*:.*: //",
		},
		Mission_Nautilus_ExcavatorDestroyed = {
			"| .----. |",
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
}

local function onModsLoaded()
	modapiext:addPawnKilledHook(function(mission, pawn)
		local pawnType = pawn:GetType()
		
		local voice = pawns[pawnType]		
		if not voice then return end
		
		local chance = math.random()
		if chance > 0.5 then
			local fx = SkillEffect()
			fx:AddVoice(voice, -1)
			Board:AddEffect(fx)
		end
	end)
end

modApi.events.onModsLoaded:subscribe(onModsLoaded)