.PHONY: all add rm ls run run-daemon restart-daemon stop-daemon clean test

all: add

add:
	@zip redbean.com \
		.init.lua .reload.lua \
		.lua/fullmoon.lua \
		.lua/haggis.lua
rm:
	@zip -d redbean.com \
		.init.lua .reload.lua \
		.lua/fullmoon.lua \
		.lua/haggis.lua
ls:
	@unzip -vl redbean.com | grep -v \
		'usr/\|.symtab\|help.txt\|redbean.png\|favicon.ico'

start:
	./redbean.com -vv

start-daemon:
	@(test ! -f redbean.pid && \
		./redbean.com -vv -d -L redbean.log -P redbean.pid && \
		echo started $$(cat redbean.pid)) \
		|| echo "$$(cat redbean.pid) - redbean already running"

restart-daemon: redbean.pid
	@kill -HUP $$(cat redbean.pid)

stop-daemon: redbean.pid
	@kill -TERM $$(cat redbean.pid) && \
		echo stopped $$(cat redbean.pid) && \
		rm redbean.pid \

clean: redbean.log redbean.pid
	rm redbean.log redbean.pid

test: ; @echo TODO
