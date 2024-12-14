--main

local map = require 'map'
local input = require 'input'
local player = require 'player'

local running = true

-------------------------------------------------------

local draw = function ()
	map.draw(player)
	player.draw()
end

local update = function ()
	local t = input.get_table()
	if t[1] == "quit" then
		running = false
	else
		player.update(t, map)
	end
end

-------------------------------------------------------

map.init()

-------------------------------------------------------

while running do
	os.execute("clear")
	draw()
	update()
end

