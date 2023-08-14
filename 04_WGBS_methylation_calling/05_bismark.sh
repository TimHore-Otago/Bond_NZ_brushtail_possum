#!/bin/bash -e

#SBATCH --job-name	 05_bismark
#SBATCH --account        uoo00071
#SBATCH --time           24:00:00                     # Time spend on the running
#SBATCH --mem-per-cpu    2048                         # Memory/cpu (MB)
#SBATCH --ntasks         1                            # Number of tasks
#SBATCH --cpus-per-task  8                            # Number of cores per task
#SBATCH --partition	 large                        # Partition
#SBATCH --output         05_bismark_filename.%j.out    # Include the job ID in the names of the
#SBATCH --error          05_bismark_filename.%j.err    # Output and error files

# Variables
OUT_DIR=05_bismark
FOLDER=03_trimmed
CLOCK=clock.txt
GENOME=/nesi/nobackup/uoo00071/possum_WGBS/OG7414P2-551809260/genome

# Start clock
date > $OUT_DIR/$CLOCK

# Load modules
module load Bismark

# Run bismark
date >> $OUT_DIR/$CLOCK
bismark $GENOME --pbat --output $OUT_DIR $FOLDER/filename_trimmed.fq.gz

# Finish clock
date >> $OUT_DIR/$CLOCK

