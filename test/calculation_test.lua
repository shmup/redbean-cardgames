package.path = ".lua/?.lua;" .. package.path

local calc = require("calculation")
local card = require("card")

local c = card.cardify(42)
assert(c[3] == "🂣")

calc.init()
calc.set_talon({13, 12, 11, 10, 9, 8, 7, 6, 5, 17, 16, 15, 14})

local top_talon = calc.view_talon()
assert(top_talon == 14)

calc.play_topcard(1)
calc.play_topcard(2)
calc.play_topcard(3)
calc.play_topcard(4)
calc.pack_topcard(1)
calc.play_topcard(3)
calc.play_topcard(3)
calc.pack_topcard(2)
calc.play_topcard(4)
calc.play_topcard(3)
calc.pack_topcard(3)
calc.pack_topcard(4)
calc.play_topcard(4)

top_talon = calc.view_talon()
assert(top_talon == 13)

print(calc.text_render())
