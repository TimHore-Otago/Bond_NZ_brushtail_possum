#!/bin/bash -e

#SBATCH --job-name	 07_deduplicate
#SBATCH --account        uoo00071
#SBATCH --time           06:00:00                     # Time spend on the running
#SBATCH --mem-per-cpu    2048                         # Memory/cpu (MB)
#SBATCH --ntasks         1                            # Number of tasks
#SBATCH --cpus-per-task  2                            # Number of cores per task
#SBATCH --partition	 large                        # Partition
#SBATCH --output         07_deduplicate_filename.%j.out           # Include the job ID in the names of the
#SBATCH --error          07_deduplicate_filename.%j.err           # Output and error files

# Variables
OUT_DIR=07_deduplicated
FOLDER=05_bismark
CLOCK=clock.txt

# Create directory
#mkdir $OUT_DIR

# Start clock
date > $OUT_DIR/$CLOCK

# Load modules
module load Bismark

# Run bismark
date >> $OUT_DIR/$CLOCK
deduplicate_bismark --bam $FOLDER/filename_trimmed_bismark_bt2.bam

# Finish clock
date >> $OUT_DIR/$CLOCK
