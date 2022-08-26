local U = {}

U.log = function(tbl)
	for i in ipairs(tbl) do
		print(i)
	end
end

U.shuffle = function(t)
	math.randomseed(os.time()) -- so that the results are always different
	local s = {}
	for i = 1, #t do
		s[i] = t[i]
	end
	for i = #t, 2, -1 do
		local j = math.random(i)
		s[i], s[j] = s[j], s[i]
	end
	return s
end

U.t_to_s = function(t)
	local s = ""
	for i = 1, #t do
		s = s .. "" .. t[i]
	end
	return s
end

U.pprint = function(tbl)
    print(EncodeLua(tbl))
end

return U
