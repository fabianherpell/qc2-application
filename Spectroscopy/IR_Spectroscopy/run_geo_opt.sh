#!/bin/bash

for n in "HF" "TPSS_D3" ; do
    pushd $n >/dev/null
    echo $n
    aoforce > aoforce.out &
    popd >/dev/null
done
