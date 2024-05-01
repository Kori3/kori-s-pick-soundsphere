local JustConfig = require("sphere.JustConfig")
local imgui = require("imgui")
local just = require("just")
local config = JustConfig()
config.w = 600
config.h = 600
local root = (...):match("^(.+)/(.-)/(.-)$")
local mainConfig = require(root .. "/Modules/configs")

-- note: dont delete the data block comments
config.data = --[[data]] {
	accpos = "Left",
	autosave = true,
	barline = false,
	flipjudges = false,
	hitpos = "Up",
	judgesoff = 0,
	pms = false,
	receptorlight = false,
	tryhard = false
} --[[/data]]

function config:draw(w, h)
	local data = self.data

	just.indent(15)
	just.text("9K skin configs")
    imgui.setSize(w, h, w / 2, 55)

    mainConfig.playfieldSettings(data)
    data.pms = imgui.checkbox("pms", data.pms, "Use Pop'n Music layout")
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