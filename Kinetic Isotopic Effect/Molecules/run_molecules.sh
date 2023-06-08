#!/bin/bash

for n in "cd4" "ch4" "oh" ; do
    pushd $n >/dev/null
    echo $n
     jobex -ri > jobex.out &
    popd >/dev/null
done