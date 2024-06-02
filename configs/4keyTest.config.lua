local JustConfig = require("sphere.JustConfig")
local imgui = require("imgui")
local just = require("just")
local config = JustConfig()
config.w = 600
config.h = 600
local root = (...):match("^(.+)/(.-)/(.-)$")

-- note: dont delete the data block comments
config.data = --[[data]] {
	accpos = "left",
	altln = false,
	autosave = true,
	babymode = false,
	barline = true,
	flipjudges = false,
	hitpos = "Up",
	judgesoff = 0,
	receptorlight = false,
	timingLevel = "",
	timinggame = "Osu",
	tryhard = false
} --[[/data]]


function config:draw(w, h)
	local data = self.data

	just.indent(15)
	just.text("4K test")
    imgui.setSize(w, h, w / 2, 55)
    
    just.text("\n   Playfield")
    imgui.separator()
    data.barline = imgui.checkbox("barline", data.barline, "Show barline")
    data.receptorlight = imgui.checkbox("receptorlight", data.receptorlight, "Light up receptors")
    data.timinggame = imgui.combo("timinggame", data.timinggame, {"Osu", "Quaver", "Stepmania", "LunaticRave2"}, nil, "Judgement display")
    --data.babymode = imgui.checkbox("babymode", data.babymode, "Activate Percy (useless for now)")

	data.altln = imgui.checkbox("altln", data.altln, "Use alternative LN Style")
    
    just.text("\n   HUD layout")
    imgui.separator()
    data.accpos = imgui.combo("accpos", data.accpos, {"left", "center", "right"}, nil, "Acc display position")
    data.hitpos = imgui.combo("hitpos", data.hitpos, {"Up", "Middle", "Down"}, nil, "Hit error position")
    data.judgesoff = imgui.slider1("judgesoff", data.judgesoff, "%.0f", -50, 50, 1, "Combo/Judge pos offset")
    data.flipjudges = imgui.checkbox("flipjudges", data.flipjudges, "Flip judge/combo elements")
    data.tryhard = imgui.checkbox("tryhard", data.tryhard, "Tryhard mode")

    just.text("\n   Save configs")
    imgui.separator()
	if imgui.button("Write config file", "Write") then
		self:write()
	end
    data.autosave = imgui.checkbox("autosave", data.autosave, "Autosave")
    just.text("   Skin by Kori :3")
end

return config