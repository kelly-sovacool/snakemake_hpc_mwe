#!/bin/bash

##################
####  Slurm preamble

#### #### ####  These are the most frequently changing options

####  Job name
#SBATCH --job-name=mwe

####  Request resources here
####    These are typically, number of processors, amount of memory,
####    an the amount of time a job requires.  May include processor
####    type, too.

#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=50m
#SBATCH --time=10:00


####  Slurm account and partition specification here
####    These will change if you work on multiple projects, or need
####    special hardware, like large memory nodes or GPUs.

#SBATCH --account=your_account
#SBATCH --partition=standard

#### #### ####  These are the least frequently changing options

####  Your e-mail address and when you want e-mail

#SBATCH --mail-user=your_email
#SBATCH --mail-type=BEGIN,END

#### where to write log files

#SBATCH --output=log/hpc/slurm-%j_%x.out
snakemake --profile config/slurm --latency-wait 20 -s code/myworkflow.smk
