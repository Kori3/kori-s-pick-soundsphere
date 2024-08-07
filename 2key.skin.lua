local NoteSkinVsrg = require("sphere.models.NoteSkinModel.NoteSkinVsrg")
local BasePlayfield = require("sphere.models.NoteSkinModel.BasePlayfield")
local JustConfig = require("sphere.JustConfig")
local root = (...):match("(.+)/.-")
local config = JustConfig:fromFile(root .. "/configs/2key.config.lua")
local sphereElements = require(root .. "/Modules/SphereElements")

local noteskin = NoteSkinVsrg({
    path = ...,
	name = "Kori's Pick",
	inputMode = "2key",
	range = {-1, 1},
	unit = 1080,
    config = config,
	hitposition = 1053,
})

local playfield = BasePlayfield(noteskin)

noteskin:setInput({"key1","key2"})
noteskin:setColumns({
	offset = 0,
	align = "center",
	width = {145, 145},
	space = {0, 0, 0},
})

noteskin:setTextures({
	{pixel = "pixel.png"},
    {nwhite = "note/NOTwhite.png"},
    {nyellow = "note/NOTyellow.png"},
    {byellow = "note/LNByellow.png"},
})

noteskin:setImagesAuto()
noteskin:setShortNote({h = 122,
	image = {
        "nwhite",
		"nwhite",
	},
})

noteskin:setLongNote({h = 122,
    head = {
		"nyellow",
        "nyellow",
    },
    body = {
        "byellow",
        "byellow",
    },
    tail = {
        "nyellow",
        "nyellow",
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
	},
	released = {
		"key/scale2.png",
		"key/scale2.png",
	},
})

playfield:addNotes()
playfield:disableCamera()
sphereElements.theThing(noteskin, playfield, noteskin.inputMode, noteskin.columnsCount)

return noteskin