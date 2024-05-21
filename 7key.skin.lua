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
	{talt = "note/LNTalt.png"},
	{balt = "note/LNBalt.png"},
	{bwhite =  "note/LNBwhite.png"},
    {bblue = "note/LNBblue.png"},
    {byellow = "note/LNByellow.png"},
	{bgreen = "note/LNBgreen.png"},
    {nwhite = "note/NOTwhite.png"},
    {nblue  = "note/NOTblue.png"},
    {nyellow = "note/NOTyellow.png"},
	{ngreen = "note/NOTgreen.png"},
})

noteskin:setImagesAuto()
local hand = config:get("handicap") == true
local side = config:get("handicapside") == "Right"
noteskin:setShortNote({h = 108,
	image = {
		not hand and "nwhite" or (not side and "ngreen" or "nwhite"),
		not hand and "nblue" or  (not side and "nwhite" or "nblue"),
		not hand and "nwhite" or (not side and "nblue"  or "nwhite"),
		not hand and "nyellow" or "nwhite",
		not hand and "nwhite" or (side and "nblue"  or "nwhite"),
		not hand and "nblue" or  (side and "nwhite" or "nblue"),
		not hand and "nwhite" or (side and "ngreen" or "nwhite"),
	},
})
local altlong = config:get("altln") == true
noteskin:setLongNote({h = 108,
	head = {
		not hand and "nwhite" or (not side and "ngreen" or "nwhite"),
		not hand and "nblue" or  (not side and "nwhite" or "nblue"),
		not hand and "nwhite" or (not side and "nblue"  or "nwhite"),
		not hand and "nyellow" or "nwhite",
		not hand and "nwhite" or (side and "nblue"  or "nwhite"),
		not hand and "nblue" or  (side and "nwhite" or "nblue"),
		not hand and "nwhite" or (side and "ngreen" or "nwhite"),
	},
	body = {
		altlong and "balt" or (not hand and "bwhite" or (not side and "bgreen" or "bwhite")),
		altlong and "balt" or (not hand and "bblue" or  (not side and "bwhite" or "bblue")),
		altlong and "balt" or (not hand and "bwhite" or (not side and "bblue"  or "bwhite")),
        altlong and "balt" or (not hand and "byellow" or "bwhite"),
        altlong and "balt" or (not hand and "bwhite" or (side and "bblue"  or "bwhite")),
        altlong and "balt" or (not hand and "bblue" or  (side and "bwhite" or "bblue")),
        altlong and "balt" or (not hand and "bwhite" or (side and "bgreen" or "bwhite")),
	},
	tail = {
		altlong and "talt" or (not hand and "nwhite" or (not side and "ngreen" or "nwhite")),
		altlong and "talt" or (not hand and "nblue" or  (not side and "nwhite" or "nblue")),
		altlong and "talt" or (not hand and "nwhite" or (not side and "nblue"  or "nwhite")),
        altlong and "talt" or (not hand and "nyellow" or "nwhite"),
        altlong and "talt" or (not hand and "nwhite" or (side and "nblue"  or "nwhite")),
        altlong and "talt" or (not hand and "nblue" or  (side and "nwhite" or "nblue")),
        altlong and "talt" or (not hand and "nwhite" or (side and "ngreen" or "nwhite")),
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
playfield:addKeyImages({h = 131,
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