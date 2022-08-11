local fm = require("fullmoon")

fm.setRoute("/favicon.ico", fm.serveAsset("/static/suits.png"))
fm.setRoute("/css/*", fm.serveAsset)
fm.setRoute("/img/*", fm.serveAsset)
fm.setRoute("/calculation", fm.serveAsset("/templates/calculation.html"))

fm.setRoute("/", function()
        return "TODO: Everything"
end)

fm.setTemplate("404", fm.serveAsset("/templates/404.html"))

fm.run()
