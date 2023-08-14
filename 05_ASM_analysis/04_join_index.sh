#!/bin/bash -e

#SBATCH --job-name       04_join_index
#SBATCH --account        uoo00071
#SBATCH --time           02:00:00                     # Time spend on the running.
#SBATCH --mem-per-cpu    2048                         # Memory/cpu (MB)
#SBATCH --ntasks	 1                            # Number of tasks
#SBATCH --cpus-per-task  4	                      # Number of cores per task
#SBATCH --partition	 large			      # Partition
#SBATCH --output         04_join_index.%j.out           # Include the job ID in the names of the
#SBATCH --error          04_join_index.%j.err           # Output and error files

# Variables
OUT_DIR=04_join_index
FOLDER=03_trimmed

# Make output directory
mkdir -p $OUT_DIR

# Load modules
module load nanopolish

# Merge data
cat $FOLDER/f*.fastq > $OUT_DIR/output.fastq
