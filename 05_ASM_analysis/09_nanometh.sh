#!/bin/bash -e

#SBATCH --job-name	 09_nanometh.sh
#SBATCH --account        uoo00071
#SBATCH --time           48:00:00                     # Time spend on the running.
#SBATCH --mem-per-cpu    2048                         # Memory/cpu (MB)
#SBATCH --ntasks         1                            # Number of tasks
#SBATCH --cpus-per-task  16                           # Number of cores per task
#SBATCH --partition	 large                        # Partition
#SBATCH --output         09_nanometh.%j.out           # Include the job ID in the names of the
#SBATCH --error          09_nanometh.%j.err           # Output and error files

module load SNVoter-NanoMethPhase

nanomethphase methyl_call_processor --MethylCallfile 06_methylation/MethylationCall_Sandy_all.tsv | sort -k1,1 -k2,2n -k3,3n | bgzip > 09_nanometh/Sandy_merged_all.bed.gz && tabix -C -p bed 09_nanometh/Sandy_merged_all.bed.gz
nanomethphase bam2bis --bam 05_mapped/Sandy_merged.bam --reference genome/GCA_011100635.1_mTriVul1.pri_genomic_v01.fna -mc 09_nanometh/Sandy_merged_all.bed.gz -o 09_nanometh/Sandy_merged_all

nanomethphase methyl_call_processor --MethylCallfile 06_methylation/MethylationCall_Sandy_all_1.tsv | sort -k1,1 -k2,2n -k3,3n | bgzip > 09_nanometh/Sandy_merged_all_1.bed.gz && tabix -p bed 09_nanometh/Sandy_merged_all_1.bed.gz
nanomethphase bam2bis --bam 05_mapped/Sandy_merged.bam --reference genome/GCA_011100635.1_mTriVul1.pri_genomic_v01.fna -mc 09_nanometh/Sandy_merged_all_1.bed.gz -o 09_nanometh/Sandy_merged_all_1

nanomethphase methyl_call_processor --MethylCallfile 06_methylation/MethylationCall_Sandy_chr7_s.tsv | sort -k1,1 -k2,2n -k3,3n | bgzip > 09_nanometh/Sandy_merged_chr7_s.bed.gz && tabix -p bed 09_nanometh/Sandy_merged_chr7_s.bed.gz
nanomethphase methyl_call_processor --MethylCallfile 06_methylation/MethylationCall_Sandy_chr7.tsv | sort -k1,1 -k2,2n -k3,3n | bgzip > 09_nanometh/Sandy_merged_chr7.bed.gz && tabix -p bed 09_nanometh/Sandy_merged_chr7.bed.gz
#nanomethphase bam2bis --bam 05_mapped/Sandy_merged.bam --reference genome/GCA_011100635.1_mTriVul1.pri_genomic_v01.fna -mc 09_nanometh/Sandy_merged_chr7_s.bed.gz -o 09_nanometh/Sandy_merged_chr7_s -w chr7
#nanomethphase bam2bis --bam 05_mapped/Sandy_merged.bam --reference genome/GCA_011100635.1_mTriVul1.pri_genomic_v01.fna -mc 09_nanometh/Sandy_merged_chr7.bed.gz -o 09_nanometh/Sandy_merged_chr7 -w chr7
