 #!/bin/bash
 
 output_file="$(pwd)/Haber_Bosch_E"
                for p in "nh3" "n2" "h2"; do
                pushd $p >/dev/null
                echo $p
                echo "$p " >> "$output_file"

                # for ridft.out only
                for x in "b3lyp" ; do
                pushd $x >/dev/null
                echo $x
                echo -n "$x " >> "$output_file" 
                        #grab FINAL ridft ENERGY 
                        input_file=$(find . -name "ridft.out")
                        pattern="total energy"
                        value=$(grep -E "$pattern" "$input_file" | awk -F "=" '{gsub(/[|]/,"",$2); print $2}')
                        #printf " %s" "$value" >> "$output_file" 
                        echo -n " $value" >> "$output_file" 
                        popd >/dev/null
                        done

            popd>/dev/null
            done
   




