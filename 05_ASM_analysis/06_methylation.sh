#!/bin/bash -e

#SBATCH --job-name       06_methylation
#SBATCH --account        uoo00071
#SBATCH --time           24:00:00                     # Time spend on the running.
#SBATCH --mem-per-cpu    2048                         # Memory/cpu (MB)
#SBATCH --ntasks	 1                            # Number of tasks
#SBATCH --cpus-per-task  2	                      # Number of cores per task
#SBATCH --partition	 large			      # Partition
#SBATCH --output         06_methylation.%j.out           # Include the job ID in the names of the
#SBATCH --error          06_methylation.%j.err           # Output and error files

# Variables
OUTPUT_FOLDER=06_methylation
FASTQ_FILE=03_trimmed/fileTemp_trimmed.fastq
BAM_FILE=05_mapped/fileTemp_sorted.bam
GENOME_FILE=genome/GCA_011100635.1_mTriVul1.pri_genomic_v01.fna

# Make output directory
mkdir -p $OUTPUT_FOLDER

# Load modules
module load nanopolish

# Run nanopolish
readarray contigs < contigTemp.txt
for contigN in ${contigs[@]}
do
	nanopolish call-methylation -t 1 -q cpg -r $FASTQ_FILE -b $BAM_FILE -g $GENOME_FILE -w ${contigN} > $OUTPUT_FOLDER/MethylationCall_fileTemp_${contigN}.tsv
done
