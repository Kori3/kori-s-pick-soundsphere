local NoteSkinVsrg = require("sphere.models.NoteSkinModel.NoteSkinVsrg")
local BasePlayfield = require("sphere.models.NoteSkinModel.BasePlayfield")
local JustConfig = require("sphere.JustConfig")
local root = (...):match("(.+)/.-")
local config = JustConfig:fromFile(root .. "/configs/5key1scratch.config.lua")
local sphereElements = require(root .. "/Modules/SphereElements")

local noteskin = NoteSkinVsrg({
    path = ...,
	name = "Kori's Pick",
	inputMode = "5key1scratch",
	range = {-1, 1},
	unit = 1080,
    config = config,
	hitposition = 1053,
})

local playfield = BasePlayfield(noteskin)

noteskin:setInput({"key1","key2","key3","key4","key5","scratch1"})

local scratchspace
if config:get("scratchpos") == "Right" then scratchspace = {1, 0} else scratchspace = {-5, -6 * 145} end
noteskin:setColumns({
	offset = 0,
	align = "center",
	width = {145, 145, 145, 145, 145, 145},
	space = {scratchspace[1] * 145, 0, 0, 0, 0, scratchspace[2], 0},
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

local imlazy = config:get("bms") == true
noteskin:setShortNote({h = 122,
	image = {
		imlazy and "nblue" or "nwhite",
		"nwhite",
		imlazy and "nblue" or "nyellow",
        "nwhite",
        imlazy and "nblue" or "nwhite",
        "norange",
	},
})

noteskin:setLongNote({h = 122,
    head = {
		imlazy and "nblue" or "nwhite",
		"nwhite",
		imlazy and "nblue" or "nyellow",
        "nwhite",
        imlazy and "nblue" or "nwhite",
        "norange",
    },
    body = {
		imlazy and "bblue" or "bwhite",
		"bwhite",
		imlazy and "bblue" or "byellow",
        "bwhite",
        imlazy and "bblue" or "bwhite",
        "borange",
    },
    tail = {
		imlazy and "nblue" or "nwhite",
		"nwhite",
		imlazy and "nblue" or "nyellow",
        "nwhite",
        imlazy and "nblue" or "nwhite",
        "norange",
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
		config:get("receptorlight") and "key/scale2lit.png" or "key/scale2.png",
        config:get("receptorlight") and "key/scale2lit.png" or "key/scale2.png",
        config:get("receptorlight") and "key/scale2scr.png" or "key/scale2.png",
	},
	released = {
		"key/scale2.png",
		"key/scale2.png",
		"key/scale2.png",
        "key/scale2.png",
		"key/scale2.png",
        "key/scale2.png",
	},
})

local scratchguide
if config:get("scratchpos") == "Right" then scratchguide = {2, 0, noteskin.hitposition, 0} else scratchguide = {0, 2, 0, noteskin.hitposition} end
playfield:addGuidelines({
	y = {0, 0, 0, 0, 0, 0, 0},
	w = {0, 0, 0, 0, 0, scratchguide[1], scratchguide[2]},
	h = {0, 0, 0, 0, 0, scratchguide[3], scratchguide[4]},
	image = "pixel.png",
	color = {1, 1, 1, 0.2},
	both = false,
	mode = "default",
})

playfield:addNotes()
playfield:disableCamera()
sphereElements.theThing(noteskin, playfield, noteskin.inputMode)

return noteskin