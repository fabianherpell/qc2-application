 output_file="$(pwd)/MR-F-energies"

 for m in "F"; do
    pushd $m >/dev/null
    echo $m 
            for n in "CASSCF" "CCSD_T" "MP2" "rhf" "uhf" "CASSCF_6"; do
            pushd $n >/dev/null
            echo $n
            #grab FINAL SINGLE POINT ENERGY 
            input_file=$(find . -name "*.out")
            pattern="FINAL SINGLE POINT ENERGY"
            value=$(grep "$pattern" "$input_file" | awk '{print $NF}')
            echo "$value" >> "$output_file"                             #durch >> nicht überschrieben
            echo $value 
            popd>/dev/null
            done
    popd>/dev/null
    done

 