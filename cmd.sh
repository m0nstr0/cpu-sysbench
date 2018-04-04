#!/bin/bash

CPU_INFO=${THREADS:-1}

BENCH_RESULT=$(sysbench --threads=$CPU_INFO cpu --cpu-max-prime=20000000 run | grep "total time" | grep -oE "[0-9]+" | head -1)

if [[ -z "${BENCH_RESULT// }" ]]; then
	echo "{id:\"cpu-sysbench\", result:[]}"
else
	BENCH_EXPR=$(expr 1000000 / $BENCH_RESULT)
	echo "{id:\"cpu-sysbench\", result:[$BENCH_EXPR]}"
fi