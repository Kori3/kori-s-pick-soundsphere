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
	autosave = true,
	
	barline = false,
	receptorlight = false,
	linemid = false,
	alt8k = false,

	accpos = "left",
	hitpos = "Up",
	judgesoff = 0,
	flipjudges = false,
	tryhard = false,
} --[[/data]]

function config:draw(w, h)
	local data = self.data

	just.indent(15)
	just.text("10K8K skin configs")
    imgui.setSize(w, h, w / 2, 55)
    
    mainConfig.playfieldSettings(data)
    data.middleline = imgui.checkbox("linemid", data.middleline, "Display middle line") -- yes i stole this one from absolute-zero
	data.alt8k = imgui.checkbox("alt8k", data.alt8k, "Use alt column colors for 8K columns")
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