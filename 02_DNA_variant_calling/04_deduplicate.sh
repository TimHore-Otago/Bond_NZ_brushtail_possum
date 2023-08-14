#!/bin/bash -e

#SBATCH --job-name	 04_deduplicate
#SBATCH --account        uoo00071
#SBATCH --time           06:00:00                     # Time spend on the running
#SBATCH --mem-per-cpu    2048                         # Memory/cpu (MB)
#SBATCH --ntasks         1                            # Number of tasks
#SBATCH --cpus-per-task  32                           # Number of cores per task
#SBATCH --partition	 large                        # Partition
#SBATCH --output         04_deduplicate.%j.out  # Include the job ID in the names of the
#SBATCH --error          04_deduplicate.%j.err  # Output and error files

# Variables
INPUT_FOLDER=03_mapped
OUTPUT_FOLDER=04_deduplicated

# Load modules
module load GATK
module load SAMtools

# Running deduplicate
gatk --java-options -Xmx16g MarkDuplicates \
-I $INPUT_FOLDER/file_S1_sorted.bam -O $OUTPUT_FOLDER/file_S1_dedup.bam \
-M $OUTPUT_FOLDER/file_S1_metrics.txt \
--MAX_RECORDS_IN_RAM 5000 -MAX_SEQS 5000 \
--OPTICAL_DUPLICATE_PIXEL_DISTANCE 2500 \
--VALIDATION_STRINGENCY SILENT \
-MAX_FILE_HANDLES 1000

samtools index -c $OUTPUT_FOLDER/file_S1_dedup.bam
