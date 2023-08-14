#!/bin/bash -e

#SBATCH --job-name	 06_group
#SBATCH --account        uoo00071
#SBATCH --time           12:00:00                     # Time spend on the running
#SBATCH --mem-per-cpu    2048                         # Memory/cpu (MB)
#SBATCH --ntasks         1                            # Number of tasks
#SBATCH --cpus-per-task  8                            # Number of cores per task
#SBATCH --partition	 large                        # Partition
#SBATCH --output         06_group.%j.out  # Include the job ID in the names of the
#SBATCH --error          06_group.%j.err  # Output and error files

# Variables
INPUT_FOLDER=05_deduplicated
OUTPUT_FOLDER=06_grouped

# Load modules
module load picard
module load SAMtools

# Running BWA
samtools addreplacerg -r 'ID:fileTemp' -r 'LB:fileTemp' -r 'SM:fileTemp' -o $OUTPUT_FOLDER/fileTemp_grouped.bam $INPUT_FOLDER/fileTemp_dedup.bam
samtools index -c $OUTPUT_FOLDER/fileTemp_grouped.bam $OUTPUT_FOLDER/fileTemp_grouped.bam.csi
