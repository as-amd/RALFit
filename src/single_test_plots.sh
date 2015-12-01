#!/bin/bash

if [ $# -eq 0 ]
 then
   problem="ARGAUSS"
else
   problem=$1    
fi

# A script to run a sequence of tests
echo "model = 1"
sed -i '5s/.*/1                     model used (1=first order, 2=Newton)/' \
    $CUTEST/src/ral_nlls/RAL_NLLS.SPC
./run_single_test.sh $problem
mv 'data/'$problem'_progress.out' 'data/'$problem'_progress.out_m1'

echo "model = 2"
sed -i '5s/.*/2                     model used (1=first order, 2=Newton)/' \
    $CUTEST/src/ral_nlls/RAL_NLLS.SPC
./run_single_test.sh $problem
mv 'data/'$problem'_progress.out' 'data/'$problem'_progress.out_m2'

echo "model = 7"
sed -i '5s/.*/7                     model used (1=first order, 2=Newton)/' \
    $CUTEST/src/ral_nlls/RAL_NLLS.SPC
./run_single_test.sh $problem
mv 'data/'$problem'_progress.out' 'data/'$problem'_progress.out_m7'

echo "model = 8"
sed -i '5s/.*/8                     model used (1=first order, 2=Newton)/' \
    $CUTEST/src/ral_nlls/RAL_NLLS.SPC
./run_single_test.sh $problem
mv 'data/'$problem'_progress.out' 'data/'$problem'_progress.out_m8'

./plot_convergence.py $problem
