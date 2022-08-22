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
local tableaus = {}
local foundations = {}

local set_talon = function(t)
	talon = t
end

local view_topcard = function(t)
	return t[#t]
end

local view_talon = function()
	local topcard = view_topcard(talon)
	return topcard or 0
end

local view_tableau = function(i)
	local topcard = view_topcard(tableaus[i])
	return topcard or 0
end

local validate_play = function(card_index, foundation_index)
	local value = c.cards[card_index][1]
	local top_index = view_topcard(foundations[foundation_index]) or 0
	local top = c.cards[top_index][1]
	-- print(value, foundation_index, c.cards[top][1])
	return value - foundation_index == 0 or value - top == foundation_index
end

-- local you_win = function()
-- 	for i = 1, 4 do
-- 		if #tableaus[i] ~= 0 then
-- 			return false
-- 		end
-- 	end

-- 	return #talon == 0
-- end

local play = function(card, foundation_index)
	table.insert(foundations[foundation_index], card)
end

local pack = function(card, tableau_index)
	table.insert(tableaus[tableau_index], card)
end

local pack_topcard = function(tableau_index)
	pack(table.remove(talon, #talon), tableau_index)
end

local play_topcard = function(i)
	if validate_play(view_talon(), i) then
		play(table.remove(talon, #talon), i)
	end
end

local get_card = function(t, i)
	return table.remove(t, i)
end

local play_tableau = function(i, j)
	if validate_play(view_tableau(i), j) then
		play(table.remove(tableaus[i], #tableaus[i]), j)
	end
end

local get_top_tableaus = function()
	local t1 = view_topcard(tableaus[1]) or 0
	local t2 = view_topcard(tableaus[2]) or 0
	local t3 = view_topcard(tableaus[3]) or 0
	local t4 = view_topcard(tableaus[4]) or 0

	return { t1, t2, t3, t4 }
end

--  🂱: 🃁
--  🂲: 🃂
--  🂳: 🃃🂶🂹
--  🂴: 🃄🂸🂽

--  [🂵🂷🂺🂻]  [🂾]
local template =
	[=[

    [%s: %s]
    [%s: %s]
    [%s: %s]
    [%s: %s]

    [%s] [%s]
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

local init = function()
	local n = 1
	local unsorted_talon = {}
	for i = n, 52 do
		unsorted_talon[i - (n - 1)] = i
	end

	for i = 1, 4 do
		foundations[i] = { get_card(unsorted_talon, 1) }
	end

	talon = u.shuffle(unsorted_talon)

	for i = 1, 4 do
		tableaus[i] = { 0 }
	end

	return {
		talonTopCard = view_topcard(talon),
		tableaus = tableaus,
		foundations = foundations,
	}
end

local calc = setmetatable(
	{
		_VERSION = 0.3,
		_COPYRIGHT = "Jared Miller",
		init = init,
		pack_topcard = pack_topcard,
		play_topcard = play_topcard,
		play_tableau = play_tableau,
		get_card = get_card,
		set_talon = set_talon,
		view_talon = view_talon,
		view_tableau = view_tableau,
		text_render = text_render,
	},
	{}
)

if is_main then
	assert(calc._VERSION == 0.1)
end

return calc
