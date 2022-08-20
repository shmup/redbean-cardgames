local fm = require("fullmoon")
local calculation = require("calculation")

fm.setRoute("/favicon.ico", fm.serveAsset("/static/suits.png"))
fm.setRoute("/js/*", fm.serveAsset)
fm.setRoute("/css/*", fm.serveAsset)
fm.setRoute("/img/*", fm.serveAsset)
fm.setRoute("/calculation", fm.serveAsset("/templates/calculation.html"))
fm.setRoute("/cascades", fm.serveAsset("/templates/cascades.html"))

fm.setRoute("/", function()
	return [[
      <p>Current WIP:</p>
      <ul>
        <li><a href="/calculation">Calculation</a> - Laying out the groundwork, not an actual game yet</li>
      </ul>
    ]]
end)

fm.setRoute("/api/v1/calculation/init", function()
	return fm.serveContent("json", calculation.init())
end)

fm.setRoute("/api/v1/calculation/talon", function()
	return fm.serveContent("json", { id = 15 })
end)

fm.setRoute(fm.POST{ "/api/v1/calculation/pack_topcard/:t_id[%d]" }, function(r)
	local tableau_id = tonumber(r.params.t_id)

	calculation.pack_topcard(tableau_id)

	return fm.serveContent("json", {
		success = true,
		card_id = tableau_id,
	})
end)

fm.setTemplate("404", fm.serveAsset("/templates/404.html"))

fm.run()
