local u = require("utils")
local lsqlite3 = require("lsqlite3")
local dbm = lsqlite3.open_memory()

-- http://lua.sqlite.org/index.cgi/doc/tip/doc/lsqlite3.wiki
-- https://www.sqlite.org/datatype3.html

local SQL = {}

SQL.init_calculation = function()
	if dbm:exec(
		"PRAGMA foreign_keys = ON;" .. LoadAsset("sql/calculation.sql")
	) > 0 then
		print(dbm:errmsg())
		error("can't create tables")
	end
end

SQL.query = function(stmt)
	return dbm:rows(stmt)
end

SQL.test = function()
	local q =
		[[
    SELECT cardId, suitName, cardRank FROM card
    INNER JOIN suit ON card.suitId = suit.suitId
    ]]
	for suit in SQL.query(q) do
		u.pprint(suit)
	end
end

return SQL
