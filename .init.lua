local fm = require("fullmoon")

function Init(msg)
	fm.setRoute("/favicon.ico", fm.serveAsset("favicon-32x32.png"))
	fm.setRoute("/static/*", fm.serveAsset)

	fm.setRoute("/", function()
		return msg
	end)
end

fm.run()

Init("TODO: Everything")
