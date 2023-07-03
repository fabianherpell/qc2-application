#!/bin/bash

for n in "gas" "water"; do
    pushd $n >/dev/null
    echo $n
    for p in "Acetone" "H2O" "TMS"; do
        pushd $p >/dev/null
        echo $p
                for m in "gas_opt" "water_opt" ; do
                pushd $m >/dev/null
                echo $m
                orca $p.inp > orca.out &
                popd >/dev/null
                done
    popd >/dev/null
        done
    popd >/dev/null
done

