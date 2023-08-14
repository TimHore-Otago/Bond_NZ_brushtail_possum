#!/bin/bash -e

#SBATCH --job-name	 10_whatshap.sh
#SBATCH --account        uoo00071
#SBATCH --time           12:00:00                     # Time spend on the running.
#SBATCH --mem-per-cpu    2048                         # Memory/cpu (MB)
#SBATCH --ntasks         1                            # Number of tasks
#SBATCH --cpus-per-task  16                           # Number of cores per task
#SBATCH --partition	 large                        # Partition
#SBATCH --output         10_whatshap.%j.out           # Include the job ID in the names of the
#SBATCH --error          10_whatshap.%j.err           # Output and error files

module load WhatsHap

whatshap phase --ignore-read-groups --reference genome/GCA_011100635.1_mTriVul1.pri_genomic_v01.fna -o 10_whatshap/Sandy_merged_chrnumTemp_WA.vcf 08_SNVoter/Sandy_merged_chrnumTemp_sorted_SNVoter.vcf_Weighted_Qualities.vcf 05_mapped/Sandy_merged.bam
