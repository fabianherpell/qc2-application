#!/bin/bash

for n in "HF" "TPSS_D3" ; do
    pushd $n >/dev/null
    echo $n
        pushd $m >/dev/null
        #jobex -ri > jobex.out &
    popd >/dev/null
done

