local NoteSkinVsrg = require("sphere.models.NoteSkinModel.NoteSkinVsrg")
local BasePlayfield = require("sphere.models.NoteSkinModel.BasePlayfield")
local ImageView = require("sphere.views.ImageView")
local JustConfig = require("sphere.JustConfig")
local root = (...):match("(.+)/.-")
local config = JustConfig:fromFile(root .. "/configs/14key2scratch2.config.lua")
local sphereElements = require(root .. "/Modules/SphereElements")

local noteskin = NoteSkinVsrg({
    path = ...,
	name = "Kori's Pick - EZ2DJ",
	inputMode = "16key",
	range = {-1, 1},
	unit = 1080,
    config = config,
	hitposition = 1060,
})

local playfield = BasePlayfield(noteskin)

noteskin:setInput({"key1","key2","key3","key4","key5","key6","key7","key8","key9","key10","key11","key12","key13","key14","key15","key16"})
noteskin:setColumns({
	offset = 0,
	align = "center",
	width = {97, 97, 97, 97, 97, 97, 97, 97, 97, 97, 97, 97, 97, 97, 97, 97},
	space = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
})

noteskin:setTextures({
	{pixel = "pixel.png"},
	{norange = "note/NOTorange.png"},
    {nwhite  = "note/NOTwhite.png"},
    {nblue   = "note/NOTblue.png"},
	{nred    = "note/NOTred.png"},
    {nyellow = "note/NOTyellow.png"},
    {ngreen  = "note/NOTgreen.png"},
	{borange = "note/LNBorange.png"},
    {bwhite  = "note/LNBwhite.png"},
    {bblue   = "note/LNBblue.png"},
	{bred    = "note/LNBred.png"},
    {byellow = "note/LNByellow.png"},
    {bgreen  = "note/LNBgreen.png"},
})

noteskin:setImagesAuto()

local imlazy = config:get("bms") == true
noteskin:setShortNote({
	image = {
        "norange",

		imlazy and "nwhite" or "ngreen",
		imlazy and "nblue" or "nblue",
		imlazy and "nwhite" or "nwhite",
		imlazy and "nblue" or "nblue",
		imlazy and "nwhite" or "nyellow",

		"nred",
		"nred",
		"nred",
		"nred",

		imlazy and "nwhite" or "norange",
		imlazy and "nblue" or "nblue",
		imlazy and "nwhite" or "nwhite",
		imlazy and "nblue" or "nblue",
		imlazy and "nwhite" or "ngreen",

        "norange",
	},
	h = 80,
})

noteskin:setLongNote({
	head = {
        "norange",

		imlazy and "nwhite" or "ngreen",
		imlazy and "nblue" or "nblue",
		imlazy and "nwhite" or "nwhite",
		imlazy and "nblue" or "nblue",
		imlazy and "nwhite" or "nyellow",

		"nred",
		"nred",
		"nred",
		"nred",

		imlazy and "nwhite" or "norange",
		imlazy and "nblue" or "nblue",
		imlazy and "nwhite" or "nwhite",
		imlazy and "nblue" or "nblue",
		imlazy and "nwhite" or "ngreen",

        "norange",
	},
	body = {
        "borange",

		imlazy and "bwhite" or "bgreen",
		imlazy and "bblue" or "bblue",
		imlazy and "bwhite" or "bwhite",
		imlazy and "bblue" or "bblue",
		imlazy and "bwhite" or "byellow",

		"bred",
		"bred",
		"bred",
		"bred",

		imlazy and "bwhite" or "borange",
		imlazy and "bblue" or "bblue",
		imlazy and "bwhite" or "bwhite",
		imlazy and "bblue" or "bblue",
		imlazy and "bwhite" or "bgreen",

        "borange",
	},
	tail = {
        "norange",

		imlazy and "nwhite" or "ngreen",
		imlazy and "nblue" or "nblue",
		imlazy and "nwhite" or "nwhite",
		imlazy and "nblue" or "nblue",
		imlazy and "nwhite" or "nyellow",

		"nred",
		"nred",
		"nred",
		"nred",

		imlazy and "nwhite" or "norange",
		imlazy and "nblue" or "nblue",
		imlazy and "nwhite" or "nwhite",
		imlazy and "nblue" or "nblue",
		imlazy and "nwhite" or "ngreen",

        "norange",
	},
	h = 80,
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
	h = 100,
	padding = 0,
	pressed = {
		"key/scale4.png",
		"key/scale4.png",
		"key/scale4.png",
		"key/scale4.png",
        "key/scale4.png",
		"key/scale4.png",
		"key/scale4.png",
		"key/scale4.png",
        "key/scale4.png",
		"key/scale4.png",
        "key/scale4.png",
        "key/scale4.png",
		"key/scale4.png",
		"key/scale4.png",
		"key/scale4.png",
		"key/scale4.png",
	},
	released = {
		"key/scale4.png",
		"key/scale4.png",
		"key/scale4.png",
		"key/scale4.png",
        "key/scale4.png",
		"key/scale4.png",
		"key/scale4.png",
		"key/scale4.png",
        "key/scale4.png",
		"key/scale4.png",
        "key/scale4.png",
        "key/scale4.png",
		"key/scale4.png",
		"key/scale4.png",
		"key/scale4.png",
		"key/scale4.png",
	},
})

playfield:addNotes()
playfield:disableCamera()
playfield:addGuidelines({
	y = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
	w = {0, 2, 0, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0, 0, 2, 0, 0},
	h = {0, noteskin.hitposition, 0, 0, 0, 0, noteskin.hitposition, 0, 0, 0, noteskin.hitposition, 0, 0, 0, 0, noteskin.hitposition, 0, 0},
	image = "pixel.png",
	color = {1, 1, 1, 0.2},
	both = false,
	mode = "default",
})
sphereElements.theThing(noteskin, playfield, "14key2scratch2")

return noteskin