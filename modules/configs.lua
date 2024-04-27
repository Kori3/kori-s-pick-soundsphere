local imgui = require("imgui")
local just = require("just")

local function playfieldSettings(data)
    just.text("\n   Playfield")
    imgui.separator()
    data.barline = imgui.checkbox("barline", data.barline, "Show barline")
    data.litupreceptors = imgui.checkbox("litupreceptors", data.litupreceptors, "Light up receptors")
    --data.absolutebabymode = imgui.checkbox("absolutebabymode", data.absolutebabymode, "Activate Percy (useless for now)")
end

local function hudSettings(data)
    just.text("\n   HUD layout")
    imgui.separator()
    data.accalign = imgui.combo("accalign", data.accalign, {"left", "center", "right"}, nil, "Acc display position")
    data.hiterrorpos = imgui.combo("hiterrorpos", data.hiterrorpos, {"up", "middle", "down"}, nil, "Hit error position")
    data.judgesoffset = imgui.slider1("judgesoffset", data.judgesoffset, "%.0f", -50, 50, 1, "Combo/Judge pos offset")
    data.flipjudges = imgui.checkbox("flipjudges", data.flipjudges, "Flip judge/combo elements")
    data.hidemarv = imgui.checkbox("hidemarv", data.hidemarv, "Tryhard mode")
end

local mainConfig = {
    playfieldSettings = playfieldSettings,
	hudSettings = hudSettings,
}
return mainConfig