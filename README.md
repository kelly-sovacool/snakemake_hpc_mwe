# snakemake_hpc_mwe

## Usage

1. Edit `cluster.json`
	- Add your email.
	- Change default parameters for jobs, e.g. walltime, memory, etc.
		- These can be overriden by individual rules in the Snakemake file.

1. Edit `submit.pbs`
	- Add your email.
	- Update the path to your Snakemake workflow.

1. Dry run
	```
	snakemake -s myworkflow.smk --dryrun
	```
	to make sure your workfow doesn't have any syntax errors.

1. Submit the workflow
	```
	qsub submit.pbs
	```
	From this job, snakemake submits all of your other jobs.
