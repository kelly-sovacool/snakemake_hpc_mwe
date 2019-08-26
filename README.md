# snakemake_hpc_mwe
A minimal working example of using Snakemake on an HPC running PBS-torque or SLURM.

## Dependencies

You need Python3 and Snakemake installed on a high performance computing cluster running either the PBS-torque or SLURM job scheduler.

Rather than using the modules provided on our University's HPC, I prefer to use conda to manage my software dependencies.

## Conda

Download the latest installer for [Anaconda](https://www.anaconda.com/distribution/#download-section) (includes everything) or [Miniconda](https://docs.conda.io/en/latest/miniconda.html) (includes only the minimum, but faster to install).

```
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
```
### Environments

I like to create a separate conda environment for each of my projects. Example for this tutorial:

Create a new conda environment called `snakemake` and install Python & Snakemake from the bioconda channel:
```
conda create -n snakemake -c bioconda python=3 snakemake
```

Alternatively, you can re-create an environment from a YAML file like so:
```
conda env create -f path/to/environment.yml
```

Example environment files:
- UMich Flux: `config/env.smk-flux.yml`
- UMich Great Lakes: `config/env.smk-gl.yml`

### Activation

Before submitting jobs for your project, activate the environment:
```
conda activate snakemake
```

The packages installed in `snakemake` are then available for any jobs you submit while the environment is activated.

See the [conda user guide](https://docs.conda.io/projects/conda/en/latest/user-guide/getting-started.html) for more details.


## Usage

1. Edit `config/cluster.json` with:
	- Your email
	- The default job parameters
		- e.g. walltime, nodes, memory, etc.
		- These can be overriden by individual rules in the Snakemake file.

1. Edit `code/submit-pbs.sh` and/or `code/submit-slurm.sh` with:
	- Your email
	- HPC account
	- Queue/partition

1. Dry run
	```
	snakemake -s code/myworkflow.smk --dryrun
	```
	to make sure your workflow doesn't have any syntax errors.

1. Submit the workflow

	With PBS-torque:
	```
	qsub code/submit-pbs.sh
	```
	Or with SLURM:
	```
	sbatch code/submit-slurm.sh
	```

	From this job, snakemake submits all of your other jobs.

## Further reading

- My notes on [Using the Great Lakes cluster and batch computing with SLURM](https://github.com/SchlossLab/Great_Lakes_SLURM)
- [Snakemake documentation](https://snakemake.readthedocs.io/en/stable/index.html)
- [Snakemake configuration profiles](https://github.com/Snakemake-Profiles/doc)
- [Conda user guide](https://docs.conda.io/projects/conda/en/latest/user-guide/getting-started.html)
