local NoteSkinVsrg = require("sphere.models.NoteSkinModel.NoteSkinVsrg")
local BasePlayfield = require("sphere.models.NoteSkinModel.BasePlayfield")
local JustConfig = require("sphere.JustConfig")
local root = (...):match("(.+)/.-")
local config = JustConfig:fromFile(root .. "/configs/4key.config.lua")
local sphereElements = require(root .. "/Modules/SphereElements")

local noteskin = NoteSkinVsrg({
    path = ...,
	name = "Kori's Pick",
	inputMode = "4key",
	range = {-1, 1},
	unit = 1080,
	config = config,
	hitposition = 1051,
})

local playfield = BasePlayfield(noteskin)

noteskin:setInput({"key1", "key2", "key3", "key4"})
noteskin:setColumns({
	offset = 0,
	align = "center",
	width = {150, 150, 150, 150},
	space = {0, 0, 0, 0, 0},
})

noteskin:setTextures({
	{pixel = "pixel.png"},
    {nwhite = "note/NOTwhite.png"},
    {bwhite = "note/LNBwhite.png"},
	{talt   = "note/LNTalt.png"},
	{balt   = "note/LNBalt.png"},
	{nalt   = "note/NOTblue.png"},
})

noteskin:setImagesAuto()

noteskin:setShortNote({
	image = {
		"nwhite",
		"nwhite",
		"nwhite",
		"nwhite",
	},
	h = 126,
})
local altlong = config:get("altln") == true
noteskin:setLongNote({
	head = {
		altlong and "nalt" or "nwhite",
		altlong and "nalt" or "nwhite",
		altlong and "nalt" or "nwhite",
		altlong and "nalt" or "nwhite",
	},
	body = {
		altlong and "balt" or "bwhite",
		altlong and "balt" or "bwhite",
		altlong and "balt" or "bwhite",
		altlong and "balt" or "bwhite",
	},
	tail = {
		altlong and "talt" or "nwhite",
		altlong and "talt" or "nwhite",
		altlong and "talt" or "nwhite",
		altlong and "talt" or "nwhite",
	},
	h = 126,
})

if config:get("barline") == true then
	noteskin:addMeasureLine({
		h = 2,
		color = {1, 1, 1, 0.2},
		image = "pixel"
	})
end

noteskin:addBga({
	x = 0,
	y = 0,
	w = 1,
	h = 1,
	color = {0.25, 0.25, 0.25, 1}
})

playfield:addColumnsBackground({
	color = {0, 0, 0, 1},
})

playfield:addBga({
	transform = {{1 / 2, -16 / 9 / 2}, {0, -7 / 9 / 2}, 0, {0, 16 / 9}, {0, 16 / 9}, 0, 0, 0, 0}
})

playfield:enableCamera()
playfield:addKeyImages({
	h = 154,
	padding = 0,
	pressed = {
		config:get("receptorlight") and "key/scale1lit.png" or "key/scale1.png",
		config:get("receptorlight") and "key/scale1lit.png" or "key/scale1.png",
		config:get("receptorlight") and "key/scale1lit.png" or "key/scale1.png",
		config:get("receptorlight") and "key/scale1lit.png" or "key/scale1.png",
	},
	released = {
		"key/scale1.png",
		"key/scale1.png",
		"key/scale1.png",
		"key/scale1.png",
	},
})

playfield:addNotes()
playfield:disableCamera()
sphereElements.theThing(noteskin, playfield, noteskin.inputMode)

return noteskin