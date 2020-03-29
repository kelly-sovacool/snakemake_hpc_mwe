#PBS -N mwe ## Name of the job for the scheduler
#PBS -A your_account ## name of the allocation (who is paying for the compute time)
#PBS -q fluxod            ## name of the queue to submit the job to. Will match the suffix on allocation name
#PBS -l nodes=1:ppn=1,pmem=50MB,walltime=10:00    ## resource reservation  max walltime = 672 hours
#PBS -l qos=flux        ## quality of service DO NOT CHANGE THIS
#PBS -M uniqname@umich.edu  ## send email notifications to umich email listed
#PBS -m abe                ## when to send email a=abort b=job begin e=job end
#PBS -j oe                 ## send output and error information to the email listed above
#PBS -V                 ## IMPORTANT always use this. send environment setup to node job will be run on
#PBS -o log/hpc  ## write output/error logfile(s) to this dir
#
#  Include the next three lines always
if [ "x${PBS_NODEFILE}" != "x" ] ; then
   cat $PBS_NODEFILE   # contains a list of the CPUs you were using if run with PBS
fi

# Always add this line to change to the working directory of the program. Otherwise
# the script will be run from the users /home directory
cd $PBS_O_WORKDIR
echo $PBS_O_WORKDIR

#  Put your job commands after this line. Load all required modules before submitting this script.
snakemake --profile config/pbs-torque --latency-wait 90 -s code/myworkflow.smk
