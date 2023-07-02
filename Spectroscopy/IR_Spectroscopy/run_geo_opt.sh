#!/bin/bash

for n in "HF_neu" "TPSS_D3_neu" ; do
    pushd $n >/dev/null
    echo $n
    #jobex -ri > jobex.out &
    aoforce > aoforce.out &
    popd >/dev/null
done

