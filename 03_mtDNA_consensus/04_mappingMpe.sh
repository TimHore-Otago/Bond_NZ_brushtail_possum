#!/bin/bash -e

#SBATCH --job-name	 04_mapping
#SBATCH --account        uoo00071
#SBATCH --time           12:00:00                     # Time spend on the running
#SBATCH --mem-per-cpu    2048                         # Memory/cpu (MB)
#SBATCH --ntasks         1                            # Number of tasks
#SBATCH --cpus-per-task  8                            # Number of cores per task
#SBATCH --partition	 large                        # Partition
#SBATCH --output         04_mapping.%j.out  # Include the job ID in the names of the
#SBATCH --error          04_mapping.%j.err  # Output and error files

# Variables
INPUT_FOLDER=02_trimmed
GENOME=genome/GCA_011100635.1_mTriVul1.pri_genomic_v01m.fna
OUTPUT_FOLDER=04_mappedM

# Load modules
module load BWA

# Running BWA
filename=fileTemp
bwa mem -t 2 -M \
-R @RG\\tID:${filename}\\tSM:${filename}\\tPL:ILM\\tLB:${filename} \
$GENOME $INPUT_FOLDER/fileTemp1_val_1.fq.gz $INPUT_FOLDER/fileTemp2_val_2.fq.gz > $OUTPUT_FOLDER/fileTemp.sam
