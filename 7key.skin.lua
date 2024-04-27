local NoteSkinVsrg = require("sphere.models.NoteSkinModel.NoteSkinVsrg")
local BasePlayfield = require("sphere.models.NoteSkinModel.BasePlayfield")
local JustConfig = require("sphere.JustConfig")
local root = (...):match("(.+)/.-")
local config = JustConfig:fromFile(root .. "/configs/7key.config.lua")
local sphereElements = require(root .. "/Modules/SphereElements")

local noteskin = NoteSkinVsrg({
    path = ...,
	name = "Kori's Pick",
	inputMode = "7key",
	range = {-1, 1},
	unit = 1080,
    config = config,
	hitposition = 1059,
})

local playfield = BasePlayfield(noteskin)

noteskin:setInput({"key1","key2","key3","key4","key5","key6","key7"})

noteskin:setColumns({
	offset = 0,
	align = "center",
	width = {128, 128, 128, 128, 128, 128, 128},
	space = {0, 0, 0, 0, 0, 0, 0, 0},
})

noteskin:setTextures({
	{pixel = "pixel.png"},
    {nwhite = "note/NOTwhite.png"},
    {nblue  = "note/NOTblue.png"},
    {nyellow = "note/NOTyellow.png"},
    {bwhite =  "note/LNBwhite.png"},
    {bblue = "note/LNBblue.png"},
    {byellow = "note/LNByellow.png"},
})

noteskin:setImagesAuto()
noteskin:setShortNote({
	image = {
		"nwhite",
		"nblue",
		"nwhite",
        "nyellow",
        "nwhite",
        "nblue",
        "nwhite",
	},
	h = 108,
})

noteskin:setLongNote({
	head = {
		"nwhite",
		"nblue",
		"nwhite",
        "nyellow",
        "nwhite",
        "nblue",
        "nwhite",

	},
	body = {
		"bwhite",
		"bblue",
		"bwhite",
        "byellow",
        "bwhite",
        "bblue",
        "bwhite",
	},
	tail = {
		"nwhite",
		"nblue",
		"nwhite",
        "nyellow",
        "nwhite",
        "nblue",
        "nwhite",
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

playfield:addColumnsBackground({
	color = {0, 0, 0, 1},
})

playfield:addBga({
	transform = {{1 / 2, -16 / 9 / 2}, {0, -7 / 9 / 2}, 0, {0, 16 / 9}, {0, 16 / 9}, 0, 0, 0, 0},
})

playfield:enableCamera()
playfield:addKeyImages({
	h = 131,
	padding = 0,
	pressed = {
		config:get("litupreceptors") and "key/scale2lit.png" or "key/scale2.png",
		config:get("litupreceptors") and "key/scale2lit.png" or "key/scale2.png",
		config:get("litupreceptors") and "key/scale2lit.png" or "key/scale2.png",
		config:get("litupreceptors") and "key/scale2lit.png" or "key/scale2.png",
        config:get("litupreceptors") and "key/scale2lit.png" or "key/scale2.png",
		config:get("litupreceptors") and "key/scale2lit.png" or "key/scale2.png",
		config:get("litupreceptors") and "key/scale2lit.png" or "key/scale2.png",
	},
	released = {
		"key/scale2.png",
		"key/scale2.png",
		"key/scale2.png",
		"key/scale2.png",
        "key/scale2.png",
		"key/scale2.png",
		"key/scale2.png",
		"key/scale2.png",
        "key/scale2.png",
		"key/scale2.png",
	},
})

playfield:addNotes()
playfield:disableCamera()
sphereElements.theThing(noteskin, playfield, noteskin.inputMode)

return noteskin