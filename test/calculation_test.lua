package.path = "srv/.lua/?.lua;" .. package.path

local calc = require("calculation")
local card = require("card")

local c = card.cardify(42)
assert(c[3] == "🂣")

calc.init()
calc.set_talon({3, 15, 2, 1})

calc.play_topcard(1)
calc.play_topcard(1)
calc.pack_topcard(1)
calc.play_topcard(1)

local top_tableau = calc.view_tableau(1)

calc.play_tableau(1, 2)

print(calc.text_render())
