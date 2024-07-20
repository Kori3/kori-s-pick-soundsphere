local imgui = require("imgui")
local just = require("just")
--[[MAIN CONFIGS:
Playfield
true  - barline       - show barline
false - receptorlight - light up receptors
false - altln         - use alternative ln style (4K 7K ONLY)
-----
      - twothumbs     - use two twumbs layout (6K 8K ONLY)
false - bms           - use IIDX layout (7K1S ONLY)
right - scratchpos    - scratch side (1S LAYOUTS ONLY)
false - pms           - use popn music layout (9K ONLY)
false - linemid       - use middleline (10K RELATED STUFF ONLY)
false - dp            - use dp layout (10K+ STUFF ONLY NO DP)
false - alt8k         - use alternate colors for 8k columns (10K8K ONLY)
false - dpcol         - use light column colors for dp (DP LAYOUTS ONLY)

HUD Layout
left  - accpos        - Acc display position
up    - hitpos        - Hit error position
0     - judgesoff     - Combo / Judgement pos offset
false - flipjudges    - Flip Combo / Judgement elements
false - tryhard       - Tryhard judges
--]]
local function playfieldSettings(data)
    just.text("\n   Playfield")
    imgui.separator()
    data.barline = imgui.checkbox("barline", data.barline, "Show barline")
    data.receptorlight = imgui.checkbox("receptorlight", data.receptorlight, "Light up receptors")
end

local function hudSettings(data)
    just.text("\n   HUD layout")
    imgui.separator()
    data.accpos = imgui.combo("accpos", data.accpos, {"left", "center", "right"}, nil, "Acc display position")
    data.hitpos = imgui.combo("hitpos", data.hitpos, {"Up", "Middle", "Down"}, nil, "Hit error position")
    data.judgesoff = imgui.slider1("judgesoff", data.judgesoff, "%.0f", -50, 50, 1, "Combo/Judge pos offset")
    data.flipjudges = imgui.checkbox("flipjudges", data.flipjudges, "Flip judge/combo elements")
    data.tryhard = imgui.checkbox("tryhard", data.tryhard, "Tryhard mode")
end

local mainConfig = {
    playfieldSettings = playfieldSettings,
	hudSettings = hudSettings,
}
return mainConfig