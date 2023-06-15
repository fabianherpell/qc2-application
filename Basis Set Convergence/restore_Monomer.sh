#!/bin/bash 
 
 for m in "Dimerization_Energy"; do
    pushd $m </dev/null
    echo $m 
            for n in "HF" "MP2" "TPSS_D3"; do
            pushd $n >/dev/null
            echo $n
                for p in "aug-cc-pVDZ" "aug-cc-pVQZ" "aug-cc-pVTZ" "cc-pVDZ" "cc-pVQZ" "cc-pVTZ" ; do
                pushd $p >/dev/null
                echo $p
                        rm -rf Monomer/
                        mkdir  "Monomer" 
                                for m in "Monomer" ; do
                                pushd $m >/dev/null
                                # coord file kopieren und umbenennen
                                cp ../../../../Monomer/coord 
                                touch control
                                popd >/dev/null
                                done
                popd >/dev/null
                done
            popd>/dev/null
            done
    popd>/dev/null
    done




