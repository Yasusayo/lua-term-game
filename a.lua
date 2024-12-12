local w, h = 15, 9
local map = {}
local map_1 = {
	"...............",
	"...............",
	"...............",
	"...............",
	"...............",
	"...............",
	"...............",
	"...............",
	"...............",
}

local function alter (str, id, c)
	return str:sub(1, id-1) .. c .. str:sub(id+1)
end

local function clone_map (_target)
	for i, v in ipairs(_target) do
		map[i] = v
	end
end

local function move (x, y)
	clone_map(map_1)
	map[y] = alter(map[y], x, "X")
end

local function draw_map ()
	for _, s in ipairs(map) do
		print(s)
	end
end

local function handle_input (input)
	if tonumber(input) then
		local x = tonumber(input)
		if x >= 1 and x <= w then move(x, 5) end
	end
end

move(8, 5)

local input = ""
while input ~= "quit" do
	os.execute("clear")
	draw_map()
	input = io.read()
	handle_input(input)
end
