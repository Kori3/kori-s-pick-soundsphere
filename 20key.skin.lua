local NoteSkinVsrg = require("sphere.models.NoteSkinModel.NoteSkinVsrg")
local BasePlayfield = require("sphere.models.NoteSkinModel.BasePlayfield")
local ImageView = require("sphere.views.ImageView")
local JustConfig = require("sphere.JustConfig")
local root = (...):match("(.+)/.-")
local config = JustConfig:fromFile(root .. "/configs/20key.config.lua")
local sphereElements = require(root .. "/Modules/SphereElements")

local noteskin = NoteSkinVsrg({
    path = ...,
	name = "Kori's Pick",
	inputMode = "20key",
	range = {-1, 1},
	unit = 1080,
	config = config,
	hitposition = 1065,
})

local playfield = BasePlayfield(noteskin)

noteskin:setInput({"key1","key2","key3","key4","key5","key6","key7","key8","key9","key10","key11","key12","key13","key14","key15","key16","key17","key18","key19","key20"})

noteskin:setColumns({
	offset = 0,
	align = "center",
	width = {76, 76, 76, 76, 76, 76, 76, 76, 76, 76, 76, 76, 76, 76, 76, 76, 76, 76, 76, 76},
	space = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
})

noteskin:setTextures({
	{pixel = "pixel.png"},
    {nwhite  = "note/NOTwhite.png"},
    {nblue   = "note/NOTblue.png"},
    {norange = "note/NOTorange.png"},
    {npink   = "note/NOTpink.png"},
    {bwhite  = "note/LNBwhite.png"},
    {bblue   = "note/LNBblue.png"},
    {borange = "note/LNBorange.png"},
    {bpink   = "note/LNBpink.png"},
})

noteskin:setImagesAuto()
noteskin:setShortNote({
	image = {
        "norange",
		"nwhite",
		"nblue",
		"nwhite",
		"nblue",
		"nwhite",
		"nblue",
		"nwhite",

        "npink",
        "npink",
        "npink",
        "npink",

		"nwhite",
		"nblue",
		"nwhite",
		"nblue",
		"nwhite",
		"nblue",
		"nwhite",
        "norange",
	},
	h = 64,
})

noteskin:setLongNote({
	head = {
        "norange",
		"nwhite",
		"nblue",
		"nwhite",
		"nblue",
		"nwhite",
		"nblue",
		"nwhite",

        "npink",
        "npink",
        "npink",
        "npink",

		"nwhite",
		"nblue",
		"nwhite",
		"nblue",
		"nwhite",
		"nblue",
		"nwhite",
        "norange",
	},
	body = {
        "borange",
		"bwhite",
		"bblue",
		"bwhite",
		"bblue",
		"bwhite",
		"bblue",
		"bwhite",

        "bpink",
        "bpink",
        "bpink",
        "bpink",

		"bwhite",
		"bblue",
		"bwhite",
		"bblue",
		"bwhite",
		"bblue",
		"bwhite",
        "borange",
	},
	tail = {
        "norange",
		"nwhite",
		"nblue",
		"nwhite",
		"nblue",
		"nwhite",
		"nblue",
		"nwhite",

        "npink",
        "npink",
        "npink",
        "npink",

		"nwhite",
		"nblue",
		"nwhite",
		"nblue",
		"nwhite",
		"nblue",
		"nwhite",
        "norange",
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

playfield:addBga({
	transform = {{1 / 2, -16 / 9 / 2}, {0, -7 / 9 / 2}, 0, {0, 16 / 9}, {0, 16 / 9}, 0, 0, 0, 0},
})

playfield:addColumnsBackground({
	color = {0, 0, 0, 1},
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

drawcolline(2, 0.2)
drawcolline(20, 0.2)
drawcolline(9, 0.2)
drawcolline(13, 0.2)
sphereElements.theThing(noteskin, playfield, noteskin.inputMode)

return noteskin