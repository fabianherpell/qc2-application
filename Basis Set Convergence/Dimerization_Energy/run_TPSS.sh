  #!/bin/bash
 
 for m in "Dimerization_Energy"; do
    pushd $m </dev/null
    echo $m 
            for n in "TPSS_D3" ; do
            pushd $n >/dev/null
            echo $n
                for p in "aug-cc-pVDZ" "aug-cc-pVQZ" "aug-cc-pVTZ" "cc-pVDZ" "cc-pVQZ" "cc-pVTZ" ; do
                pushd $p >/dev/null
                echo $p
                        for q in "Dimer"; do 
                        pushd $q >/dev/null
                        echo $q
                                 if test ! -f *.out;
                                 then
                                 ridft > ridft.out &
                                 fi
                        popd >/dev/null
                        done
                popd >/dev/null
                done
            popd>/dev/null
            done
    popd>/dev/null
    done




