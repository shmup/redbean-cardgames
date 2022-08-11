.PHONY: all clean test

ZIP=zip.com
ZIP_DL=https://redbean.dev/zip.com
UNZIP=unzip.com
UNZIP_DL=https://redbean.dev/unzip.com
REDBEAN_DL=https://redbean.dev/redbean-asan-2.0.16.com
	REDBEAN=redbean.com
	PID=redbean.pid

all: add

${REDBEAN}.template:
	curl -Rs ${REDBEAN_DL} -o $@ && \
		chmod +x ${@}

${REDBEAN}: ${REDBEAN}.template
	cp ${REDBEAN}.template ${REDBEAN}

${ZIP}:
	curl -Rso ${ZIP} ${ZIP_DL}

add: ${ZIP} ${REDBEAN}
	cp -f ${REDBEAN}.template ${REDBEAN}
	cd srv/ && ../${ZIP} -r ../${REDBEAN} `ls -A`

unzip.com: ; curl -Rs ${ZIP_DL} -o $@
ls: unzip.com
	@unzip -vl ./${REDBEAN} | grep -v \
		'usr/\|.symtab'

log: redbean.log
	tail -f redbean.log

dev:
	@(test ! -f ${PID} && make --no-print-directory add && make --no-print-directory start-daemon) || \
		(make --no-print-directory stop-daemon && \
		make --no-print-directory add && \
		make --no-print-directory start-daemon && \
		make --no-print-directory log)

start: ${REDBEAN}
	./${REDBEAN} -vv

start-daemon: ${REDBEAN}
	@(test ! -f ${PID} && \
		./${REDBEAN} -vv -d -L redbean.log -P ${PID} && \
		printf "🦞 started $$(cat ${PID})\n") \
		|| echo "🦞 already running $$(cat ${PID})"

restart-daemon:
	@(test ! -f ${PID} && \
		./${REDBEAN} -vv -d -L redbean.log -P ${PID} && \
		printf "🦞 started $$(cat ${PID})") \
		|| kill -HUP $$(cat ${PID}) && \
		printf "🦞 restarted $$(cat ${PID})\n"

stop-daemon: ${PID}
	@kill -TERM $$(cat ${PID}) && \
		printf "🦞 stopped $$(cat ${PID})\n" && \
		rm ${PID} \

clean:
	rm -f redbean.log ${PID} ${REDBEAN} ${REDBEAN}.template  unzip.com

test:
	checkmake Makefile
	lua test/calculation_test.lua
