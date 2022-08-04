.PHONY: all add rm ls run log run-daemon restart-daemon stop-daemon clean test

all: add

redbean.com:
	curl https://redbean.dev/redbean-latest.com >redbean.com
	chmod +x redbean.com

add: redbean.com
	@zip redbean.com \
		.init.lua .reload.lua \
		.lua/* \
		static/* \
		404.html \
		favicon-32x32.png
rm: redbean.com
	@zip -d redbean.com \
		.init.lua .reload.lua \
		.lua/* \
		static/* \
		404.html \
		favicon-32x32.png

ls: redbean.com
	@unzip -vl redbean.com | grep -v \
		'usr/\|.symtab'

log: ; tail -f redbean.log

start: redbean.com
	./redbean.com -vv

start-daemon: redbean.com
	@(test ! -f redbean.pid && \
		./redbean.com -vv -d -L redbean.log -P redbean.pid && \
		printf "\n🦞 started $$(cat redbean.pid)\n") \
		|| echo "🦞 already running $$(cat redbean.pid)"

restart-daemon: redbean.pid
	@kill -HUP $$(cat redbean.pid)
	@printf "\n🦞 restarted $$(cat redbean.pid)\n"

stop-daemon: redbean.pid
	@kill -TERM $$(cat redbean.pid) && \
		printf "\n🦞 stopped $$(cat redbean.pid)\n" && \
		rm redbean.pid \

clean: redbean.log redbean.pid
	rm redbean.log redbean.pid

test:
	@lua ./test/calculation_test.lua
