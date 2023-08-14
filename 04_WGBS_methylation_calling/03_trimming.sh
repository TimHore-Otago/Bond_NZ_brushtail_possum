#!/bin/bash -e

#SBATCH --job-name	 03_trimming
#SBATCH --account        uoo00071
#SBATCH --time           24:00:00                     # Time spend on the running
#SBATCH --mem-per-cpu    2048                         # Memory/cpu (MB)
#SBATCH --ntasks         1                            # Number of tasks
#SBATCH --cpus-per-task  2                            # Number of cores per task
#SBATCH --partition	 large                        # Partition
#SBATCH --output         03_trimming_filename.%j.out  # Include the job ID in the names of the
#SBATCH --error          03_trimming_filename.%j.err  # Output and error files

# Variables
OUT_DIR=03_trimmed
FOLDER=01_samples
CLOCK=clock.txt

# Create folder
#mkdir $OUT_DIR

# Start clock
date > $OUT_DIR/$CLOCK

# Load modules
module load TrimGalore

# Running TrimGalore
trim_galore -q 20 --clip_R1 10 -o $OUT_DIR $FOLDER/filename.fastq.gz

date >> $OUT_DIR/$CLOCK
