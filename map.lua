--map

local w, h = 15, 9
local map = {}
local PLAIN = 1
local current_map = -1

local function init_maps ()
	--PLAIN
	table.insert(map, {
		"...............",
		"...............",
		"...............",
		"...............",
		"...............",
		"...............",
		"...............",
		"...............",
		"..............."
	})
end

return {
	init = function ()
		init_maps()
		current_map = PLAIN
	end,

	draw = function ()
		for _, l in ipairs(map[current_map]) do print(l) end
	end
}
