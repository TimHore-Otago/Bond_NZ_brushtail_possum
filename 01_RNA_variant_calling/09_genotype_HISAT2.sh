#!/bin/bash -e

#SBATCH --job-name	 09_genotype
#SBATCH --account        uoo00071
#SBATCH --time           500:00:00                     # Time spend on the running
#SBATCH --mem-per-cpu    2048                         # Memory/cpu (MB)
#SBATCH --ntasks         1                            # Number of tasks
#SBATCH --cpus-per-task  16                           # Number of cores per task
#SBATCH --partition	 long                         # Partition
#SBATCH --output         09_genotype.%j.out  # Include the job ID in the names of the
#SBATCH --error          09_genotype.%j.err  # Output and error files

# Variables
INPUT_FOLDER=08_combined
GENOME=genome/GCA_011100635.1_mTriVul1.pri_genomic_v01.fna
OUTPUT_FOLDER=09_genotyped

# Load modules
module load GATK

# Running BWA
gatk --java-options "-Xmx32g" GenotypeGVCFs \
   -R $GENOME \
   -V $INPUT_FOLDER/combined.vcf \
   -O $OUTPUT_FOLDER/genotypes.vcf
