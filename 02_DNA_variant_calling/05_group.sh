#!/bin/bash -e

#SBATCH --job-name	 05_group
#SBATCH --account        uoo00071
#SBATCH --time           12:00:00                     # Time spend on the running
#SBATCH --mem-per-cpu    2048                         # Memory/cpu (MB)
#SBATCH --ntasks         1                            # Number of tasks
#SBATCH --cpus-per-task  16                            # Number of cores per task
#SBATCH --partition	 large                        # Partition
#SBATCH --output         05_group.%j.out  # Include the job ID in the names of the
#SBATCH --error          05_group.%j.err  # Output and error files

# Variables
INPUT_FOLDER=04_deduplicated
OUTPUT_FOLDER=05_grouped

# Load modules
module load picard
module load SAMtools

# Running BWA
samtools addreplacerg -r 'ID:Sandy_S1' -r 'LB:Sandy_S1' -r 'SM:Sandy_S1' -o $OUTPUT_FOLDER/Sandy_S1_grouped.bam $INPUT_FOLDER/file_S1_dedup.bam
samtools index -c $OUTPUT_FOLDER/Sandy_S1_grouped.bam $OUTPUT_FOLDER/Sandy_S1_grouped.bam.csi
