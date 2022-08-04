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
local c = require("card")
local u = require("utils")

local talon = {}
local tableau = {}
local foundations = {}

local init = function()
	local n = 5
	for i = n, 52 do
		talon[i - (n - 1)] = i
	end

	for i = 1, 4 do
		tableau[i] = {}
	end

	for i = 1, 4 do
		foundations[i] = {}
	end
end

local play = function(card, foundation_index)
	table.insert(foundations[foundation_index], card)
end

local pack = function(card, tableau_index)
	table.insert(tableau[tableau_index], card)
end

local pack_topcard = function(tableau_index)
	pack(table.remove(talon, #talon), tableau_index)
end

local play_topcard = function(i)
	play(table.remove(talon, #talon), i)
end

local play_tableau = function(i, j)
	play(table.remove(tableau[i], #tableau[i]), j)
end

local view_tableau = function()
	return talon[1]
end

local view_topcard = function(t)
	return t[#t]
end

local get_top_tableaus = function()
	local t1 = view_topcard(tableau[1])
	local t2 = view_topcard(tableau[2])
	local t3 = view_topcard(tableau[3])
	local t4 = view_topcard(tableau[4])

	return { t1, t2, t3, t4 }
end

local view_talon = function()
	return view_topcard(talon)
end

--  🂱: 🂭🂫
--  🂲: 🂩
--  🂳: 🂧
--  🂴:

--  [🂮🂪🂨]  [🂦]

local template = [=[

    %s: %s
    %s: %s
    %s: %s
    %s: %s

    [%s]  [%s]
]=]

local text_render = function()
	local output =
		string.format(
			template,
			c.picture(1),
			u.t_to_s(c.pictures(foundations[1])),
			c.picture(2),
			u.t_to_s(c.pictures(foundations[2])),
			c.picture(3),
			u.t_to_s(c.pictures(foundations[3])),
			c.picture(4),
			u.t_to_s(c.pictures(foundations[4])),
			u.t_to_s(c.pictures(get_top_tableaus())),
			c.picture(view_talon())
		)
	return output
end

local calc = setmetatable(
	{
		_VERSION = 0.1,
		_COPYRIGHT = "Jared Miller",
		init = init,
		pack_topcard = pack_topcard,
		play_topcard = play_topcard,
		play_tableau = play_tableau,
		view_talon = view_talon,
		text_render = text_render,
	},
	{}
)

if is_main then
	assert(calc._VERSION == 0.1)
end

return calc
