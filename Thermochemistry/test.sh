#!/bin/bash
 
 output_file="$(pwd)/Haber_Bosch_test"
                for p in "nh3" "n2" "h2"; do
                pushd $p >/dev/null
                echo $p
                echo "$p " >> "$output_file"

                # for ridft.out only
                for x in "b3lyp" ; do
                pushd $x >/dev/null
                echo $x
                printf " %s" "$x" >> "$output_file" 
                #echo  -n "$x " >> "$output_file" 
                        #grab FINAL ridft ENERGY 
                        input_file=$(find . -name "ridft.out")
                        pattern="total energy"
                        value=$(grep -E "$pattern" "$input_file" | awk -F "=" '{gsub(/[|]/,"",$2); print $2}')
                        printf " %s" "$value" >> "$output_file" 
                        #echo  " $value" >> "$output_file" 
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
            popd>/dev/null
            done
   




