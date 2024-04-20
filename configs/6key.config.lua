local JustConfig = require("sphere.JustConfig")
local imgui = require("imgui")
local just = require("just")
local config = JustConfig()
config.w = 600
config.h = 600
local root = (...):match("^(.+)/(.-)/(.-)$")

config.data = --[[data]] {
	accalign = "left",
	autosave = true,
	barline = false,
	flipjudges = false,
	hidemarv = false,
	hiterrorpos = "up",
	judgesoffset = 0,
	litupreceptors = false,
	twothumbs = false
} --[[/data]]

function config:draw(w, h)
	local data = self.data

	just.indent(15)
	just.text("10K skin configs\n\nPlayfield")
    imgui.setSize(w, h, w / 2, 55)
    imgui.separator()
    data.barline = imgui.checkbox("barline", data.barline, "Show barline")
    data.litupreceptors = imgui.checkbox("litupreceptors", data.litupreceptors, "Light up receptors")
    data.twothumbs = imgui.checkbox("twothumbs", data.twothumbs, "Use two thumbs layout")
    just.text("\n   HUD layout")
    imgui.separator()
    data.accalign = imgui.combo("accalign", data.accalign, {"left", "center", "right"}, nil, "Acc display position")
    data.hiterrorpos = imgui.combo("hiterrorpos", data.hiterrorpos, {"up", "middle", "down"}, nil, "Hit error position")
    data.judgesoffset = imgui.slider1("judgesoffset", data.judgesoffset, "%.0f", -50, 50, 1, "Combo/Judge pos offset")
    data.flipjudges = imgui.checkbox("flipjudges", data.flipjudges, "Flip judge/combo elements")
    data.hidemarv = imgui.checkbox("hidemarv", data.hidemarv, "Tryhard mode")
    just.text("\n   Save configs")
    imgui.separator()
	if imgui.button("Write config file", "Write") then
		self:write()
	end
    data.autosave = imgui.checkbox("autosave", data.autosave, "Autosave")
    just.text("   Skin by Kori :3")
end

return config