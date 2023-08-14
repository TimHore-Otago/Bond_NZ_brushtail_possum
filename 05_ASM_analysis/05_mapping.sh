#!/bin/bash -e

#SBATCH --job-name       05_mapping
#SBATCH --account        uoo00071
#SBATCH --time           06:00:00                     # Time spend on the running.
#SBATCH --mem-per-cpu    2048                         # Memory/cpu (MB)
#SBATCH --ntasks	 1                            # Number of tasks
#SBATCH --cpus-per-task  8	                      # Number of cores per task
#SBATCH --partition	 large			      # Partition
#SBATCH --output         05_mapping.%j.out           # Include the job ID in the names of the
#SBATCH --error          05_mapping.%j.err           # Output and error files

# Variables
OUTPUT_DIR=05_mapped
INPUT_DIR=04_join_index
GENOME=genome/GCA_011100635.1_mTriVul1.pri_genomic_v01.mmi

# Make output directory
mkdir -p $OUTPUT_DIR

# Load modules
module load SAMtools
module load minimap2

# Map and sort
minimap2 -a -x map-ont $GENOME $INPUT_DIR/output.fastq > $OUTPUT_DIR/output.sam
samtools sort $OUTPUT_DIR/output.sam -o $OUTPUT_DIR/output_sorted.bam
samtools index -c $OUTPUT_DIR/output_sorted.bam
