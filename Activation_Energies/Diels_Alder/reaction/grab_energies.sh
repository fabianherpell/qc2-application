#!/bin/bash

for n in "claisen8"; do
    pushd $n >/dev/null

    for m in "reaction" ; do
    pushd $m >/dev/null

        #grep every x line (24 for diels) (16 for claisen)
        awk 'NR == 2 || (NR-2) % 16 == 0' stringfile.xyz0000 > ../../plots/claisen_path.dat

    popd >/dev/null
    done

    popd >/dev/null
done