.PHONY: all add rm ls run log run-daemon restart-daemon stop-daemon clean test force FORCE

REDBEAN=redbean.com
HOST=https://redbean.dev
PID=redbean.pid

all: ${REDBEAN} test

FORCE: ;
forcebean.com: FORCE
	@cp -p ${REDBEAN}.template ${REDBEAN}
	@chmod +x ${REDBEAN}

${REDBEAN}.template: ; curl -Rs ${HOST}/redbean-asan-2.0.16.com -o $@
${REDBEAN}: ${REDBEAN}.template
	cp ${REDBEAN}.template ${REDBEAN}
	chmod +x ${REDBEAN}

add: ${REDBEAN}.template forcebean.com
	@${REDBEAN} \
		-A .init.lua -A .reload.lua -A .lua \
		-A static -A templates

unzip.com: ; curl -Rs ${HOST}/unzip.com -o $@
ls: unzip.com
	@unzip -vl ${REDBEAN} | grep -v \
		'usr/\|.symtab'

log: redbean.log
	tail -f redbean.log

start: ${REDBEAN}
	./${REDBEAN} -vv

start-daemon: ${REDBEAN}
	@(test ! -f ${PID} && \
		./${REDBEAN} -vv -d -L redbean.log -P ${PID} && \
		printf "\n🦞 started $$(cat ${PID})\n") \
		|| echo "🦞 already running $$(cat ${PID})"

restart-daemon: ${PID}
	@kill -HUP $$(cat ${PID})
	@printf "\n🦞 restarted $$(cat ${PID})\n"

stop-daemon: ${PID}
	@kill -TERM $$(cat ${PID}) && \
		printf "\n🦞 stopped $$(cat ${PID})\n" && \
		rm ${PID} \

clean:
	rm -f redbean.log ${PID} ${REDBEAN} ${REDBEAN}.template

test:
	@lua ./test/calculation_test.lua
