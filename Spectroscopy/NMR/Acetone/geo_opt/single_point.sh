#!/bin/bash

for n in "geo_opt" ; do
    pushd $n >/dev/null
    echo $n
    for m in "gas" "water"; do
        pushd $m >/dev/null
        echo $m
                for m in "Acetone" "H2O" "TMS" ; do
                pushd $m >/dev/null
                echo $m
                orca $m.inp > orca.out &
                popd >/dev/null
                done
    popd >/dev/null
        done
    popd >/dev/null
done

