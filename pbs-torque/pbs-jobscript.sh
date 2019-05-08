#!/bin/sh
# properties = {properties}
cat $PBS_NODEFILE
qstat -f $PBS_JOBID

cd $PBS_O_WORKDIR

{exec_job}

echo "qsub working directory absolute is"
echo $PBS_O_WORKDIR
exit
