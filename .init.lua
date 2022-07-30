local fm = require("fullmoon")

function Init(msg)
    fm.setRoute("/", function()
        return msg
    end)
end

fm.run()

Init("TODO: Everything")
