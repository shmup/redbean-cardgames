#!/usr/bin/env bash

[[ -z $1 ]] && echo "gimme files" && exit 0

uglifyjs "$@" \
         -o bundle.min.js -c -m \
         --source-map "root='http://localhost:8080/js',url='bundle.min.js.map'"
