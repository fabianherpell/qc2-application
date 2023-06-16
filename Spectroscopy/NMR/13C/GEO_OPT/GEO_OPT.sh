#!/bin/bash

for n in "A" "B" "C" "D" "E" "F" "G" "Ar-1" "Ar-2" "Ar-3" "Ar-4" "TMS"; do
    pushd $n >/dev/null
    echo $n
    orca *.inp > orca.out &
    popd >/dev/null
done
