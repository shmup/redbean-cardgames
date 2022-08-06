local fm = require("fullmoon")

function Init(msg)
	fm.setRoute("/favicon.ico", fm.serveAsset("/static/suits.png"))
	fm.setRoute("/static/*", fm.serveAsset)
	fm.setRoute("/templates/*", fm.serveAsset)
	fm.setRoute("/calculation", fm.serveAsset("/templates/calculation.html"))

	fm.setRoute("/", function()
		return msg
	end)

        fm.setTemplate("404", fm.serveAsset("/templates/404.html"))
end

fm.run()

Init("TODO: Everything")
