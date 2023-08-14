#!/bin/bash -e

#SBATCH --job-name	 03_mapping
#SBATCH --account        uoo00071
#SBATCH --time           24:00:00                     # Time spend on the running
#SBATCH --mem-per-cpu    2048                         # Memory/cpu (MB)
#SBATCH --ntasks         1                            # Number of tasks
#SBATCH --cpus-per-task  16                           # Number of cores per task
#SBATCH --partition	 large                        # Partition
#SBATCH --output         03_mapping_filename.%j.out  # Include the job ID in the names of the
#SBATCH --error          03_mapping_filename.%j.err  # Output and error files

# Variables
REF_GENOME=genome/GCA_011100635.1_mTriVul1.pri_genomic_v01.fna
READS_1=02_trimmed/mTriVul1_S1_L002_R1_001_val_1.fq.gz
READS_2=02_trimmed/mTriVul1_S1_L002_R2_001_val_2.fq.gz
OUTPUT_FOLDER=03_mapped
FILE=file_S1

# Load modules
module load BWA
module load SAMtools

# Index genome
filename=$FILE
#bwa mem -M -t 16 -R @RG\\tID:${filename}\\tSM:${filename}\\tPL:ILM\\tLB:${filename} $REF_GENOME $READS_1 $READS_2 > $OUTPUT_FOLDER/$FILE.sam
samtools view -Sb $OUTPUT_FOLDER/$FILE.sam | samtools sort -o $OUTPUT_FOLDER/$FILE\_sorted.bam
samtools index -c $OUTPUT_FOLDER/$FILE\_sorted.bam
