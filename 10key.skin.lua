local NoteSkinVsrg = require("sphere.models.NoteSkinModel.NoteSkinVsrg")
local BasePlayfield = require("sphere.models.NoteSkinModel.BasePlayfield")
local JustConfig = require("sphere.JustConfig")
local root = (...):match("(.+)/.-")
local config = JustConfig:fromFile(root .. "/configs/10key.config.lua")
local sphereElements = require(root .. "/Modules/SphereElements")

local noteskin = NoteSkinVsrg({
    path = ...,
	name = "Kori's Pick",
	inputMode = "10key",
	range = {-1, 1},
	unit = 1080,
    config = config,
	hitposition = 1059,
})

local playfield = BasePlayfield(noteskin)

noteskin:setInput({"key1","key2","key3","key4","key5","key6","key7","key8","key9","key10"})

noteskin:setColumns({
	offset = 0,
	align = "center",
	width = {114, 114, 114, 114, 114, 114, 114, 114, 114, 114},
	space = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
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
noteskin:setShortNote({
	image = {
		"ngreen",
		"nwhite",
		"nblue",
		"nwhite",
        "nyellow",
        "norange",
        "nwhite",
        "nblue",
        "nwhite",
        "ngreen",
	},
	h = 97,
})

noteskin:setLongNote({
	head = {
		"ngreen",
		"nwhite",
		"nblue",
		"nwhite",
        "nyellow",
        "norange",
        "nwhite",
        "nblue",
        "nwhite",
        "ngreen",
	},
	body = {
		"bgreen",
		"bwhite",
		"bblue",
		"bwhite",
        "byellow",
        "borange",
        "bwhite",
        "bblue",
        "bwhite",
        "bgreen",
	},
	tail = {
		"ngreen",
		"nwhite",
		"nblue",
		"nwhite",
        "nyellow",
        "norange",
        "nwhite",
        "nblue",
        "nwhite",
        "ngreen",
	},
	h = 97,
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
	h = 115,
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
		"key/scale4.png",
	},
})

playfield:addNotes()
playfield:disableCamera()
if config:get("linemid") then
	playfield:addGuidelines({
        y = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        w = {0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0},
		h = {0, 0, 0, 0, 0, noteskin.hitposition, 0, 0, 0, 0, 0},
		image = "pixel.png",
		color = {1, 1, 1, 0.2},
		both = false,
		mode = "default",
	})
end

sphereElements.theThing(noteskin, playfield, noteskin.inputMode)

return noteskin