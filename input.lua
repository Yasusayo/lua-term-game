--input

return {
	get_table = function ()
		local input = io.read()
		local exp = "%S+"
		local t = {}
		for word in string.gmatch(input, exp) do
			table.insert(t, word)
		end
		return t
	end
}
