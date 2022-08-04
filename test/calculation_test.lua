package.path = ".lua/?.lua;" .. package.path

local calc = require("calculation")
local card = require("card")

local c = card.cardify(42)
assert(c[3] == "🂣")

calc.init()

local top_talon = calc.view_talon()
assert(top_talon == 52)

calc.pack_topcard(1)
calc.play_topcard(1)
calc.play_topcard(1)
calc.pack_topcard(2)
calc.play_topcard(2)
calc.pack_topcard(3)
calc.play_topcard(3)

top_talon = calc.view_talon()
assert(top_talon == 45)

print(calc.text_render())
