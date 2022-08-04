package.path = ".lua/?.lua;" .. package.path

local calc = require("calculation")
local card = require("card")

local c = card.cardify(42)
assert(c[3] == "🂣")

calc.init()
calc.pack_topcard(1)
calc.pack_topcard(1)
calc.pack_topcard(1)
calc.pack_topcard(2)
calc.pack_topcard(3)
calc.pack_topcard(4)

print(calc.render())
