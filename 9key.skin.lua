local NoteSkinVsrg = require("sphere.models.NoteSkinModel.NoteSkinVsrg")
local BasePlayfield = require("sphere.models.NoteSkinModel.BasePlayfield")
local JustConfig = require("sphere.JustConfig")
local root = (...):match("(.+)/.-")
local config = JustConfig:fromFile(root .. "/configs/9key.config.lua")
local sphereElements = require(root .. "/Modules/SphereElements")

local noteskin = NoteSkinVsrg({
    path = ...,
	name = "Kori's Pick",
	inputMode = "9key",
	range = {-1, 1},
	unit = 1080,
    config = config,
	hitposition = 1059,
})

local playfield = BasePlayfield(noteskin)

noteskin:setInput({"key1","key2","key3","key4","key5","key6","key7","key8","key9"})
noteskin:setColumns({
	offset = 0,
	align = "center",
	width = {114, 114, 114, 114, 114, 114, 114, 114, 114},
	space = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
})

noteskin:setTextures({
	{pixel = "pixel.png"},
    {nwhite = "note/NOTwhite.png"},
    {nblue  = "note/NOTblue.png"},
    {nyellow = "note/NOTyellow.png"},
    {ngreen = "note/NOTgreen.png"},
	{nred = "note/NOTred.png"},
    {bwhite =  "note/LNBwhite.png"},
    {bblue = "note/LNBblue.png"},
    {byellow = "note/LNByellow.png"},
    {bgreen = "note/LNBgreen.png"},
	{bred = "note/LNBred.png"},
})

noteskin:setImagesAuto()

local imlazy = config:get("pms") == true
noteskin:setShortNote({h = 97,
	image = {
		imlazy and "nwhite" or "ngreen",
		imlazy and "nyellow" or "nwhite",
		imlazy and "ngreen" or "nblue",
		imlazy and "nblue" or "nwhite",
        imlazy and "nred" or "nyellow",
        imlazy and "nblue" or "nwhite",
        imlazy and "ngreen" or "nblue",
        imlazy and "nyellow" or "nwhite",
        imlazy and "nwhite" or "ngreen",
	},
})

noteskin:setLongNote({h = 97,
	head = {
		imlazy and "nwhite" or "ngreen",
		imlazy and "nyellow" or "nwhite",
		imlazy and "ngreen" or "nblue",
		imlazy and "nblue" or "nwhite",
        imlazy and "nred" or "nyellow",
        imlazy and "nblue" or "nwhite",
        imlazy and "ngreen" or "nblue",
        imlazy and "nyellow" or "nwhite",
        imlazy and "nwhite" or "ngreen",
	},
	body = {
		imlazy and "bwhite" or "bgreen",
		imlazy and "byellow" or "bwhite",
		imlazy and "bgreen" or "bblue",
		imlazy and "bblue" or "bwhite",
        imlazy and "bred" or "byellow",
        imlazy and "bblue" or "bwhite",
        imlazy and "bgreen" or "bblue",
        imlazy and "byellow" or "bwhite",
        imlazy and "bwhite" or "bgreen",
	},
	tail = {
		imlazy and "nwhite" or "ngreen",
		imlazy and "nyellow" or "nwhite",
		imlazy and "ngreen" or "nblue",
		imlazy and "nblue" or "nwhite",
        imlazy and "nred" or "nyellow",
        imlazy and "nblue" or "nwhite",
        imlazy and "ngreen" or "nblue",
        imlazy and "nyellow" or "nwhite",
        imlazy and "nwhite" or "ngreen",
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
playfield:addKeyImages({h = 115,
	padding = 0,
	pressed = {
		config:get("receptorlight") and "key/scale4lit.png" or "key/scale4.png",
		config:get("receptorlight") and "key/scale4lit.png" or "key/scale4.png",
		config:get("receptorlight") and "key/scale4lit.png" or "key/scale4.png",
		config:get("receptorlight") and "key/scale4lit.png" or "key/scale4.png",
        config:get("receptorlight") and "key/scale4lit.png" or "key/scale4.png",
		config:get("receptorlight") and "key/scale4lit.png" or "key/scale4.png",
		config:get("receptorlight") and "key/scale4lit.png" or "key/scale4.png",
        config:get("receptorlight") and "key/scale4lit.png" or "key/scale4.png",
		config:get("receptorlight") and "key/scale4lit.png" or "key/scale4.png",
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
	},
})

playfield:addNotes()
playfield:disableCamera()
sphereElements.theThing(noteskin, playfield, noteskin.inputMode, noteskin.columnsCount)

return noteskin