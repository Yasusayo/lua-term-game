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

local function get_xy (str)
	local count = 0
	local t = {}
	local exp = "%S+"
	for word in string.gmatch(str, exp) do
		table.insert(t, word)
		count = count + 1
		if count == 2 then
			break
		end
	end
	return t
end

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
	local t = get_xy(input)
	if #t == 2 then
		if tonumber(t[1]) and tonumber(t[2]) then
			local x = tonumber(t[1])
			local y = tonumber(t[2])
			if x >= 1 and x <= w and y >= 1 and y <= h then move(x, y) end
		end
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
