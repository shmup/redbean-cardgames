local lsqlite3 = require("lsqlite3")

-- http://lua.sqlite.org/index.cgi/doc/tip/doc/lsqlite3.wiki
-- https://www.sqlite.org/datatype3.html

local SQL = {}

SQL.init_calculation = function()
	local dbm = lsqlite3.open_memory()
	if dbm:exec(LoadAsset("sql/calculation.sql")) > 0 then
		print(dbm:errmsg())
		error("can't create tables")
	end
end

return SQL
