#!/bin/bash

for n in "nh3" "n2" "h2" ; do
    mkdir "nh3" "n2" "h2"
    pushd $n >/dev/null
    mkdir "opt_tpss" "opt_mp2" #"b3lyp" "mp2" "b2lyp" "ccsd_t"
    for m in "opt_tpss" "opt_mp2"; do
        pushd $m >/dev/null
        # coord file kopieren und umbenennen
        cp ../../coord.$n .
        mv coord.$n coord
        # control file kopieren und umbenennen
        cp ../../control_files/control.$m .
        mv control.$m control
        cp control control.old
        popd >/dev/null
    done
    popd >/dev/null
done

for n in "ch4" "h2o" "co" ; do
    mkdir "ch4" "h2o" "co"
    pushd $n >/dev/null
    mkdir "opt_tpss" #"b3lyp" "mp2" "b2lyp" "ccsd_t"
    for m in "opt_tpss" ; do
        pushd $m >/dev/null
        # coord file kopieren und umbenennen
        cp ../../coord.$n .
        mv coord.$n coord
        # control file kopieren und umbenennen
        cp ../../control_files/control.$m .
        mv control.$m control
        cp control control.old
        popd >/dev/null
    done
    popd >/dev/null
done