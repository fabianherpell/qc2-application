 #!/bin/bash
 
 output_file="$(pwd)/RMSD_Haber_Bosch"

            for n in "nh3" "n2" "h2"; do
            pushd $n >/dev/null
            echo $n
            echo -n "$n " >> "$output_file"  # Pfadname ($n) ohne Zeilenumbruch (-n)
            #grab RMSD
            input_file=$(find . -name ".RMSD")
            #pattern="^[0-9]+([.][0-9]+)?$"  # Muster für eine Zahl
            value=$(cat "$input_file")
            echo "$value" >> "$output_file"
            #echo "$n" >> "$output_file"
            popd >/dev/null
            done




