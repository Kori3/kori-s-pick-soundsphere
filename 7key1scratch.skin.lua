local NoteSkinVsrg = require("sphere.models.NoteSkinModel.NoteSkinVsrg")
local BasePlayfield = require("sphere.models.NoteSkinModel.BasePlayfield")
local JustConfig = require("sphere.JustConfig")
local root = (...):match("(.+)/.-")
local config = JustConfig:fromFile(root .. "/configs/7key1scratch.config.lua")
local sphereElements = require(root .. "/Modules/SphereElements")

local noteskin = NoteSkinVsrg({
    path = ...,
	name = "Kori's Pick",
	inputMode = "7key1scratch",
	range = {-1, 1},
	unit = 1080,
    config = config,
	hitposition = 1059,
})

local playfield = BasePlayfield(noteskin)

noteskin:setInput({"key1","key2","key3","key4","key5","key6","key7","scratch1"})

local scratchspace
if config:get("scratchpos") == "Right" then scratchspace = {1, 0} else scratchspace = {-7, -8 * 128} end
noteskin:setColumns({
	offset = 0,
	align = "center",
	width = {128, 128, 128, 128, 128, 128, 128, 128},
	space = {scratchspace[1] * 128, 0, 0, 0, 0, 0, 0, scratchspace[2], 0},
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
imlazy = config:get("bms") == true
noteskin:setShortNote({h = 108,
	image = {
		"nwhite",
		"nblue",
		"nwhite",
        imlazy and "nblue" or "nyellow",
        "nwhite",
        "nblue",
        "nwhite",
        "norange",
	},
})

noteskin:setLongNote({h = 108,
	head = {
		"nwhite",
		"nblue",
		"nwhite",
        imlazy and "nblue" or "nyellow",
        "nwhite",
        "nblue",
        "nwhite",
        "norange",
	},
	body = {
		"bwhite",
		"bblue",
		"bwhite",
        imlazy and "bblue" or "byellow",
        "bwhite",
        "bblue",
        "bwhite",
        "borange",
	},
	tail = {
		"nwhite",
		"nblue",
		"nwhite",
        imlazy and "nblue" or "nyellow",
        "nwhite",
        "nblue",
        "nwhite",
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
        config:get("receptorlight") and "key/scale3scr.png" or "key/scale3.png",
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
	},
})

local scratchguide
if config:get("scratchpos") == "Right" then scratchguide = {2, 0, noteskin.hitposition, 0} else scratchguide = {0, 2, 0, noteskin.hitposition} end
playfield:addGuidelines({
	y = {0, 0, 0, 0, 0, 0, 0, 0, 0},
	w = {0, 0, 0, 0, 0, 0, 0, scratchguide[1], scratchguide[2]},
	h = {0, 0, 0, 0, 0, 0, 0, scratchguide[3], scratchguide[4]},
	image = "pixel.png",
	color = {1, 1, 1, 0.2},
	both = false,
	mode = "default",
})

playfield:addNotes()
playfield:disableCamera()
sphereElements.theThing(noteskin, playfield, noteskin.inputMode, noteskin.columnsCount + ((config:get("scratchpos") == "Right") and 1 or -1))

return noteskin