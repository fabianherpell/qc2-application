#!/bin/bash

for n in "nh3" "n2" "h2" "ch4" "h2o" "co"; do
    pushd $n >/dev/null
    rm -rf b2plyp/
    mkdir  "b2plyp" 
    for m in "b2plyp" ; do
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

