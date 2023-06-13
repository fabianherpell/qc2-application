#!/bin/bash

for n in "Ar" "Kr" ; do
    pushd $n >/dev/null
    echo $n
    for m in  "BLYP" "BLYP_D3" "MP2"; do
        pushd $m >/dev/null
        echo $m
        #bash run_scan.sh &
        popd >/dev/null
    done
    popd >/dev/null
done

