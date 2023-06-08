#!/bin/bash

for n in "nh3" "n2" "h2" "ch4" "h2o" "co" ; do
    pushd $n >/dev/null
    echo $n
    for m in  "b2plyp" "b3lyp" "ccsd_t" "mp2"; do
        pushd $m >/dev/null
        echo $m
        #aoforce > aoforce.out &
        popd >/dev/null
    done
    popd >/dev/null
done
