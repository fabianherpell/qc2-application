 #!/bin/bash
 
 output_file="$(pwd)/Claisen_singlepoint_E"

        for p in "start" "TS"; do
        pushd $p >/dev/null
        echo $p
       
        # for ridft.out only 
                #grab total energy

                input_file=$(find . -name "*.out")
                pattern="total energy"
                value=$(grep -E "$pattern" "$input_file" | awk -F "=" '{gsub(/[|]/,"",$2); print $2}')
                echo -n "$p" >> "$output_file"  
                echo "$value" >> "$output_file"                           #durch >> nicht überschrieben
                echo $value  

        popd>/dev/null
        done
   




