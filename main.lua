--main

local map = require 'map'
local input = require 'input'

local running = true

-------------------------------------------------------

local draw = function ()
	map.draw()
end

local update = function ()
	local t = input.get_table()
	if t[1] == "quit" then running = false end
end

-------------------------------------------------------

map.init()

-------------------------------------------------------

while running do
	os.execute("clear")
	draw()
	update()
end

