local root = (...):match("^(.+)/(.-)/(.-)$")
local JustConfig = require("sphere.JustConfig")

function theThing(noteskin, playfield, keycount)
    local mainposcombo = 1210
    local mainposjudge = 970
	local config = JustConfig:fromFile(root .. "/configs/"..keycount..".config.lua")
	local judgeoff = ((config:get("judgesoff") * -1) * 10)

    playfield:addDeltaTimeJudgement({
    	x = 0, y = (config:get("flipjudges") and mainposcombo or mainposjudge) + judgeoff, ox = 0.5, oy = 0.5,
    	rate = 1,
    	transform = playfield:newLaneCenterTransform(2080),
    	judgements = {
    		"judgements/miss.png",
    		-0.119,
    		"judgements/bad.png",
    		-0.089,
    		"judgements/ok.png",
    		-0.059,
    		"judgements/good.png",
    		-0.030,
    		config:get("tryhard") and "judgements/earlyperf.png" or "judgements/perf.png",
    		-0.016,
    		config:get("tryhard") and "judgements/blank.png" or "judgements/marv.png",
    		-0.007,
    		config:get("tryhard") and "judgements/blank.png" or "judgements/marvplus.png",
    		0.007,
    		config:get("tryhard") and "judgements/blank.png" or "judgements/marv.png",
    		0.016,
    		config:get("tryhard") and "judgements/lateperf.png" or "judgements/perf.png",
    		0.030,
    		"judgements/good.png",
    		0.059,
    		"judgements/ok.png",
    		0.089,
    		"judgements/bad.png",
    		0.119,
    		"judgements/miss.png"
    	}
    	-- matches stepmania judge 6 except for extra marv timing window
    })

    playfield:addCombo({
    	x = -539,
    	baseline = (config:get("flipjudges") and mainposjudge or mainposcombo) + judgeoff,
    	limit = 1080,
    	align = "center",
    	font = {
    		filename = root .. "/stuff/wendy.ttf",
    		size = 140
    	},
    	transform = playfield:newLaneCenterTransform(2080),
    	color = {1, 1, 1, 1},
    })

    playfield:addBaseProgressBar()

    local cc = noteskin.columnsCount

    playfield:addHpBar({
    	x = noteskin.width[cc] * (cc * 0.91) - cc,
    	sx = 1920 / 1080 * 0.7,
    	y = 1300,
    	w = 20,
    	h = 600,
    	transform = playfield:newLaneCenterTransform(1920, 1080),
    	color = {1, 1, 1, 1},
    	direction = "down-up",
    })

    local hiterrorloc = {
    	Up = 20,
    	Middle = 520,
    	Down = 1040,
    }
    --[[
    	extra marv 	= 1, 1, 1, 0.5
    	marv 		= 0.65, 0.92, 0.91, 0.5
    	perf		= 0.88, 0.85, 0.411, 0.5
    	good		= 0.05, 0.7, 0.152, 0.5
    	ok			= 0.55, 0.05, 0.7, 0.5
    	bad 		= 0.7, 0.05, 0.05, 0.5
    	miss		= 0.45, 0.45, 0.45, 0.5
    --]]
    local function hitcolor(value, unit)
        if value < -0.119 then
            return {0.45, 0.45, 0.45, 0.5}
        elseif value < -0.089 then
            return {0.7, 0.05, 0.05, 0.5}
        elseif value < -0.059 then
            return {0.55, 0.05, 0.7, 0.5}
    	elseif value < -0.030 then
            return {0.05, 0.7, 0.152, 0.5}
        elseif value < -0.016 then
            return {0.88, 0.85, 0.411, 0.5}
        elseif value < -0.007 then
            return {0.65, 0.92, 0.91, 0.5}
        elseif value <= 0.007 then
            return {1, 1, 1, 0.5}
        elseif value <= 0.016 then
            return {0.65, 0.92, 0.91, 0.5}
    	elseif value <= 0.030 then
            return {0.88, 0.85, 0.411, 0.5}
        elseif value <= 0.059 then
            return {0.05, 0.7, 0.152, 0.5}
        elseif value <= 0.089 then
            return {0.55, 0.05, 0.7, 0.5}
        elseif value <= 0.119 then
            return {0.7, 0.05, 0.05, 0.5}
        else
            return {0.45, 0.45, 0.45, 0.5}
        end
    end

    playfield:addHitError({
        transform = playfield:newLaneCenterTransform(playfield.noteskin.unit),
        x = 0,
        y = hiterrorloc[config:get("hitpos")],
        w = 432,
        h = 30,
        origin = {
            w = 2,
            h = 30,
            color = {1, 1, 1, 1}
        },
        background = {
            color = {0, 0, 0, 0}
        },
        unit = 0.12,
    	color = hitcolor,
        radius = 2,
        count = 20,
    })

    playfield:addScore({
    	x = 12,
    	baseline = 52,
    	limit = 1906,
    	align = "right",
    	font = {
    		filename = root.."/stuff/wendy.ttf",
    		size = 80,
    	},
    	transform = playfield:newTransform(1920, 1080, "right"),
    })

    local accoffsetpos = {
    	Left = 10,
    	Center = 0,
    	Right = 5,
    }

    playfield:addAccuracy({
    	x = accoffsetpos[config:get("accpos")],
    	baseline = config:get("accpos") == "Right" and 90 or 50,
    	limit = 1905,
    	align = config:get("accpos"),
    	font = {
    		filename = root.."/stuff/wendy.ttf",
    		size = config:get("accpos") == "Center" and 60 or 80,
    	},
    	transform = playfield:newTransform(1920, 1080, "Right"),
    })
end

local functions = {
	theThing = theThing,
}

return functions