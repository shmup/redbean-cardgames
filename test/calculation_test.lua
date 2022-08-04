package.path = ".lua/?.lua;" .. package.path

local calc = require('calculation')

calc.init()
calc.pack_topcard(1)
calc.pack_topcard(1)
calc.pack_topcard(1)
calc.pack_topcard(1)
calc.render()
