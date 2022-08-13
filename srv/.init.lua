local fm = require("fullmoon")

fm.setRoute("/favicon.ico", fm.serveAsset("/static/suits.png"))
fm.setRoute("/js/*", fm.serveAsset)
fm.setRoute("/css/*", fm.serveAsset)
fm.setRoute("/img/*", fm.serveAsset)
fm.setRoute("/calculation", fm.serveAsset("/templates/calculation.html"))
fm.setRoute("/cascades", fm.serveAsset("/templates/cascades.html"))

fm.setRoute("/", function()
	return "TODO: Everything"
end)

fm.setRoute("/api/v1/talon", function()
	return fm.serveContent("json", { id = 15 })
end)

fm.setTemplate("404", fm.serveAsset("/templates/404.html"))

fm.run()
