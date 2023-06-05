 output_file="$(pwd)/Carbenes_M-energies"

 for m in "Methylene"; do
    pushd $m >/dev/null
    echo $m 
            for n in "CCSD_T" ; do
            pushd $n >/dev/null
            echo $n
                for k in "singlet" "triplet"; do
                pushd $k >/dev/null
                echo $k
                    #grab FINAL SINGLE POINT ENERGY 
                    input_file=$(find . -name "*12.out")
                    pattern="Final CCSD\(T\) energy\s*:\s*([-+]?[0-9]*\.?[0-9]+)"
                    value=$(grep -Po "$pattern" "$input_file" | awk '{gsub(/[*]+/,"",$NF); print $NF}')
                    echo " $value" | sed 's/\*//g' >> "$output_file"
                    popd>/dev/null
                    done
                popd>/dev/null
                done
    popd>/dev/null
    done



