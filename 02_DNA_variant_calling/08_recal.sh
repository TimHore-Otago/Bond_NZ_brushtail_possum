#!/bin/bash -e

#SBATCH --job-name	 08_recal
#SBATCH --account        uoo00071
#SBATCH --time           48:00:00                     # Time spend on the running
#SBATCH --mem-per-cpu    2048                         # Memory/cpu (MB)
#SBATCH --ntasks         1                            # Number of tasks
#SBATCH --cpus-per-task  16                           # Number of cores per task
#SBATCH --partition	 large                         # Partition
#SBATCH --output         08_recal.%j.out  # Include the job ID in the names of the
#SBATCH --error          08_recal.%j.err  # Output and error files

# Variables
INPUT_FOLDER=07_genotyped
GENOME=genome/GCA_011100635.1_mTriVul1.pri_genomic_v01.fna
OUTPUT_FOLDER=08_recal

# Load modules
module load GATK

# Running BWA
gatk --java-options "-Xmx32g" ApplyVQSR \
    -R $GENOME \
    -V $INPUT_FOLDER/genotypes.vcf \
    -O $OUTPUT_FOLDER/genotypes_vqsr.vcf \
    --truth-sensitivity-filter-level 99.0 \
    --tranches-file $OUTPUT_FOLDER/genotypes_tranches \
    --recal-file $OUTPUT_FOLDER/genotypes_recal \
    -mode SNP
