#!/bin/bash -e

#SBATCH --job-name	 07_haplotypecaller
#SBATCH --account        uoo00071
#SBATCH --time           300:00:00                    # Time spend on the running
#SBATCH --mem-per-cpu    2048                         # Memory/cpu (MB)
#SBATCH --ntasks         1                            # Number of tasks
#SBATCH --cpus-per-task  36                           # Number of cores per task
#SBATCH --partition	 large                        # Partition
#SBATCH --output         07_haplotypecaller.%j.out  # Include the job ID in the names of the
#SBATCH --error          07_haplotypecaller.%j.err  # Output and error files

# Variables
INPUT_FOLDER=06_grouped
GENOME=genome/GCA_011100635.1_mTriVul1.pri_genomic_v01.fna
OUTPUT_FOLDER=07_haplotypecaller

# Load modules
module load GATK

# Running BWA
gatk --java-options "-Xmx64g" HaplotypeCaller  \
   -R $GENOME \
   -I $INPUT_FOLDER/fileTemp_grouped.bam \
   -O $OUTPUT_FOLDER/fileTemp.vcf.gz \
   -ERC GVCF \
   --create-output-variant-index false
   --read-index $INPUT_FOLDER/fileTemp_grouped.bam.csi
