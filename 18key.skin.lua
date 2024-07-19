local NoteSkinVsrg = require("sphere.models.NoteSkinModel.NoteSkinVsrg")
local BasePlayfield = require("sphere.models.NoteSkinModel.BasePlayfield")
local ImageView = require("sphere.views.ImageView")
local JustConfig = require("sphere.JustConfig")
local root = (...):match("(.+)/.-")
local config = JustConfig:fromFile(root .. "/configs/18key.config.lua")
local sphereElements = require(root .. "/Modules/SphereElements")

local noteskin = NoteSkinVsrg({
    path = ...,
	name = "Kori's Pick - 10K8K",
	inputMode = "18key",
	range = {-1, 1},
	unit = 1080,
	config = config,
	hitposition = 1065,
})

local playfield = BasePlayfield(noteskin)

noteskin:setInput({"key1","key2","key3","key4","key5","key6","key7","key8","key9","key10","key11","key12","key13","key14","key15","key16","key17","key18"})
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
noteskin:setShortNote({h = 64,
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
})

noteskin:setLongNote({h = 64,
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
})

if config:get("barline") == true then
	noteskin:addMeasureLine({h = 2,
		color = {1, 1, 1, 0.2},
		image = "pixel",
	})
end

noteskin:addBga({x = 0, y = 0, w = 1, h = 1,
	color = {0.25, 0.25, 0.25, 1},
})

playfield:addBga({
	transform = {{1 / 2, -16 / 9 / 2}, {0, -7 / 9 / 2}, 0, {0, 16 / 9}, {0, 16 / 9}, 0, 0, 0, 0},
})

playfield:addColumnsBackground({
	color = {0, 0, 0, 1},
})

playfield:enableCamera()
playfield:addKeyImages({h = 78,
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
if config:get("linemid") then
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

sphereElements.theThing(noteskin, playfield, noteskin.inputMode, noteskin.columnsCount)

return noteskin