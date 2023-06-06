#!/bin/bash

for n in "nh3" "n2" "h2" ; do
    pushd $n >/dev/null
    mkdir "b3lyp" "mp2" "b2plyp" "ccsd_t"
    for m in "b3lyp" "mp2" "b2plyp" "ccsd_t"; do
        pushd $m >/dev/null
        # coord file kopieren und umbenennen
        cp ../opt_tpss/coord .
        # control file kopieren und umbenennen
        cp ../../control_files/control.$m .
        mv control.$m control
        cp control control.old
        popd >/dev/null
    done
    popd >/dev/null
done

for n in "ch4" "h2o" "co" ; do
    pushd $n >/dev/null
    mkdir "b3lyp" "mp2" "b2plyp" "ccsd_t"
    for m in "b3lyp" "mp2" "b2plyp" "ccsd_t"; do
        pushd $m >/dev/null
        # coord file kopieren und umbenennen
        cp ../opt_tpss/coord .
        # control file kopieren und umbenennen
        cp ../../control_files/control.$m .
        mv control.$m control
        cp control control.old
        popd >/dev/null
    done
    popd >/dev/null
done