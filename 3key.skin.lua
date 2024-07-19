local NoteSkinVsrg = require("sphere.models.NoteSkinModel.NoteSkinVsrg")
local BasePlayfield = require("sphere.models.NoteSkinModel.BasePlayfield")
local JustConfig = require("sphere.JustConfig")
local root = (...):match("(.+)/.-")
local config = JustConfig:fromFile(root .. "/configs/3key.config.lua")
local sphereElements = require(root .. "/Modules/SphereElements")

local noteskin = NoteSkinVsrg({
    path = ...,
	name = "Kori's Pick",
	inputMode = "3key",
	range = {-1, 1},
	unit = 1080,
    config = config,
	hitposition = 1053,
})

local playfield = BasePlayfield(noteskin)

noteskin:setInput({"key1","key2","key3"})
noteskin:setColumns({
	offset = 0,
	align = "center",
	width = {145, 145, 145},
	space = {0, 0, 0, 0},
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

local hand = config:get("handicap") == true
local side = config:get("middleside") == "Right"
noteskin:setShortNote({h = 122,
	image = {
		not hand and "nwhite" or (not side and "nblue" or "nwhite"),
		hand and "nwhite" or "nyellow",
        not hand and "nwhite" or (side and "nblue" or "nwhite"),
	},
})

noteskin:setLongNote({h = 122,
    head = {
		not hand and "nwhite" or (not side and "nblue" or "nwhite"),
		hand and "nwhite" or "nyellow",
        not hand and "nwhite" or (side and "nblue" or "nwhite"),
    },
    body = {
		not hand and "bwhite" or (not side and "bblue" or "bwhite"),
		hand and "bwhite" or "byellow",
        not hand and "bwhite" or (side and "bblue" or "bwhite"),
    },
    tail = {
        not hand and "nwhite" or (not side and "nblue" or "nwhite"),
		hand and "nwhite" or "nyellow",
        not hand and "nwhite" or (side and "nblue" or "nwhite"),
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
playfield:addKeyImages({h = 149,
	padding = 0,
	pressed = {
		config:get("receptorlight") and "key/scale2lit.png" or "key/scale2.png",
		config:get("receptorlight") and "key/scale2lit.png" or "key/scale2.png",
		config:get("receptorlight") and "key/scale2lit.png" or "key/scale2.png",
	},
	released = {
		"key/scale2.png",
		"key/scale2.png",
		"key/scale2.png",
	},
})

playfield:addNotes()
playfield:disableCamera()
sphereElements.theThing(noteskin, playfield, noteskin.inputMode, noteskin.columnsCount)

return noteskin