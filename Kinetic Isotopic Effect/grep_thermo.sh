 #!/bin/bash

 output="$(pwd)/Kinetic_Thermo.dat"

 for m in "cd4" "ch4"; do
    pushd $m >/dev/null
    echo $m 
    echo -n "$m " >> "$output"
                        #grab correction enthalpy
                        input=$(find . -name ".H298")
                        awk '{print $1}' "$input" >> "$output"
                  
    popd>/dev/null
    done

for f in "Molecules"; do
    pushd $f >/dev/null
    echo $f 
    echo "$f " >> "$output"
         for m in "cd4" "ch4" "oh"; do
         pushd $m >/dev/null
         echo $m 
         echo -n "$m " >> "$output"
                         #grab correction enthalpy
                        input=$(find . -name ".H298")
                        awk '{print $1}' "$input" >> "$output"

         popd>/dev/null
         done
    popd>/dev/null
    done