#!/bin/bash
#
#SBATCH --job-name=test
#
#SBATCH --ntasks=1
#SBATCH --time=10:00
#SBATCH --mem-per-cpu=100
#SBATCH --output=/tmp/slurmout.txt

srun echo hostname > /tmp/slurmout.txt
srun sleep 60
