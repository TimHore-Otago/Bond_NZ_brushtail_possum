#!/bin/bash -e

#SBATCH --job-name	 11_methphase.sh
#SBATCH --account        uoo00071
#SBATCH --time           24:00:00                     # Time spend on the running.
#SBATCH --mem-per-cpu    2048                         # Memory/cpu (MB)
#SBATCH --ntasks         1                            # Number of tasks
#SBATCH --cpus-per-task  16                           # Number of cores per task
#SBATCH --partition	 large                        # Partition
#SBATCH --output         11_methphase.%j.out           # Include the job ID in the names of the
#SBATCH --error          11_methphase.%j.err           # Output and error files

module load SNVoter-NanoMethPhase

nanomethphase phase -mc 09_nanometh/Sandy_merged_all_1.bed.gz -o 11_methphase/Sandy_merged_chrnumTemp -of bam,methylcall,bam2bis -b 05_mapped/Sandy_merged.bam -r genome/GCA_011100635.1_mTriVul1.pri_genomic_v01.fna -v 10_whatshap/Sandy_merged_chrnumTemp_WA.vcf -t 16 -ms 1
