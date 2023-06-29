 #!/bin/bash

 output_file="$(pwd)/Kinetic_Energies.dat"

 for m in "cd4" "ch4"; do
    pushd $m >/dev/null
    echo $m 
    #echo -e "$m" >> "$output_file"
                    #grab FINAL SINGLE POINT ENERGY 
                    input_file=$(find . -name "*.last")
                    pattern="total energy"
                    value=$(grep -E "$pattern" "$input_file" | awk -F "=" '{gsub(/[|]/,"",$2); print $2}')
                    #echo -e "$m\t$value" >> "$output_file"                            #durch >> nicht überschrieben
                    printf "%s\t%s\n" "$m" "$value" >> "$output_file"
                    echo $value 

    popd>/dev/null
    done

for f in "Molecules"; do
    pushd $f >/dev/null
    echo $f 
    printf "$f" >> "$output_file"
         for m in "cd4" "ch4" "oh"; do
         pushd $m >/dev/null
         echo $m 
         #echo -e "$m" >> "$output_file"
                         #grab FINAL SINGLE POINT ENERGY 
                         input_file=$(find . -name "*.last")
                         pattern="total energy"
                         value=$(grep -E "$pattern" "$input_file" | awk -F "=" '{gsub(/[|]/,"",$2); print $2}')
                         #echo -e "$m\t$value" >> "$output_file"                            #durch >> nicht überschrieben
                         printf "%s\t%s\n" "$m" "$value" >> "$output_file"
                         echo $value 

         popd>/dev/null
         done
    popd>/dev/null
    done