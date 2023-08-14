#!/bin/bash -e

#SBATCH --job-name       08_SNVoter
#SBATCH --account        uoo00071
#SBATCH --time           24:00:00                     # Time spend on the running.
#SBATCH --mem-per-cpu    2048                         # Memory/cpu (MB)
#SBATCH --ntasks	 1                            # Number of tasks
#SBATCH --cpus-per-task  16	                      # Number of cores per task
#SBATCH --partition	 large			      # Partition
#SBATCH --output         08_SNVoter.%j.out           # Include the job ID in the names of the
#SBATCH --error          08_SNVoter.%j.err           # Output and error files

module load SNVoter-NanoMethPhase

INPUT=07_clair
BAM=05_mapped
GENOME=genome/GCA_011100635.1_mTriVul1.pri_genomic_v01.fna
OUTPUT=08_SNVoter

snvoter prediction --input $INPUT/Sandy_merged_chrnumTemp.vcf \
--bam $BAM/Sandy_merged.bam \
--reference $GENOME --threads 16 \
--output $OUTPUT/Sandy_merged_chrnumTemp_SNVoter.vcf
