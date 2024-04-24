--[[To add:
Toggle for 9K9K EZ2DP and 10K8K
that--]]
local NoteSkinVsrg = require("sphere.models.NoteSkinModel.NoteSkinVsrg")
local BasePlayfield = require("sphere.models.NoteSkinModel.BasePlayfield")
local ImageView = require("sphere.views.ImageView")
local JustConfig = require("sphere.JustConfig")
local root = (...):match("(.+)/.-")
local config = JustConfig:fromFile(root .. "/configs/18key.config.lua")

local noteskin = NoteSkinVsrg({
    path = ...,
	name = "Kori's Pick",
	inputMode = "18key",
	range = {-1, 1},
	unit = 1080,
	config = config,
	hitposition = 1065,
})

local playfield = BasePlayfield(noteskin)

noteskin:setInput({
	"key1",
	"key2",
	"key3",
	"key4",
    "key5",
    "key6",
    "key7",
    "key8",
    "key9",
    "key10",
    "key11",
    "key12",
    "key13",
    "key14",
    "key15",
    "key16",
    "key17",
    "key18",
})

noteskin:setColumns({
	offset = 0,
	align = "center",
	width = {76, 76, 76, 76, 76, 76, 76, 76, 76, 76, 76, 76, 76, 76, 76, 76, 76, 76},
	space = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
})

noteskin:setTextures({
	{pixel = "pixel.png"},
    {nwhite  = "note/NOTwhite.png"},
    {nblue   = "note/NOTblue.png"},
    {norange = "note/NOTorange.png"},
	{ngreen  = "note/NOTgreen.png"},
    {bwhite  = "note/LNBwhite.png"},
    {bblue   = "note/LNBblue.png"},
    {borange = "note/LNBorange.png"},
	{bgreen  = "note/LNBgreen.png"},
})

noteskin:setImagesAuto()

noteskin:setShortNote({
	image = {
		"ngreen",
		"nwhite",
		"nblue",
		"nwhite",

		"ngreen",
		"nwhite",
		"nblue",
		"nwhite",
		"nyellow",
        "norange",
        "nwhite",
        "nblue",
        "nwhite",
		"ngreen",

        "nwhite",
        "nblue",
        "nwhite",
		"ngreen",
	},
	h = 64,
})

noteskin:setLongNote({
	head = {
		"ngreen",
		"nwhite",
		"nblue",
		"nwhite",

		"ngreen",
		"nwhite",
		"nblue",
		"nwhite",
		"nyellow",
        "norange",
        "nwhite",
        "nblue",
        "nwhite",
		"ngreen",

        "nwhite",
        "nblue",
        "nwhite",
		"ngreen",
	},
	body = {
		"bgreen",
		"bwhite",
		"bblue",
		"bwhite",

		"bgreen",
		"bwhite",
		"bblue",
		"bwhite",
		"byellow",
        "borange",
        "bwhite",
        "bblue",
        "bwhite",
		"bgreen",

        "bwhite",
        "bblue",
        "bwhite",
		"bgreen",
	},
	tail = {
		"ngreen",
		"nwhite",
		"nblue",
		"nwhite",

		"ngreen",
		"nwhite",
		"nblue",
		"nwhite",
		"nyellow",
        "norange",
        "nwhite",
        "nblue",
        "nwhite",
		"ngreen",

        "nwhite",
        "nblue",
        "nwhite",
		"ngreen",
	},
	h = 64,
})

if config:get("barline") == true then
	noteskin:addMeasureLine({
		h = 2,
		color = {1, 1, 1, 0.2},
		image = "pixel",
	})
end

noteskin:addBga({
	x = 0,
	y = 0,
	w = 1,
	h = 1,
	color = {0.25, 0.25, 0.25, 1},
})

playfield:addColumnsBackground({
	color = {0, 0, 0, 1},
})

playfield:addBga({
	transform = {{1 / 2, -16 / 9 / 2}, {0, -7 / 9 / 2}, 0, {0, 16 / 9}, {0, 16 / 9}, 0, 0, 0, 0},
})

playfield:enableCamera()

playfield:addKeyImages({
	h = 78,
	padding = 0,
	pressed = {
		"key/scale6.png",
		"key/scale6.png",
		"key/scale6.png",
		"key/scale6.png",
        "key/scale6.png",
		"key/scale6.png",
		"key/scale6.png",
		"key/scale6.png",
        "key/scale6.png",
		"key/scale6.png",
        "key/scale6.png",
        "key/scale6.png",
		"key/scale6.png",
		"key/scale6.png",
		"key/scale6.png",
		"key/scale6.png",
        "key/scale6.png",
        "key/scale6.png",
	},
	released = {
		"key/scale6.png",
		"key/scale6.png",
		"key/scale6.png",
		"key/scale6.png",
        "key/scale6.png",
		"key/scale6.png",
		"key/scale6.png",
		"key/scale6.png",
        "key/scale6.png",
		"key/scale6.png",
        "key/scale6.png",
        "key/scale6.png",
		"key/scale6.png",
		"key/scale6.png",
		"key/scale6.png",
		"key/scale6.png",
        "key/scale6.png",
        "key/scale6.png",
	},
})

playfield:addNotes()

playfield:disableCamera()

local function drawcolline(column, alpha)
	playfield:add(ImageView({
		x = playfield.noteskin.columns[column],
		y = 0,
		w = 2,
		h = noteskin.unit,
		image = "pixel.png",
		color = {1, 1, 1, alpha},
		transform = playfield:newNoteskinTransform(),
	}))
end

drawcolline(5, 0.2)
drawcolline(15, 0.2)
if config:get("middleline") then
	playfield:addGuidelines({
        y = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        w = {0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		h = {0, 0, 0, 0, 0, 0, 0, 0, 0, noteskin.hitposition, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		image = "pixel.png",
		color = {1, 1, 1, 0.2},
		both = false,
		mode = "default",
	})
end


local mainposcombo = 1210
local mainposjudge = 970
local judgeoff = ((config:get("judgesoffset") * -1) * 10)

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
        config:get("hidemarv") and "judgements/earlyperf.png" or "judgements/perf.png",
		-0.016,
		config:get("hidemarv") and "judgements/blank.png" or "judgements/marv.png",
		-0.007,
		config:get("hidemarv") and "judgements/blank.png" or "judgements/marvplus.png",
		0.007,
		config:get("hidemarv") and "judgements/blank.png" or "judgements/marv.png",
		0.016,
		config:get("hidemarv") and "judgements/lateperf.png" or "judgements/perf.png",
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
	x = -536,
	baseline = (config:get("flipjudges") and mainposjudge or mainposcombo) + judgeoff,
	limit = 1080,
	align = "center",
	font = {
		filename = root .. "/stuff/wendy.ttf",
		size = 70
	},
	transform = playfield:newLaneCenterTransform(1080),
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
	up = 20,
	middle = 520,
	down = 1040,
}

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
    y = hiterrorloc[config:get("hiterrorpos")],
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
	left = 10,
	center = 0,
	right = 5,
}

playfield:addAccuracy({
	x = accoffsetpos[config:get("accalign")],
	baseline = config:get("accalign") == "right" and 90 or 50,
	limit = 1905,
	align = config:get("accalign"),
	font = {
		filename = root.."/stuff/wendy.ttf",
		size = config:get("accalign") == "center" and 60 or 80,
	},
	transform = playfield:newTransform(1920, 1080, "right"),
})

return noteskin