 #!/bin/bash
 
 output="$(pwd)/TPSS_Enthalpy_correction"
                for p in "nh3" "n2" "h2" "ch4" "co" "h2o"; do
                pushd $p >/dev/null
                echo $p
                echo "$p " >> "$output"

                # for ricc2 involved
                        for q in "opt_tpss"; do 
                        pushd $q >/dev/null
                        echo $q
                        echo -n "$q " >> "$output"  # Pfadname ($n) ohne Zeilenumbruch (-n)
                        #grab correction enthalpy
                        input=$(find . -name ".H298")
                        awk '{print $1}' "$input" >> "$output"        
                        popd >/dev/null
                        done

            popd>/dev/null
            done
   




