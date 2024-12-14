--player

local x, y = 8, 5

return {
	spr = "X",

	update = function (t, map)
		if #t >= 2 then
			local dict = map.get_dict_indicator()
			if dict[t[1]] and dict[t[2]] then
				local _x = dict[t[1]]
				local _y = dict[t[2]]
				if _x >= 1 and _x <= map.w and _y >= 1 and _y <= map.h then
					x = _x
					y = _y
				end
			end
		end
	end,

	draw = function ()
		--print(string.format("x: %i | y: %i", x, y))
	end,

	get_xy = function ()
		return x, y
	end
}
