#!/bin/bash -e

#SBATCH --job-name	 08_report
#SBATCH --account        uoo00071
#SBATCH --time           24:00:00                     # Time spend on the running
#SBATCH --mem-per-cpu    2048                         # Memory/cpu (MB)
#SBATCH --ntasks         1                            # Number of tasks
#SBATCH --cpus-per-task  2                            # Number of cores per task
#SBATCH --partition	 large                        # Partition
#SBATCH --output         08_report_filename.%j.out           # Include the job ID in the names of the
#SBATCH --error          08_report_filename.%j.err           # Output and error files

# Variables
OUT_DIR=08_report
FOLDER=07_deduplicated
CLOCK=clock.txt

# Create directory
#mkdir $OUT_DIR

# Start clock
date > $OUT_DIR/$CLOCK

# Load modules
module load Bismark

# Run bismark
date >> $OUT_DIR/$CLOCK
bismark_methylation_extractor --report --comprehensive --merge_non_CpG --output $OUT_DIR $FOLDER/filename_trimmed_bismark_bt2.deduplicated.bam

# Finish clock
date >> $OUT_DIR/$CLOCK
