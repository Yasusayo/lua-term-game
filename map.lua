--map

local map = {}
local PLAIN = 1
local current_map = -1
local edit = {}
local h_indicator = "+123456789abcdef+"
local v_indicator = {"1", "2", "3", "4", "5", "6", "7", "8", "9"}
local dict_indicator = {}

local function init_dict_indicator ()
	local t = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f"}
	for i, v in ipairs(t) do dict_indicator[v] = i end
end

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

local function draw_map ()
	print(h_indicator)
	for i, l in ipairs(edit) do print(v_indicator[i] .. l .. v_indicator[i]) end
	print(h_indicator)
end

local function add_player (player)
	local x, y = player.get_xy()
	local str = edit[y]
	edit[y] = str:sub(1, x-1) .. player.spr .. str:sub(x+1) 
end

local function clone_map ()
	for i, l in ipairs(map[current_map]) do edit[i] = l end
end

return {
	w = 15,
	h = 9,

	init = function ()
		init_maps()
		init_dict_indicator()
		current_map = PLAIN
	end,

	get_dict_indicator = function ()
		return dict_indicator
	end,

	draw = function (player)
		clone_map()
		add_player(player)
		draw_map()
	end
}
