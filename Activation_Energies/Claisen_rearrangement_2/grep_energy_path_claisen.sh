#!/bin/bash
counter=0
    for m in "reaction" ; do
    pushd $m >/dev/null

        awk -v counter=$counter 'NR == 2 || (NR-2) % 16 == 0 { print $0, counter++ }' stringfile.xyz0000 > ../plots/claisen_path.dat
        #grep every x line (24 for diels) (16 for claisen)
        #awk 'NR == 2 || (NR-2) % 16 == 0' stringfile.xyz0000 > ../plots/claisen_path.dat

    popd >/dev/null
    done
