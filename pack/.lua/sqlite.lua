local u = require("utils")
local lsqlite3 = require("lsqlite3")
local dbm = lsqlite3.open_memory()

-- http://lua.sqlite.org/index.cgi/doc/tip/doc/lsqlite3.wiki
-- https://www.sqlite.org/datatype3.html

local SQL = {}

SQL.init_calculation = function()
	if dbm:exec(
		"PRAGMA foreign_keys = ON;" .. LoadAsset("sql/calculation/create.sql")
	) > 0 then
		print(dbm:errmsg())
		error("can't create tables")
	end
end

SQL.query = function(stmt)
	return dbm:rows(stmt)
end

SQL.getTopCards = function()
	local q = LoadAsset("sql/calculation/select_top_cards.sql")
	for state in SQL.query(q) do
		u.pprint(state)
	end
end

SQL.suits = function()
	local q =
		[[
    SELECT card.id, suitName, cardRank FROM card
    INNER JOIN suit ON suitId = suit.id
    ]]
	for suit in SQL.query(q) do
		u.pprint(suit)
	end
end

SQL.test = function()
	SQL.getTopCards()
end

return SQL
