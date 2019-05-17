# snakemake_hpc_mwe
A minimal working example of using Snakemake on the HPC.

This example uses the pbs-torque profile, but can be modified to use slurm instead.

# Dependencies

You need snakemake installed on a high performance computing cluster running either the pbs or slurm job scheduler. I recommend [installing snakemake with conda](https://snakemake.readthedocs.io/en/stable/getting_started/installation.html) and creating a [conda environment](https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html) to manage your project's dependencies.

## Usage

1. Edit `cluster.json`
	- Add your email.
	- Change the default job parameters.
		- e.g. walltime, memory, etc.
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

## Further reading

- Snakemake documentation: https://snakemake.readthedocs.io/en/stable/index.html
- Snakemake configuration profiles: https://github.com/Snakemake-Profiles/doc
