.PHONY: all clean test

PROJECT=cardgames
REDBEAN=${PROJECT}.com
REDBEAN_VERSION=2.0.16
REDBEAN_DL=https://redbean.dev/redbean-${REDBEAN_VERSION}.com

ZIP=zip.com
ZIP_DL=https://redbean.dev/zip.com
UNZIP=unzip.com
UNZIP_DL=https://redbean.dev/unzip.com

NPD=--no-print-directory

all: add

${REDBEAN}.template:
	curl -Rs ${REDBEAN_DL} -o $@ && \
		chmod +x ${@}

${REDBEAN}: ${REDBEAN}.template
	cp ${REDBEAN}.template ${REDBEAN}

${ZIP}:
	curl -Rso ${ZIP} ${ZIP_DL}
	chmod +x ${ZIP}

bundle-js: bin/genmap js/libs/utils.js js/libs/dnd.js js/libs/mithril.js js/calculation.js
	cd srv/js && ../../bin/genmap.sh libs/utils.js libs/dnd.js libs/mithril.js calculation.js

add: ${ZIP} ${REDBEAN}
	cp -f ${REDBEAN}.template ${REDBEAN}
	cd srv/ && ../${ZIP} -r ../${REDBEAN} `ls -A`

unzip.com: ; curl -Rs ${ZIP_DL} -o $@
ls: unzip.com
	@unzip -vl ./${REDBEAN} | grep -v \
		'usr/\|.symtab'

log: ${PROJECT}.log
	@tail -f ${PROJECT}.log

minify:
	@echo "TODO: https://github.com/coderaiser/minify"

dev:
	@(test ! -f ${PROJECT}.pid && $(MAKE) ${NPD} add && $(MAKE) ${NPD} start-daemon) || \
		($(MAKE) ${NPD} test && \
		$(MAKE) ${NPD} stop-daemon && $(MAKE) ${NPD} add && $(MAKE) ${NPD} start-daemon)
	@$(MAKE) ${NPD} log

start: ${REDBEAN}
	./${REDBEAN} $(ARGS)

start-verbose:
	$(MAKE) start ARGS="-vv"

start-daemon: ${REDBEAN}
	@(test ! -f ${PROJECT}.pid && \
		./${REDBEAN} $(ARGS) -d -L ${PROJECT}.log -P ${PROJECT}.pid && \
		printf "🦞 started $$(cat ${PROJECT}.pid)\n") \
		|| echo "🦞 already running $$(cat ${PROJECT}.pid)"

start-verbose-daemon:
	$(MAKE) start-daemon ARGS="-vv"

restart-daemon:
	@(test ! -f ${PROJECT}.pid && \
		./${REDBEAN} $(ARGS) -d -L ${PROJECT}.log -P ${PROJECT} && \
		printf "🦞 started $$(cat ${PROJECT}.pid)") \
		|| kill -HUP $$(cat ${PROJECT}.pid) && \
		printf "🦞 restarted $$(cat ${PROJECT}.pid)\n"

stop-daemon: ${PROJECT}.pid
	@kill -TERM $$(cat ${PROJECT}.pid) && \
		printf "🦞 stopped $$(cat ${PROJECT}.pid)\n" && \
		rm ${PROJECT}.pid \

clean:
	rm -f ${PROJECT}.log ${PROJECT}.pid ${REDBEAN} ${REDBEAN}.template ${ZIP} ${UNZIP}

test:
	checkmake Makefile
	lua test/calculation_test.lua
