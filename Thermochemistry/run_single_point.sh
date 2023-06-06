#!/bin/bash

for n in "nh3" "n2" "h2" ; do
    pushd $n >/dev/null
    for m in "b3lyp" "mp2" "b2plyp" "ccsd_t"; do
        pushd $m >/dev/null
        ridft > ridft.out &
        popd >/dev/null
    done
    popd >/dev/null
done

for n in "ch4" "h2o" "co" ; do
    pushd $n >/dev/null
    for m in "b3lyp" "mp2" "b2plyp" "ccsd_t"; do
        pushd $m >/dev/null
        ridft > ridft.out &
        popd >/dev/null
    done
    popd >/dev/null
done