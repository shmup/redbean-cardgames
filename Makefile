.PHONY: all clean test log ls log minify
.PHONY: dev start start-dirmon start-daemon restart-daemon stop-daemon

PROJECT=cardgames
REDBEAN=${PROJECT}.com
REDBEAN_VERSION=2.0.16
VOICE=-v -v
REDBEAN_DL=https://redbean.dev/redbean-${REDBEAN_VERSION}.com

ZIP=zip.com
ZIP_DL=https://redbean.dev/zip.com
UNZIP=unzip.com
UNZIP_DL=https://redbean.dev/unzip.com

NPD=--no-print-directory

all: add

${REDBEAN}.template:
	curl -s ${REDBEAN_DL} -o $@ -z $@ && \
		chmod +x $@

${REDBEAN}: ${REDBEAN}.template
	cp ${REDBEAN}.template ${REDBEAN}

${ZIP}:
	curl -s ${ZIP_DL} -o $@ -z $@
	chmod +x ${ZIP}

minify: ; @echo "TODO: https://github.com/coderaiser/minify"

bundle-js: bin/genmap js/libs/utils.js js/libs/dnd.js js/libs/mithril.js js/calculation.js
	cd srv/js && ../../bin/genmap.sh libs/utils.js libs/dnd.js libs/mithril.js calculation.js

add: ${ZIP} ${REDBEAN}
	cp -f ${REDBEAN}.template ${REDBEAN}
	cd srv/ && ../${ZIP} -r ../${REDBEAN} `ls -A`

add-pack: ${ZIP} ${REDBEAN}
	cp -f ${REDBEAN}.template ${REDBEAN}
	cd pack/ && ../${ZIP} -r ../${REDBEAN} `ls -A`

unzip.com: ; curl -s ${ZIP_DL} -o $@ -z $@
ls: unzip.com
	@unzip -vl ./${REDBEAN} | grep -v \
		'usr/\|.symtab'

log: ${PROJECT}.log
	@tail -f ${PROJECT}.log

start: ${REDBEAN}
	./${REDBEAN} ${VOICE} $(ARGS)


start-daemon: ${REDBEAN}
	@(test ! -f ${PROJECT}.pid && \
		./${REDBEAN} ${VOICE} $(ARGS) -d -L ${PROJECT}.log -P ${PROJECT}.pid && \
		printf "🦞 started $$(cat ${PROJECT}.pid)\n") \
		|| echo "🦞 already running $$(cat ${PROJECT}.pid)"
start-dirmon: ; @$(MAKE) ${NPD} start-daemon ARGS="-D srv"

restart-daemon:
	@(test ! -f ${PROJECT}.pid && \
		./${REDBEAN} ${VOICE} $(ARGS) -d -L ${PROJECT}.log -P ${PROJECT} && \
		printf "🦞 started $$(cat ${PROJECT}.pid)") \
		|| kill -HUP $$(cat ${PROJECT}.pid) && \
		printf "🦞 restarted $$(cat ${PROJECT}.pid)\n"

stop-daemon: ${PROJECT}.pid
	@kill -TERM $$(cat ${PROJECT}.pid) && \
		printf "🦞 stopped $$(cat ${PROJECT}.pid)\n" && \
		rm ${PROJECT}.pid \

# This is a helpful target that packs up .lua/.init.lua and serves /srv with -D
dev:
	@(test ! -f ${PROJECT}.pid && $(MAKE) ${NPD} add-pack && $(MAKE) ${NPD} start-dirmon) || \
		($(MAKE) ${NPD} test && \
		$(MAKE) ${NPD} stop-daemon && $(MAKE) ${NPD} add-pack && $(MAKE) ${NPD} start-dirmon)
	@$(MAKE) ${NPD} log

# TODO - possibly check if the pid is running before you rm the .pid
clean:
	rm -f ${PROJECT}.log ${PROJECT}.pid ${REDBEAN} ${REDBEAN}.template ${ZIP} ${UNZIP}

test:
	checkmake Makefile
	lua test/calculation_test.lua
