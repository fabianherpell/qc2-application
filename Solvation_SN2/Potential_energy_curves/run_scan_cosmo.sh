#!/usr/bin/env bash

# Choose directory here
calc_dir=scan_cosmo

cd $calc_dir
if [ -f ./results.dat ]
then
  rm results.dat
fi

read -r -d 'END' template <<-EOF
\$coord
   0.00000000      0.00000000      0.00000000  c f
   0.00000000      0.00000000     -3.36989165  cl
   0.00000000      0.00000000      DIST        f f
  -1.00404366      1.73905464     -0.62462166  h
  -1.00404366     -1.73905464     -0.62462166  h
   2.00808733      0.00000000     -0.62462166  h
\$end
END
EOF

for dist in $(seq 2.25 0.25 8.00 | sed s/,/./)
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