.PHONY: all add rm ls run run-daemon restart-daemon stop-daemon clean test

all: add

add:
	@zip redbean.com \
		.init.lua \
		.reload.lua \
		.lua/fullmoon.lua \
		.lua/haggis.lua
rm:
	@zip -d redbean.com \
		.init.lua \
		.reload.lua \
		.lua/fullmoon.lua \
		.lua/haggis.lua
ls:
	@unzip -vl redbean.com | grep -v \
		'usr/\|.symtab\|help.txt\|redbean.png\|favicon.ico'

run:
	./redbean.com

run-daemon:
	./redbean.com -vv -d -L redbean.log -P redbean.pid

restart-daemon: redbean.pid
	@kill -HUP $$(cat redbean.pid)

stop-daemon: redbean.pid
	@kill -TERM $$(cat redbean.pid)
	@echo kill -TERM $$(cat redbean.pid)

clean: redbean.log redbean.pid
	rm redbean.log redbean.pid

test: ; @echo TODO
