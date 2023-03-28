
-- initialize mod
local mod = {
	id = "Nautilus",
	name = "Nautilus",
	description = "A subterranean mining operation plagued by Vek, helmed by a man who wants you gone - or else wants your technology. Will you answer the call? ",
	icon = "scripts/icon.png",
	dependencies = {"easyEdit"}
}

function mod:init()
	require(self.scriptPath.."island")
	require(self.scriptPath.."ceo/ceo")
	require(self.scriptPath.."corporation/pilot")
	require(self.scriptPath.."corporation/corporation")
	require(self.scriptPath.."tileset")
	require(self.scriptPath.."bossList")
	require(self.scriptPath.."enemyList")
	--require(self.scriptPath.."missionList") Move to /missions/init.lua
	require(self.scriptPath.."structures")
	require(self.scriptPath.."structureList")
	require(self.scriptPath.."island_composite")
	require(self.scriptPath .."waterfall")
	
	self.libs = {}
	--self.libs.modApiExt = modapiext
	self.libs.weaponPreview = require(self.scriptPath.."libs/weaponPreview")

	self.missions = require(self.scriptPath.."missions/init")
	self.missions:init(self)
end

function mod:load(options, version)

end

return mod
