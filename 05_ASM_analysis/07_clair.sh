#!/bin/bash -e

#SBATCH --job-name       07_clair
#SBATCH --account        uoo00071
#SBATCH --time           12:00:00                     # Time spend on the running.
#SBATCH --mem-per-cpu    2048                         # Memory/cpu (MB)
#SBATCH --ntasks	 1                            # Number of tasks
#SBATCH --cpus-per-task  8	                      # Number of cores per task
#SBATCH --partition	 large			      # Partition
#SBATCH --output         07_clair.%j.out           # Include the job ID in the names of the
#SBATCH --error          07_clair.%j.err           # Output and error files

module purge
module load Singularity/3.7.1

CT=/opt/nesi/containers/Clair
PWD=/nesi/nobackup/uoo00071/methylation

singularity exec -B $CT -B $PWD $CT/clair.img clair.py callVarBam \
--chkpnt_fn ./07_clair/model \
--ref_fn ./genome/GCA_011100635.1_mTriVul1.pri_genomic_v01.fna \
--bam_fn ./05_mapped/Sandy_merged.bam \
--ctgName "chrTemp" \
--ctgStart startTemp --ctgEnd endTemp \
--call_fn ./07_clair/Sandy_merged_chrTemp_startTemp_endTemp.vcf \
--sampleName Sandy_merged \
--threads 8 \
--threshold 0.2

