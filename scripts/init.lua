
-- initialize mod
local mod = {
	id = "Nautilus",
	name = "Nautilus",
	description = "A subterranean mining operation plagued by Vek, helmed by a man who wants you gone - or else wants your technology. Will you answer the call? ",
	icon = "scripts/icon.png",
	dependencies = {
		modApiExt = "1.18",
		memedit = "1.0.2",
		easyEdit = "2.0.4",
	},
}

function mod:init()
	self.libs = {}
	self.libs.modApiExt = modapiext
	self.libs.weaponPreview = require(self.scriptPath.."libs/weaponPreview")
	self.libs.customAnim = require(mod.scriptPath.."libs/customAnim")

	require(mod.scriptPath.."libs/boardEvents")

	require(self.scriptPath.."island")
	require(self.scriptPath.."ceo/ceo")
	require(self.scriptPath.."corporation/pilot")
	require(self.scriptPath.."corporation/corporation")
	require(self.scriptPath.."tileset")
	require(self.scriptPath.."bossList")
	require(self.scriptPath.."enemyList")
	require(self.scriptPath.."structures")
	require(self.scriptPath.."structureList")
	require(self.scriptPath.."island_composite")
	require(self.scriptPath.."waterfall")
	require(self.scriptPath.."background")

	self.missions = require(self.scriptPath.."missions/init")
	self.missions:init(self)
end

function mod:load(options, version)

end

function mod:metadata()
	modApi:addGenerationOption(
		"Nautilus_CaveBackground",
		"Cave Background",
		"Check to turn on the cave background in each mission. Requires a restart.",
		{ enabled = true } --Change default later
	)
end

return mod
