local NoteSkinVsrg = require("sphere.models.NoteSkinModel.NoteSkinVsrg")
local BasePlayfield = require("sphere.models.NoteSkinModel.BasePlayfield")
local JustConfig = require("sphere.JustConfig")
local root = (...):match("(.+)/.-")
local config = JustConfig:fromFile(root .. "/configs/6key.config.lua")
local sphereElements = require(root .. "/Modules/SphereElements")

local noteskin = NoteSkinVsrg({
    path = ...,
	name = "Kori's Pick",
	inputMode = "6key",
	range = {-1, 1},
	unit = 1080,
    config = config,
	hitposition = 1059,
})

local playfield = BasePlayfield(noteskin)

noteskin:setInput({"key1","key2","key3","key4","key5","key6"})
noteskin:setColumns({
	offset = 0,
	align = "center",
	width = {128, 128, 128, 128, 128, 128},
	space = {0, 0, 0, 0, 0, 0, 0},
})

noteskin:setTextures({
	{pixel = "pixel.png"},
    {nwhite = "note/NOTwhite.png"},
    {nblue  = "note/NOTblue.png"},
    {nyellow = "note/NOTyellow.png"},
    {norange = "note/NOTorange.png"},
    {bwhite =  "note/LNBwhite.png"},
    {bblue = "note/LNBblue.png"},
    {byellow = "note/LNByellow.png"},
    {borange = "note/LNBorange.png"},
})

noteskin:setImagesAuto()

local imlazy = config:get("twothumbs") == true
noteskin:setShortNote({
	image = {
		imlazy and "nblue" or "nwhite",
		imlazy and "nwhite" or "nblue",
		imlazy and "nyellow" or "nwhite",
        imlazy and "norange" or "nwhite",
        imlazy and "nwhite" or "nblue",
        imlazy and "nblue" or "nwhite"
	},
	h = 108,
})

noteskin:setLongNote({
    head = {
		imlazy and "nblue" or "nwhite",
		imlazy and "nwhite" or "nblue",
		imlazy and "nyellow" or "nwhite",
        imlazy and "norange" or "nwhite",
        imlazy and "nwhite" or "nblue",
        imlazy and "nblue" or "nwhite"
    },
    body = {
		imlazy and "bblue" or "bwhite",
		imlazy and "bwhite" or "bblue",
		imlazy and "byellow" or "bwhite",
        imlazy and "borange" or "bwhite",
        imlazy and "bwhite" or "bblue",
        imlazy and "bblue" or "bwhite"
    },
    tail = {
		imlazy and "nblue" or "nwhite",
		imlazy and "nwhite" or "nblue",
		imlazy and "nyellow" or "nwhite",
        imlazy and "norange" or "nwhite",
        imlazy and "nwhite" or "nblue",
        imlazy and "nblue" or "nwhite"
    },
    h = 108,
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
	h = 131,
	padding = 0,
	pressed = {
		config:get("receptorlight") and "key/scale3lit.png" or "key/scale3.png",
		config:get("receptorlight") and "key/scale3lit.png" or "key/scale3.png",
		config:get("receptorlight") and "key/scale3lit.png" or "key/scale3.png",
		config:get("receptorlight") and "key/scale3lit.png" or "key/scale3.png",
        config:get("receptorlight") and "key/scale3lit.png" or "key/scale3.png",
		config:get("receptorlight") and "key/scale3lit.png" or "key/scale3.png",
		config:get("receptorlight") and "key/scale3lit.png" or "key/scale3.png",
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
		"key/scale3.png",
	},
})

playfield:addNotes()
playfield:disableCamera()
sphereElements.theThing(noteskin, playfield, noteskin.inputMode)

return noteskin