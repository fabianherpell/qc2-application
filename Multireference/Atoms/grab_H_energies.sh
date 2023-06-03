 output_file="$(pwd)/MR-H-energies"

 for m in "H"; do
    pushd $m >/dev/null
    echo $m 
            for n in "CASSCF" "CCSD_T" "MP2" "rhf" "uhf"; do
            pushd $n >/dev/null
            echo $n
            #grab FINAL SINGLE POINT ENERGY 
            input_file=$(find . -name "*.out")
            pattern="FINAL SINGLE POINT ENERGY"
            value=$(grep "$pattern" "$input_file" | awk '{print $NF}')
            echo "$value" >> "$output_file"
            echo $value 
            popd>/dev/null
            done
    popd>/dev/null
    done

 