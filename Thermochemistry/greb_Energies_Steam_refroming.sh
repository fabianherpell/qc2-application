 #!/bin/bash
 
 output_file="$(pwd)/Steam_reforming_E"
                for p in "ch4" "h2o" "co" "h2"; do
                pushd $p >/dev/null
                echo $p
                echo "$p " >> "$output_file"

                # b2plyp
                        for q in "b2plyp"; do 
                        pushd $q >/dev/null
                        echo $q
                        echo -n "$q " >> "$output_file"  # Pfadname ($n) ohne Zeilenumbruch (-n)
                        #grab FINAL MP2 ENERGY 
                        input_file=$(find . -name "ricc2.out")
                        pattern="B2-PLYP energy\s*:\s*([-+]?[0-9]*\.?[0-9]+)"
                        value=$(grep -Po "$pattern" "$input_file" | awk '{gsub(/[*]+/,"",$NF); print $NF}')
                        echo  " $value" | sed 's/\*//g' >> "$output_file"  #durch >> nicht überschrieben
                        echo $value         
                        popd >/dev/null
                        done
                
                # MP2
                        for q in "mp2"; do 
                        pushd $q >/dev/null
                        echo $q
                        echo -n "$q " >> "$output_file"  # Pfadname ($n) ohne Zeilenumbruch (-n)
                        #grab FINAL MP2 ENERGY 
                        input_file=$(find . -name "ricc2.out")
                        pattern="Final MP2 energy\s*:\s*([-+]?[0-9]*\.?[0-9]+)"
                        value=$(grep -Po "$pattern" "$input_file" | awk '{gsub(/[*]+/,"",$NF); print $NF}')
                        echo  " $value" | sed 's/\*//g' >> "$output_file"  #durch >> nicht überschrieben
                        echo $value         
                        popd >/dev/null
                        done

                # for ridft.out only
                for x in "b3lyp" ; do
                pushd $x >/dev/null
                echo $x
                echo  -n "$x " >> "$output_file" 
                        #grab FINAL ridft ENERGY 
                        input_file=$(find . -name "ridft.out")
                        pattern="total energy"
                        value=$(grep -E "$pattern" "$input_file" | awk -F "=" '{gsub(/[|]/,"",$2); print $2}')
                        #printf " %s" "$value" >> "$output_file" 
                        echo  " $value" >> "$output_file" 
                        popd >/dev/null
                        done

                # for ccsdf12.out only
                for x in "ccsd_t"; do
                pushd $x >/dev/null
                echo $x
                echo  "$x " >> "$output_file" 
                        input_file=$(find . -name "ccsdf12.out")
                        value=$(awk -F ":" '/Final CCSD\(T\) energy/{gsub(/^[ \t]+|[ \t]+$/, "", $2); print $2}' "$input_file")
                        #echo $value
                        echo  " $value" | sed 's/\*//g' >> "$output_file"
                popd >/dev/null
                done

                 # tpss
                        for q in "opt_tpss"; do 
                        pushd $q >/dev/null
                        echo $q
                        echo -n "$q " >> "$output_file"  # Pfadname ($n) ohne Zeilenumbruch (-n)
                        #grab FINAL MP2 ENERGY 
                        input_file=$(find . -name "job.last")
                        pattern="total energy"
                        value=$(grep -E "$pattern" "$input_file" | awk -F "=" '{gsub(/[|]/,"",$2); print $2}')
                        echo  " $value" | sed 's/\*//g' >> "$output_file"  #durch >> nicht überschrieben
                        echo $value         
                        popd >/dev/null
                        done

            popd>/dev/null
            done
   




