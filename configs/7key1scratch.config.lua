local JustConfig = require("sphere.JustConfig")
local imgui = require("imgui")
local just = require("just")
local config = JustConfig()
config.w = 600
config.h = 600
local root = (...):match("^(.+)/(.-)/(.-)$")
local mainConfig = require(root .. "/Modules/configs")

config.data = --[[data]] {
	autosave = true,
	
	barline = false,
	receptorlight = false,
	bms = false,
	scratchpos = "Right",

	accpos = "Left",
	hitpos = "Up",
	judgesoff = 0,
	flipjudges = false,
	tryhard = false,
} --[[/data]]

function config:draw(w, h)
	local data = self.data

	just.indent(15)
	just.text("7K1S skin configs")
    imgui.setSize(w, h, w / 2, 55)
    
    mainConfig.playfieldSettings(data)
	data.bms = imgui.checkbox("bms", data.bms, "Use IIDX columns layout")
    data.scratchpos = imgui.combo("scratchpos", data.scratchpos, {"Left", "Right"}, nil, "Scratch side")
    mainConfig.hudSettings(data)

    just.text("\n   Save configs")
    imgui.separator()
	if imgui.button("Write config file", "Write") then
		self:write()
	end
    data.autosave = imgui.checkbox("autosave", data.autosave, "Autosave")
	just.text("barline and health bar are broken in scratch modes lol sry")
    just.text("   Skin by Kori :3")
end

return config