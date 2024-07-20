local root = (...):match("^(.+)/(.-)/(.-)$")
local JustConfig = require("sphere.JustConfig")
local ImageProgressView = require("sphere.views.GameplayView.ImageProgressView")

function theThing(noteskin, playfield, keycount, columns)
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
    		-0.151,
    		"judgements/bad.png",
    		-0.113,
    		"judgements/ok.png",
    		-0.076,
    		"judgements/good.png",
    		-0.038,
    		config:get("tryhard") and "judgements/earlyperf.png" or "judgements/perf.png",
    		-0.018,
    		config:get("tryhard") and "judgements/blank.png" or "judgements/marv.png",
    		-0.0115,
    		config:get("tryhard") and "judgements/blank.png" or "judgements/marvplus.png",
    		0.0115,
    		config:get("tryhard") and "judgements/blank.png" or "judgements/marv.png",
    		0.018,
    		config:get("tryhard") and "judgements/lateperf.png" or "judgements/perf.png",
    		0.038,
    		"judgements/good.png",
    		0.076,
    		"judgements/ok.png",
    		0.113,
    		"judgements/bad.png",
    		0.151,
    		"judgements/miss.png"
    	}
    	-- timing windows match stepmania judge 5
		-- marvelous plus matches osu's 300g with hard rock
    })

    playfield:addCombo({
    	x = -531,
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

    playfield:addProgressBar({
			x = 0,
			y = 1070,
			w = 1920,
			h = 6,
			color = {1, 1, 1, 1},
			transform = playfield:newFullTransform(1920, 1080),
			direction = "left-right",
			mode = "+"
	})

    local cc = columns
	playfield:addHpBar(ImageProgressView({
		x = noteskin.width[noteskin.columnsCount] * (cc * 0.91) - cc,
		y = 990,
		transform = playfield:newLaneCenterTransform(1920, 1080),
		direction = "down-up",
		mode = "+",
		image = root.."/stuff/hp.png",
	}))
    local hiterrorloc = {
		Up = 36,
		Middle = 547,
		Down = 1040,
    }
    --[[
    	marv plus 	= 0.65, 0.92, 0.91, 0.5
    	marv 		= 1, 1, 1, 0.5
    	perf		= 0.88, 0.85, 0.411, 0.5
    	good		= 0.05, 0.7, 0.152, 0.5
    	ok			= 0.55, 0.05, 0.7, 0.5
    	bad 		= 0.7, 0.05, 0.05, 0.5
    	miss		= 0.45, 0.45, 0.45, 0.5
    --]]
    local function hitcolor(value, unit)
        if value < -0.151 then
            return {0.45, 0.45, 0.45, 0.5} -- miss
        elseif value < -0.113 then
            return {0.7, 0.05, 0.05, 0.5}  -- bad
        elseif value < -0.076 then
            return {0.55, 0.05, 0.7, 0.5}  -- ok
    	elseif value < -0.038 then
            return {0.05, 0.7, 0.152, 0.5} -- good
        elseif value < -0.018 then
            return {0.88, 0.85, 0.411, 0.5} -- perf
        elseif value < -0.0115 then
            return {1, 1, 1, 0.5}  -- marv
        elseif value <= 0.0115 then
            return {0.65, 0.92, 0.91, 0.5} -- marv plus
        elseif value <= 0.018 then
            return {1, 1, 1, 0.5} -- marv
    	elseif value <= 0.038 then
            return {0.88, 0.85, 0.411, 0.5} -- perf
        elseif value <= 0.076 then
            return {0.05, 0.7, 0.152, 0.5} -- good
        elseif value <= 0.113 then
            return {0.55, 0.05, 0.7, 0.5} -- ok
        elseif value <= 0.151 then
            return {0.7, 0.05, 0.05, 0.5} -- bad
        else
            return {0.45, 0.45, 0.45, 0.5} -- miss
        end
    end

    playfield:addHitError({
		transform = playfield:newLaneCenterTransform(playfield.noteskin.unit),
		x = 0,
		y = hiterrorloc[config:get("hitpos")],
		w = 432,
		h = 25,
		origin = {
			w = 2,
			h = 25,
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
    	left = 10,
    	center = 0,
    	right = 5,
    }

    playfield:addAccuracy({
    	x = accoffsetpos[config:get("accpos")],
    	baseline = config:get("accpos") == "right" and 90 or 50,
    	limit = 1905,
    	align = config:get("accpos"),
    	font = {
    		filename = root.."/stuff/wendy.ttf",
    		size = config:get("accpos") == "center" and 60 or 80,
    	},
    	transform = playfield:newTransform(1920, 1080, "right"),
    })
end

local functions = {
	theThing = theThing,
}

return functions