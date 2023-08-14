#!/bin/bash -e

#SBATCH --job-name	 06_haplotypecaller
#SBATCH --account        uoo00071
#SBATCH --time           168:00:00                    # Time spend on the running
#SBATCH --mem-per-cpu    4096                         # Memory/cpu (MB)
#SBATCH --ntasks         1                            # Number of tasks
#SBATCH --cpus-per-task  32                           # Number of cores per task
#SBATCH --partition	 bigmem                       # Partition
#SBATCH --output         06_haplotypecaller.%j.out  # Include the job ID in the names of the
#SBATCH --error          06_haplotypecaller.%j.err  # Output and error files

# Variables
INPUT_FOLDER=05_grouped
GENOME=genome/GCA_011100635.1_mTriVul1.pri_genomic_v01.fna
OUTPUT_FOLDER=06_haplotypecaller_3

# Load modules
module load GATK

# Running BWA
gatk --java-options "-Xmx128g" HaplotypeCaller  \
   -R $GENOME \
   -I $INPUT_FOLDER/Sandy_S1_grouped.bam \
   -O $OUTPUT_FOLDER/Sandy_S1_grouped.bam.vcf.gz \
   -ERC GVCF \
   --create-output-variant-index false \
   --read-index $INPUT_FOLDER/Sandy_S1_grouped.bam.csi

