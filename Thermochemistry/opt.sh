#!/bin/bash

for n in "nh3" "n2" "h2" ; do
    pushd $n >/dev/null
    for m in "opt_tpss"; do
        pushd $m >/dev/null
        # start opt tpss
        jobex -ri > jobex.out &
        popd >/dev/null
    done
    popd >/dev/null
done

for n in "nh3" "n2" "h2" ; do
    pushd $n >/dev/null
    for m in "opt_mp2"; do
        pushd $m >/dev/null
        # start mps
        jobex -ri -level cc2 > jobex.out &
        popd >/dev/null
    done
    popd >/dev/null
done

for n in "ch4" "h2o" "co" ; do
    pushd $n >/dev/null
    for m in "opt_tpss" ; do
        pushd $m >/dev/null
        # start opt tpss
        jobex -ri > jobex.out &
        popd >/dev/null
    done
    popd >/dev/null
done