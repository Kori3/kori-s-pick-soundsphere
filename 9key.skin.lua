local NoteSkinVsrg = require("sphere.models.NoteSkinModel.NoteSkinVsrg")
local BasePlayfield = require("sphere.models.NoteSkinModel.BasePlayfield")
local ImageView = require("sphere.views.ImageView")
local JustConfig = require("sphere.JustConfig")
local root = (...):match("(.+)/.-")
local config = JustConfig:fromFile(root .. "/configs/9key.config.lua")

local noteskin = NoteSkinVsrg({
    path = ...,
	name = "Kori's Pick",
	inputMode = "9key",
	range = {-1, 1},
	unit = 1080,
    config = config,
	hitposition = 1059,
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
})

noteskin:setColumns({
	offset = 0,
	align = "center",
	width = {114, 114, 114, 114, 114, 114, 114, 114, 114},
	space = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
})

noteskin:setTextures({
	{pixel = "pixel.png"},
    {nwhite = "note/NOTwhite.png"},
    {nblue  = "note/NOTblue.png"},
    {nyellow = "note/NOTyellow.png"},
    {ngreen = "note/NOTgreen.png"},
	{nred = "note/NOTred.png"},
    {bwhite =  "note/LNBwhite.png"},
    {bblue = "note/LNBblue.png"},
    {byellow = "note/LNByellow.png"},
    {bgreen = "note/LNBgreen.png"},
	{bred = "note/LNBred.png"},
})

noteskin:setImagesAuto()

noteskin:setShortNote({
	image = {
		config:get("pms") and "nwhite" or "ngreen",
		config:get("pms") and "nyellow" or "nwhite",
		config:get("pms") and "ngreen" or "nblue",
		config:get("pms") and "nblue" or "nwhite",
        config:get("pms") and "nred" or "nyellow",
        config:get("pms") and "nblue" or "nwhite",
        config:get("pms") and "ngreen" or "nblue",
        config:get("pms") and "nyellow" or "nwhite",
        config:get("pms") and "nwhite" or "ngreen",
	},
	h = 97,
})

noteskin:setLongNote({
	head = {
		config:get("pms") and "nwhite" or "ngreen",
		config:get("pms") and "nyellow" or "nwhite",
		config:get("pms") and "ngreen" or "nblue",
		config:get("pms") and "nblue" or "nwhite",
        config:get("pms") and "nred" or "nyellow",
        config:get("pms") and "nblue" or "nwhite",
        config:get("pms") and "ngreen" or "nblue",
        config:get("pms") and "nyellow" or "nwhite",
        config:get("pms") and "nwhite" or "ngreen",
	},
	body = {
		config:get("pms") and "bwhite" or "bgreen",
		config:get("pms") and "byellow" or "bwhite",
		config:get("pms") and "bgreen" or "bblue",
		config:get("pms") and "bblue" or "bwhite",
        config:get("pms") and "bred" or "byellow",
        config:get("pms") and "bblue" or "bwhite",
        config:get("pms") and "bgreen" or "bblue",
        config:get("pms") and "byellow" or "bwhite",
        config:get("pms") and "bwhite" or "bgreen",
	},
	tail = {
		config:get("pms") and "nwhite" or "ngreen",
		config:get("pms") and "nyellow" or "nwhite",
		config:get("pms") and "ngreen" or "nblue",
		config:get("pms") and "nblue" or "nwhite",
        config:get("pms") and "nred" or "nyellow",
        config:get("pms") and "nblue" or "nwhite",
        config:get("pms") and "ngreen" or "nblue",
        config:get("pms") and "nyellow" or "nwhite",
        config:get("pms") and "nwhite" or "ngreen",
	},
	h = 97,
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
	h = 115,
	padding = 0,
	pressed = {
		config:get("litupreceptors") and "key/scale3lit.png" or "key/scale3.png",
		config:get("litupreceptors") and "key/scale3lit.png" or "key/scale3.png",
		config:get("litupreceptors") and "key/scale3lit.png" or "key/scale3.png",
		config:get("litupreceptors") and "key/scale3lit.png" or "key/scale3.png",
        config:get("litupreceptors") and "key/scale3lit.png" or "key/scale3.png",
		config:get("litupreceptors") and "key/scale3lit.png" or "key/scale3.png",
		config:get("litupreceptors") and "key/scale3lit.png" or "key/scale3.png",
        config:get("litupreceptors") and "key/scale3lit.png" or "key/scale3.png",
		config:get("litupreceptors") and "key/scale3lit.png" or "key/scale3.png",
	},
	released = {
		"key/scale3.png",
		"key/scale3.png",
		"key/scale3.png",
		"key/scale3.png",
        "key/scale3.png",
		"key/scale3.png",
		"key/scale3.png",
        "key/scale3.png",
		"key/scale3.png",
	},
})

playfield:addNotes()

playfield:disableCamera()

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

playfield:addHpBar({
	x = 540,
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