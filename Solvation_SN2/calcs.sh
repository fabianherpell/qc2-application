#!/bin/bash

for n in "gas" "MeOH" ; do
    pushd $n >/dev/null
    echo $n
        for k in "chlormethane"  "fluormethane"; do
        pushd $k >/dev/null
        echo $k
        jobex -ri > jobex.out &
        popd >/dev/null
        done
        for l in "fluoride" "chloride"; do
        pushd $l >/dev/null
        echo $l
        ridft > ridft.out &
        popd >/dev/null
        done
    popd >/dev/null
done