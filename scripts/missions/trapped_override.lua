local mod = mod_loader.mods[modApi.currentMod]
local TILESET = "Nautilus_tileset_id"

modApi:appendAsset("img/units/mission/naut_trapped_1.png", mod.resourcePath .."img/units/mission/naut_trapped_1.png")
modApi:appendAsset("img/units/mission/naut_trapped_1d.png", mod.resourcePath .."img/units/mission/naut_trapped_1d.png")

local a = ANIMS

a.naut_trapped_bldg = a.trapped_bldg:new{Image = "units/mission/naut_trapped_1.png"}
a.naut_trapped_bldgd = a.trapped_bldgd:new{Image = "units/mission/naut_trapped_1d.png"}

local oldFunc = Mission_Trapped.StartMission

function Mission_Trapped:StartMission()
  oldFunc(self)
  if modApi:getCurrentTileset() == TILESET then
    for i, p in ipairs(Board) do
      local pawn = Board:GetPawn(p)
      if pawn and pawn:GetType() == "Trapped_Building" then
        Board:ClearSpace(p)
        Board:AddPawn("Naut_Trapped_Building",p)
      end
    end
  end
end

Naut_Trapped_Building = Trapped_Building:new{
  Image = "naut_trapped_bldg",
  SkillList = {"Naut_Trapped_Explode"}
}

Naut_Trapped_Explode = Trapped_Explode:new{
  TipImage = {
    Unit = Point(2,2),
    Target = Point(2,2),
    Building = Point(3,2),
    Enemy = Point(2,1),
    Enemy2 = Point(2,3),
    CustomPawn = "Naut_Trapped_Building"
  }
}
