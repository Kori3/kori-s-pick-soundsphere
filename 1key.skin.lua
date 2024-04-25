local NoteSkinVsrg = require("sphere.models.NoteSkinModel.NoteSkinVsrg")
local BasePlayfield = require("sphere.models.NoteSkinModel.BasePlayfield")
local JustConfig = require("sphere.JustConfig")
local root = (...):match("(.+)/.-")
local config = JustConfig:fromFile(root .. "/configs/1key.config.lua")
local sphereElements = require(root .. "/Modules/SphereElements")

local noteskin = NoteSkinVsrg({
    path = ...,
	name = "Kori's Pick",
	inputMode = "1key",
	range = {-1, 1},
	unit = 1080,
	config = config,
	hitposition = 1051,
})

local playfield = BasePlayfield(noteskin)

noteskin:setInput({"key1",})

noteskin:setColumns({
	offset = 0,
	align = "center",
	width = {217},
	space = {0, 0},
})

noteskin:setTextures({
	{pixel = "pixel.png"},
    {lnbody = "note/LNB.png"},
    {lntail = "note/LNT.png"},
    {lnhead = "note/LNH.png"},
    {note =   "note/NOT.png"},
})

noteskin:setImagesAuto()

noteskin:setShortNote({
	image = {"note",},
	h = 126,
})

noteskin:setLongNote({
    head = {"lnhead",}, body = {"lnbody",}, tail = {"lntail",},
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
	pressed = {"key/scale0.png",},
	released = {"key/scale0.png",},
})

playfield:addNotes()

playfield:disableCamera()

sphereElements.theThing(noteskin, playfield)

return noteskin