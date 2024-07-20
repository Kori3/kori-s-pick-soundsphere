local JustConfig = require("sphere.JustConfig")
local imgui = require("imgui")
local just = require("just")
local config = JustConfig()
config.w = 600
config.h = 600
local root = (...):match("^(.+)/(.-)/(.-)$")
local mainConfig = require(root .. "/Modules/configs")

config.data = --[[data]] {
	accpos = "left",
	altln = false,
	autosave = true,
	babymode = false,
	barline = true,
	flipjudges = false,
	handicap = false,
	handicapside = "Right",
	hitpos = "Up",
	judgesoff = 0,
	receptorlight = false,
	tryhard = false
} --[[/data]]

function config:draw(w, h)
	local data = self.data

	just.indent(15)
	just.text("7K skin configs")
    imgui.setSize(w, h, w / 2, 55)
    
    mainConfig.playfieldSettings(data)
	data.altln = imgui.checkbox("altln", data.altln, "Use alternative LN Style")
	data.handicap = imgui.checkbox("handicap", data.handicap, "Handicap mode")
    if data.handicap then data.handicapside = imgui.combo("handicapside", data.handicapside, {"Left", "Right"}, nil, "Middle finger side") end
    mainConfig.hudSettings(data)

    just.text("\n   Save configs")
    imgui.separator()
	if imgui.button("Write config file", "Write") then
		self:write()
	end
    data.autosave = imgui.checkbox("autosave", data.autosave, "Autosave")
    just.text("   Skin by Kori :3")
end

return config