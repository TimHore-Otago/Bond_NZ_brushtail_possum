#!/bin/bash -e

#SBATCH --job-name	 01_basecalling
#SBATCH --account        nesi00427
#SBATCH --time           00:10:00                     # Time spend on the running
#SBATCH --mem-per-cpu    6144                         # Memory/gpu (MB)
#SBATCH --gres=gpu:1
#SBATCH --partition	 gpu                          # Partition
#SBATCH --output         01_basecalling.%j.out  # Include the job ID in the names of the
#SBATCH --error          01_basecalling.%j.err  # Output and error files

# Load modules
module load ont-guppy-gpu/4.2.2

# Run guppy
guppy_basecaller -c /scale_wlg_persistent/filesets/opt_nesi/CS400_centos7_bdw/ont-guppy-gpu/4.2.2/data/dna_r9.4.1_450bps_hac.cfg -x "cuda:0" -i fast5_test/ -s fastq_test/
