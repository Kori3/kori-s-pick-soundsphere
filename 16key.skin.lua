local NoteSkinVsrg = require("sphere.models.NoteSkinModel.NoteSkinVsrg")
local BasePlayfield = require("sphere.models.NoteSkinModel.BasePlayfield")
local ImageView = require("sphere.views.ImageView")
local JustConfig = require("sphere.JustConfig")
local root = (...):match("(.+)/.-")
local config = JustConfig:fromFile(root .. "/configs/14key2scratch.config.lua")
local sphereElements = require(root .. "/Modules/SphereElements")

local noteskin = NoteSkinVsrg({
    path = ...,
	name = "Kori's Pick - 14K2S",
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
	space = {0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0},
})

noteskin:setTextures({
	{pixel = "pixel.png"},
    {nwhite = "note/NOTwhite.png"},
    {nblue  = "note/NOTblue.png"},
    {nyellow = "note/NOTyellow.png"},
    {ngreen = "note/NOTgreen.png"},
    {norange = "note/NOTorange.png"},
    {bwhite =  "note/LNBwhite.png"},
    {bblue = "note/LNBblue.png"},
    {byellow = "note/LNByellow.png"},
    {bgreen = "note/LNBgreen.png"},
    {borange = "note/LNBorange.png"},
})

noteskin:setImagesAuto()

noteskin:setShortNote({h = 80,
	image = {
        "norange",
		"nwhite",
		"nblue",
		"nwhite",
		"nblue",
		"nwhite",
		"nblue",
		"nwhite",
		"nwhite",
		"nblue",
		"nwhite",
		"nblue",
		"nwhite",
		"nblue",
		"nwhite",
        "norange",
	},
})

noteskin:setLongNote({h = 80,
	head = {
        "norange",
		"nwhite",
		"nblue",
		"nwhite",
		"nblue",
		"nwhite",
		"nblue",
		"nwhite",
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
		"nwhite",
		"nblue",
		"nwhite",
		"nblue",
		"nwhite",
		"nblue",
		"nwhite",
        "norange",
	},
})

if config:get("barline") == true then
	noteskin:addMeasureLine({
		h = 2,
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

local imlazy = config:get("receptorlight") == true
playfield:addKeyImages({h = 100,
	padding = 0,
	pressed = {
		imlazy and "key/scale5scr.png" or "key/scale5.png",
		imlazy and "key/scale5lit.png" or "key/scale5.png",
		imlazy and "key/scale5lit.png" or "key/scale5.png",
		imlazy and "key/scale5lit.png" or "key/scale5.png",
        imlazy and "key/scale5lit.png" or "key/scale5.png",
		imlazy and "key/scale5lit.png" or "key/scale5.png",
		imlazy and "key/scale5lit.png" or "key/scale5.png",
		imlazy and "key/scale5lit.png" or "key/scale5.png",
        imlazy and "key/scale5lit.png" or "key/scale5.png",
		imlazy and "key/scale5lit.png" or "key/scale5.png",
        imlazy and "key/scale5lit.png" or "key/scale5.png",
        imlazy and "key/scale5lit.png" or "key/scale5.png",
		imlazy and "key/scale5lit.png" or "key/scale5.png",
		imlazy and "key/scale5lit.png" or "key/scale5.png",
		imlazy and "key/scale5lit.png" or "key/scale5.png",
		imlazy and "key/scale5scr.png" or "key/scale5.png",
	},
	released = {
		"key/scale5.png",
		"key/scale5.png",
		"key/scale5.png",
		"key/scale5.png",
        "key/scale5.png",
		"key/scale5.png",
		"key/scale5.png",
		"key/scale5.png",
        "key/scale5.png",
		"key/scale5.png",
        "key/scale5.png",
        "key/scale5.png",
		"key/scale5.png",
		"key/scale5.png",
		"key/scale5.png",
		"key/scale5.png",
	},
})

playfield:addNotes()
playfield:disableCamera()
playfield:addGuidelines({
	y = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
	w = {0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0},
	h = {0, noteskin.hitposition, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, noteskin.hitposition, 0, 0},
	image = "pixel.png",
	color = {1, 1, 1, 0.2},
	both = false,
	mode = "default",
})

sphereElements.theThing(noteskin, playfield, "14key2scratch", noteskin.columnsCount)

return noteskin