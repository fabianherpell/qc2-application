 output_file="$(pwd)/Carbenes_M-energies"

 for m in "Methylene"; do
    pushd $m >/dev/null
    echo $m 
            for n in "B3LYP" "HF" "PW6B95" "TPSS" ; do
            pushd $n >/dev/null
            echo $n
                for k in "singlet" "triplet"; do
                pushd $k >/dev/null
                echo $k
                    #grab FINAL SINGLE POINT ENERGY 
                    input_file=$(find . -name "*.last")
                    pattern="total energy"
                    value=$(grep -E "$pattern" "$input_file" | awk -F "=" '{gsub(/[|]/,"",$2); print $2}')
                    echo -n " $value" >> "$output_file"                            #durch >> nicht überschrieben
                    echo $value 
                    popd>/dev/null
                    done
                popd>/dev/null
                done
    popd>/dev/null
    done

     output_file="$(pwd)/Carbenes_M-energies"

