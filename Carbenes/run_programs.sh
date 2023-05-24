 for m in "Methylene" "p-benzyne"; do
    pushd $m </dev/null
    echo $m 
            for n in "B3LYP" "HF" "MP2" "PW6B95" "TPSS"; do
            pushd $n >/dev/null
            echo $n
                    for p in "singlet" "triplet"; do
                    pushd $p >/dev/null
                    if test ! -f jobex.out;
                    then
                    echo $p
                    jobex -ri > jobex.out &
                    fi
                    popd >/dev/null
                    done
            popd>/dev/null
            done
    popd>/dev/null
    done




