#!/bin/bash -e

#SBATCH --job-name	 05_deduplicate
#SBATCH --account        uoo00071
#SBATCH --time           06:00:00                     # Time spend on the running
#SBATCH --mem-per-cpu    2048                         # Memory/cpu (MB)
#SBATCH --ntasks         1                            # Number of tasks
#SBATCH --cpus-per-task  16                           # Number of cores per task
#SBATCH --partition	 large                        # Partition
#SBATCH --output         05_deduplicate.%j.out  # Include the job ID in the names of the
#SBATCH --error          05_deduplicate.%j.err  # Output and error files

# Variables
INPUT_FOLDER=04_mapped
OUTPUT_FOLDER=05_deduplicated

# Load modules
module load GATK
module load SAMtools

# Running deduplicate
gatk --java-options -Xmx16g MarkDuplicates \
-I $INPUT_FOLDER/fileTemp_sorted.sam -O $OUTPUT_FOLDER/fileTemp_dedup.sam \
-M $OUTPUT_FOLDER/fileTemp_metrics.txt \
--MAX_RECORDS_IN_RAM 5000 -MAX_SEQS 5000 \
--OPTICAL_DUPLICATE_PIXEL_DISTANCE 2500 \
--VALIDATION_STRINGENCY SILENT \
-MAX_FILE_HANDLES 1000

samtools view -S -b $OUTPUT_FOLDER/fileTemp_dedup.sam > $OUTPUT_FOLDER/fileTemp_dedup.bam
rm $OUTPUT_FOLDER/fileTemp_dedup.sam

samtools index -c $OUTPUT_FOLDER/fileTemp_dedup.bam
