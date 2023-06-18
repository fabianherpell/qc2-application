 #!/bin/bash
 
 output_file="$(pwd)/Monomer_energies"
 for m in "Dimerization_Energy"; do
    pushd $m >/dev/null
    echo $m 
            for n in "HF" "TPSS_D3"; do
            pushd $n >/dev/null
            echo $n
                for p in "aug-cc-pVDZ" "aug-cc-pVQZ" "aug-cc-pVTZ" "cc-pVDZ" "cc-pVQZ" "cc-pVTZ" ; do
                pushd $p >/dev/null
                echo $p
                        for q in "Monomer"; do 
                        pushd $q >/dev/null
                        echo $q
                        #grab FINAL ENERGY 
                        input_file=$(find . -name "*.out")
                        pattern="total energy"
                        value=$(grep -E "$pattern" "$input_file" | awk -F "=" '{gsub(/[|]/,"",$2); print $2}')
                        echo -n " $value" >> "$output_file"                            #durch >> nicht überschrieben
                        echo $value         
                        popd >/dev/null
                        done
                popd >/dev/null
                done
            popd >/dev/null
            done
                for x in "MP2"; do
                pushd $x >/dev/null
                echo $x
                for y in "aug-cc-pVDZ" "aug-cc-pVQZ" "aug-cc-pVTZ" "cc-pVDZ" "cc-pVQZ" "cc-pVTZ" ; do
                pushd $y >/dev/null
                echo $y
                        for q in "Monomer"; do 
                        pushd $q >/dev/null
                        echo $q
                        #grab FINAL MP2 ENERGY 
                        input_file=$(find . -name "ricc2.out")
                        pattern="Final MP2 energy\s*:\s*([-+]?[0-9]*\.?[0-9]+)"
                        value=$(grep -Po "$pattern" "$input_file" | awk '{gsub(/[*]+/,"",$NF); print $NF}')
                        echo  " $value" | sed 's/\*//g' >> "$output_file"
                        popd >/dev/null
                        done
                popd >/dev/null
                done
            popd>/dev/null
            done
    popd>/dev/null
    done




