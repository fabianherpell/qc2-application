 #!/bin/bash
 
 output_file="$(pwd)/TPSS_HB_E"
                for p in "nh3" "n2" "h2"; do
                pushd $p >/dev/null
                echo $p
                echo "$p " >> "$output_file"

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
   




