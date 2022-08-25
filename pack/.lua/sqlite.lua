local u = require('utils')
local lsqlite3 = require("lsqlite3")
local dbm = lsqlite3.open_memory()

-- http://lua.sqlite.org/index.cgi/doc/tip/doc/lsqlite3.wiki
-- https://www.sqlite.org/datatype3.html

local SQL = {}

SQL.init_calculation = function()
	if dbm:exec(LoadAsset("sql/calculation.sql")) > 0 then
		print(dbm:errmsg())
		error("can't create tables")
	end
end

SQL.query = function()
    return dbm:rows("SELECT suitId, suitName FROM suit")
end

SQL.test = function()
    for suit in SQL.query() do u.fprint(suit) end
end

return SQL
