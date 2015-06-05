#!/bin/bash
#
#$ -q som,asom,free64,pub64
#$ -t 1-400
#$ -cwd
#$ -j y
#$ -S /bin/bash
#$ -N DGC_forest_test_MateosAparicio2014_passive_na8st
#$ -o ./results/forest_test_MateosAparicio2014_passive_na8st.$JOB_ID.o
#$ -ckpt restart

module load neuron/7.4alpha

set -x

nrniv -nobanner -nogui -c "batch_size=400" -c "task_id=$SGE_TASK_ID - 1" \
-c "strdef forest_config" -c 'forest_config="./config/DGC_forest_hpc_passive.config"' \
./DGC_serial_test_from_forest_passive_na8st.hoc

