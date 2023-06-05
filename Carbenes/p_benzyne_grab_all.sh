 output_file="$(pwd)/Carbenes_B-energies"

 for m in "p-benzyne"; do
    pushd $m >/dev/null
    echo $m 
            #DFT/HF
            for n in "B3LYP" "HF" "PW6B95" "TPSS" ; do
            pushd $n >/dev/null
            echo $n
                for k in "singlet" "triplet"; do
                pushd $k >/dev/null
                echo $k
                    #grab FINAL SINGLE POINT ENERGY DFT/HF
                    input_file=$(find . -name "*.last")
                    pattern="total energy\s*=\s*([-+]?[0-9]*\.?[0-9]+)"
                    value=$(grep -E "$pattern" "$input_file" | awk -F "=" '{gsub(/[|]/,"",$2); print $2}')
                    echo "$value" | sed 's/\*//g' >> "$output_file"                          #durch >> nicht überschrieben
                    echo $value 
                    popd>/dev/null
                    done
                popd>/dev/null
                done
                #CCSD(T)
                for o in "CCSD_T" ; do
                pushd $o >/dev/null
                echo $o
                    for l in "singlet" "triplet"; do
                    pushd $l >/dev/null
                    echo $l
                        #grab FINAL SINGLE POINT ENERGY CCSD_T 
                        input_file=$(find . -name "*12.out")
                        pattern="Final CCSD\(T\) energy\s*:\s*([-+]?[0-9]*\.?[0-9]+)"
                        value=$(grep -Po "$pattern" "$input_file" | awk '{gsub(/[*]+/,"",$NF); print $NF}')
                        echo "$value" | sed 's/\*//g' >> "$output_file"
                        echo $value
                        popd>/dev/null
                    done
                popd>/dev/null
                done
                #MP2
                for o in "MP2"; do
                pushd $o >/dev/null
                echo $o
                    for y in "singlet" "triplet"; do
                    pushd $y >/dev/null
                    echo $y
                        #grab FINAL SINGLE POINT ENERGY MP2
                        input_file=$(find . -name "*.last")
                        pattern="Total Energy\s*:\s*([-+]?[0-9]*\.?[0-9]+)"
                        value=$(grep -Po "$pattern" "$input_file" | awk '{gsub(/[*]+/,"",$NF); print $NF}')
                        echo "$value" | sed 's/\*//g' >> "$output_file"
                        echo $value
                        popd>/dev/null
                        done
                    popd>/dev/null
                    done
    popd>/dev/null
    done



