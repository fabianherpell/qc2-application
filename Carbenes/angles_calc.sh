 output_file="$(pwd)/methylene_angles.txt"
 for m in "Methylene" ; do
    pushd $m </dev/null
    echo $m 
            for n in "B3LYP" "HF" "MP2" "PW6B95" "TPSS"; do
            pushd $n >/dev/null
            echo $n
                    for p in "singlet" "triplet"; do
                    pushd $p >/dev/null
                    echo $p
                    # calc methylene angle ( 2 1 3)
                     bend 2 1 3 >> "$output_file"
                    popd >/dev/null
                    done
            popd>/dev/null
            done
    popd>/dev/null
    done




