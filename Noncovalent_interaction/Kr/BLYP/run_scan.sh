#!/usr/bin/env bash

# Choose directory here
calc_dir=scan

cd $calc_dir
if [ -f ./results.dat ]
then
  rm results.dat
fi

read -r -d 'END' template <<-EOF
\$coord
   0.00000000000000      0.00000000000000      DIST                  kr f
   0.00000000000000      0.00000000000000      0.00000000000000      h f
   0.00000000000000      0.00000000000000     -2.06945348098289      c
   0.97576020317533      1.69006623336522     -2.75977586481614      h
   0.97576020317533     -1.69006623336522     -2.75977586481614      h
  -1.95152040635065      0.00000000000000     -2.75977586481614      h
\$end
END
EOF

for dist in $(seq 4.5 0.25 15.00 | sed s/,/./)
do

  # Check for existence of folder
  if [ -d $dist ]
  then
    rm -r $dist
  fi
  mkdir $dist
  cp control $dist
  pushd $dist
  echo "$template" | sed "s/DIST/$dist/" > coord

  jobex -ri -c 50

  # Get final energy
  e=$(sdg energy | tail -1 | gawk '{printf $2}')

  # Write energy to a file
  echo $dist $e >> ../results.dat
  popd

done