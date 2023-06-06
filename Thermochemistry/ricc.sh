#!/bin/bash

for n in "nh3" "n2" "h2" ; do
    pushd $n >/dev/null
    for m in "mp2" "b2plyp" ; do
        pushd $m >/dev/null
        ricc2 > ricc2.out &
        popd >/dev/null
    done
    popd >/dev/null
done

for n in "ch4" "h2o" "co" ; do
    pushd $n >/dev/null
    for m in "mp2" "b2plyp"; do
        pushd $m >/dev/null
        ricc2 > ricc2.out &
        popd >/dev/null
    done
    popd >/dev/null
done

for n in "nh3" "n2" "h2" ; do
    pushd $n >/dev/null
    for m in "ccsd_t"; do
        pushd $m >/dev/null
        ccsdf12 > ccsdf12.out &
        popd >/dev/null
    done
    popd >/dev/null
done

for n in "ch4" "h2o" "co" ; do
    pushd $n >/dev/null
    for m in "ccsd_t"; do
        pushd $m >/dev/null
        ccsdf12 > ccsdf12.out &
        popd >/dev/null
    done
    popd >/dev/null
done