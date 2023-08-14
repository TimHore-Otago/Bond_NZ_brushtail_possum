#!/bin/bash -e

#SBATCH --job-name	 06_consensus
#SBATCH --account        uoo00071
#SBATCH --time           01:00:00                     # Time spend on the running
#SBATCH --mem-per-cpu    2048                         # Memory/cpu (MB)
#SBATCH --ntasks         1                            # Number of tasks
#SBATCH --cpus-per-task  8                            # Number of cores per task
#SBATCH --partition	 large                        # Partition
#SBATCH --output         06_consensus.%j.out  # Include the job ID in the names of the
#SBATCH --error          06_consensus.%j.err  # Output and error files

genome=genome/GCA_011100635.1_mTriVul1.pri_genomic_v01m.fna

# Load modules
module load GCC/9.2.0
module load BCFtools
module load seqtk

# Index genome
bcftools mpileup -d 1000 -Ov -f $genome 05_sortedM/fileTemp.bam | bcftools call -c | vcfutils.pl vcf2fq > 06_consensusM/fileTemp.fastq
seqtk seq -aQ64 -q20 -n N 06_consensusM/fileTemp.fastq > 06_consensusM/fileTemp.fasta
