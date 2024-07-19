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
noteskin:setInput({"key1"})
noteskin:setColumns({
	offset = 0,
	align = "center",
	width = {217},
	space = {0, 0},
})

noteskin:setTextures({
	{pixel = "pixel.png"},
	{note = "note/NOT.png"},
	{lntail = "note/LNT.png"},
    {lnbody = "note/LNB.png"},
    {lnhead = "note/LNH.png"},
})

noteskin:setImagesAuto()
noteskin:setShortNote({h = 126,
	image = {"note"},
})

noteskin:setLongNote({h = 126,
    head = {"lnhead"}, 
	body = {"lnbody"}, 
	tail = {"lntail"},
})

if config:get("barline") == true then
	noteskin:addMeasureLine({h = 2,
		color = {1, 1, 1, 0.2},
		image = "pixel"
	})
end

noteskin:addBga({x = 0, y = 0, w = 1, h = 1,
	color = {0.25, 0.25, 0.25, 1}
})

playfield:addBga({
	transform = {{1 / 2, -16 / 9 / 2}, {0, -7 / 9 / 2}, 0, {0, 16 / 9}, {0, 16 / 9}, 0, 0, 0, 0}
})

playfield:addColumnsBackground({
	color = {0, 0, 0, 1},
})

playfield:enableCamera()
playfield:addKeyImages({h = 154,
	padding = 0,
	pressed = {"key/scale0.png",},
	released = {"key/scale0.png",},
})

playfield:addNotes()
playfield:disableCamera()
sphereElements.theThing(noteskin, playfield, noteskin.inputMode, noteskin.columnsCount)

return noteskin