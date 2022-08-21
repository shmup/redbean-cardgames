#!/usr/bin/env bash

CALC=http://localhost:8080/api/v1/calculation

# seq 30 | parallel -n0 "http -b --ignore-stdin $URL/calculation/init"
# xargs -P 5 -n 1 http -b "$URL/calculation/init"

http -b GET "$CALC/init"
http -b GET "$CALC/talon"
# http -b POST $CALC/pack_topcard/1

exit 0
