--
-- Calculation solitaire
-- Copyright 2022 Jared Miller
--

--[[
https://en.wikipedia.org/wiki/Calculation_(card_game)
https://en.wikipedia.org/wiki/Glossary_of_patience_terms

A  2  3  4  5  6  7  8  9  0  J  Q  K
2  4  6  8  0  Q  A  3  5  7  9  J  K
3  6  9  Q  2  5  8  J  A  4  7  0  K
4  8  Q  3  7  J  2  6  0  A  5  9  K
--]]

-- Returns true if called from script, false if from a library
local is_main = not pcall(debug.getlocal, 4, 1)
local utils = require("utils")

local talon = {}
local tableau = {}
local foundations = {}

local init = function()
	-- build talon and shuffle
	local n = 5
	for i = n, 52 do
		talon[i - (n - 1)] = i
	end
	-- talon = utils.shuffle(talon)

	for i = 1, 4 do
		tableau[i] = {}
	end

	for i = 1, 4 do
		foundations[i] = {}
	end
end

local play = function(card, i)
	table.insert(foundations[i], card)
end

local pack = function(card, i)
	table.insert(tableau[i], card)
end

local pack_topcard = function(i)
	pack(table.remove(talon, 1), i)
end

local play_topcard = function(i)
	play(table.remove(talon, 1), i)
end

local play_tableau = function(i, j)
	play(table.remove(tableau[i], 1), j)
end

local view_topcard = function()
	return talon[1]
end

local template = [[
  A:%s
  2:%s
  3:%s
  4:%s

          %s
]]

local render = function()
	local output =
		string.format(
			template,
			utils.t_to_s(tableau[1]),
			utils.t_to_s(tableau[2]),
			utils.t_to_s(tableau[3]),
			utils.t_to_s(tableau[4]),
                        view_topcard()
		)
	-- string.format('%q', 'a string with "quotes" and \n new line')

	print(output)
	return output
end

local calc = setmetatable(
	{
		_VERSION = 0.1,
		_COPYRIGHT = "Jared Miller",
		init = init,
		jared = function()
			return "miller"
		end,
		pack_topcard = pack_topcard,
		play_topcard = play_topcard,
		play_tableau = play_tableau,
		view_topcard = view_topcard,
		render = render,
	},
	{}
)

if is_main then
	assert(calc._VERSION == 0.1)
end

return calc
