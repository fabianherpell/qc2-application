#!/bin/bash

for n in "nh3" "n2" "h2" "ch4" "h2o" "co" ; do
    pushd $n >/dev/null
    for m in  "b2plyp"; do
        pushd $m >/dev/null
        ridft > ridft.out &
        popd >/dev/null
    done
    popd >/dev/null
done

