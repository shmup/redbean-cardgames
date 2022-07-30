-- It's possible to modify global interpreter state later on in the server's
-- lifecycle. When running in daemon mode, using kill -HUP $(cat redbean.pid)
-- will instruct redbean to run the code in .reload.lua from the main process,
-- will will be lazily propagated to client connections.

require "haggis"
